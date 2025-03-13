-- This file is not meant to ever land in tree but is only designed to generate the code for this PR.
-- Run this in the devShell, using `runhaskell transpose-projects.hs`
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad (filterM)
import Data.Either
import Data.Fix
import Data.Maybe (mapMaybe)
import Data.Text (Text, pack, toLower, unpack)
import qualified Data.Text.IO as T
import GHC.Exts (fromList)
import Nix.Expr
import Nix.Expr.Types (Binding, NExprF)
import Nix.Parser
import Nix.Prelude (NonEmpty ((:|)))
import Nix.Pretty
import Nix.Utils (Path (Path))
import System.Directory (createDirectoryIfMissing, doesDirectoryExist, listDirectory)
import System.FilePath (takeExtension, (</>))

-- Context available in all transformations
data TContext = TContext
  { projectName :: Text
  }

-- Deduce a program name from the project name
programName :: Text -> Text
programName = toLower

-- The string name of an attribute
attrName str = StaticKey (VarName str)

-- String literal
nStr s = (Fix (NStr (DoubleQuoted [Plain s])))

-- An attribute with a string name and a value
binding key value = NamedVar (attrName key :| []) value nullPos

-- `{}`
emptyAttrs = Fix $ NSet NonRecursive []

programModule name packages =
  Fix
    ( NAbs
        ( ParamSet
            (Just (VarName "args"))
            Variadic
            [(VarName "pkgs", Nothing), (VarName "lib", Nothing), (VarName "sources", Nothing)]
        )
        ( Fix
            ( NSet
                NonRecursive
                [(NamedVar (fromList [attrName "options", attrName "programs", attrName name]) packages nullPos)]
            )
        )
    )

transformAttributeNames :: TContext -> Binding (Fix NExprF) -> Maybe (Binding (Fix NExprF))
transformAttributeNames context (NamedVar path value pos) = case path of
  ((StaticKey (VarName "packages")) :| _) ->
    Just $
      NamedVar
        ( fromList
            [ attrName "nixos",
              attrName "module",
              attrName "programs",
              attrName name
            ]
        )
        ( Fix $
            NSet
              NonRecursive
              [ binding "name" (nStr $ name),
                binding "module" (programModule name value),
                binding "examples" emptyAttrs,
                binding "links" emptyAttrs
              ]
        )
        pos
  _ -> Just $ NamedVar path value pos
  where
    name = programName $ projectName context

transformDefaultNix :: TContext -> NExpr -> NExpr
transformDefaultNix context (Fix (NAbs params (Fix (NSet r bindings)))) =
  (Fix (NAbs params (Fix (NSet r (mapMaybe (transformAttributeNames context) bindings)))))

-- Process a single default.nix file
processFile :: TContext -> FilePath -> IO String
processFile context file = do
  parseResult <- parseNixFile $ Path file
  case parseResult of
    Right parsedExpr -> do
      let transformedExpr = (transformDefaultNix context) parsedExpr
      putStrLn $ show transformedExpr
      return $ show $ prettyNix transformedExpr
    Left err -> do
      putStrLn $ "Failed to parse: " ++ file ++ "\n" ++ show err
      return ""

processDirectory :: FilePath -> IO ()
processDirectory dir = do
  putStrLn dir
  let context = TContext (pack dir)
  createDirectoryIfMissing True $ "projects" </> dir
  newFileContent <- processFile context $ ("projects-old" </> dir </> "default.nix")
  writeFile ("projects" </> dir </> "default.nix") newFileContent

main :: IO ()
main = do
  files <- listDirectory "projects-old"
  -- let files = ["wireguard"]
  oldProjectDirs <- filterM (doesDirectoryExist . ("projects-old" </>)) files
  mapM_ processDirectory oldProjectDirs
