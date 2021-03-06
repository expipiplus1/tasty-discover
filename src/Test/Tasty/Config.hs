-- | Preprocessor configuration.

module Test.Tasty.Config (
  Config(..)
, defaultConfig
, options
) where

import System.Console.GetOpt (ArgDescr (ReqArg, NoArg) , OptDescr (Option))

import Test.Tasty.Type (Config(..))

-- | The empty configuration.
defaultConfig :: Config
defaultConfig = Config Nothing False

-- | All configuration options.
options :: [OptDescr (Config -> Config)]
options = [
    Option [] ["module-suffix"]
      (ReqArg (\s c -> c {configModuleSuffix = Just s}) "SUFFIX") ""
  , Option [] ["no-module-suffix"]
      (NoArg $ \c -> c {noModuleSuffix = True}) ""
  ]
