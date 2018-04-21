{-# LANGUAGE ApplicativeDo     #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms   #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}

module Write.Module
  ( Module(..)
  , ReexportedModule(..)
  , writeModules
  )where

import           Control.Applicative
import           Control.Arrow                            ((&&&))
import           Data.Char
import           Data.Functor.Extra
import           Data.List.Extra
import qualified Data.Map                                 as Map
import           Data.Maybe
import           Data.Text                                (Text)
import qualified Data.Text.Extra                          as T
import           Data.Text.Prettyprint.Doc
import           Prelude                                  hiding (Enum)
import           Text.InterpolatedString.Perl6.Unindented

import           Documentation
import           Documentation.Haddock
import           Write.Element
import           Write.Util

data Module = Module
  { mName              :: Text
  , mWriteElements     :: [WriteElement]
  , mReexports         :: [Export]
  , mReexportedModules :: [ReexportedModule]
  }

data ReexportedModule = ReexportedModule
  { rmName  :: Text
  , rmGuard :: Maybe Text
  }
  deriving (Show)

writeModules
  :: (Documentee -> Maybe Documentation)
  -- Find some documentation
  -> [Module]
  -> [Doc ()]
writeModules findDoc ms =
  let moduleMapHN = findModuleHN ms
      moduleMap = findModule ms
      getDoc :: Text -> Documentee -> Maybe Haddock
      getDoc = getModuleDoc findDoc moduleMap
  in ms <&> (\m -> writeModule (getDoc (mName m)) moduleMapHN m)

getModuleDoc
  :: (Documentee -> Maybe Documentation)
  -- ^ find docs
  -> (Text -> Maybe Text)
  -- ^ Find the module exporting a name
  -> Text
  -- ^ The module name we are rendering
  -> (Documentee -> Maybe Haddock)
  -- ^ Get the rendered haddocks
getModuleDoc findDoc findModule thisModule name = do
  doc <- findDoc name
  let getLoc :: Text -> DocumenteeLocation
      getLoc n = case findModule n of
        Nothing -> Unknown
        Just m | m == thisModule -> ThisModule
               | otherwise       -> OtherModule m
  case documentationToHaddock getLoc doc of
    Left  _ -> Nothing -- TODO Improve
    Right h -> pure h

writeModule
  :: (Documentee -> Maybe Haddock)
  -> (HaskellName -> Maybe (Text, Export))
  -> Module
  -> Doc ()
writeModule getDoc getModule m@Module{..} = [qci|
  \{-# language Strict #-}
  \{-# language CPP #-}
  {vcat $ moduleExtensions m}

  module {mName}
    ( {indent (-2) $ separatedSections ","
         [ (Nothing, moduleExports m)
         ]}{vcat $ moduleReexports (null (moduleExports m)) m}
    ) where

  {vcat $ moduleImports m}
  {vcat $ importReexportedModule <$> mReexportedModules}

  {vcat $ moduleInternalImports getModule m}

  {vcatPara $ (flip weDoc getDoc) <$> mWriteElements}
  |]

moduleExports :: Module -> [Doc ()]
moduleExports Module {..} =
  mapMaybe exportHaskellName (weProvides =<< mWriteElements)

moduleReexports :: Bool -> Module -> [Doc ()]
moduleReexports first Module {..} =
  mapMaybe exportHaskellName mReexports
    ++ zipWith reexportModule (first : repeat False) mReexportedModules

reexportModule :: Bool -> ReexportedModule -> Doc ()
reexportModule first ReexportedModule {..} = case rmGuard of
  Nothing -> [qci|{indent 2 $ if first then " " else ","} module {rmName}|]
  Just g  -> indent (-100) [qci|
      #if defined({g})
        {if first then " " else "," :: Doc a} module {rmName}
      #endif
    |]

importReexportedModule :: ReexportedModule -> Doc ()
importReexportedModule ReexportedModule {..} = case rmGuard of
  Nothing -> [qci|import {rmName}|]
  Just g  -> [qci|
      #if defined({g})
      import {rmName}
      #endif
    |]

exportHaskellName :: Export -> Maybe (Doc ())
exportHaskellName e =
  let s = case unExport e of
        TypeName n -> Just (pretty n)
        TermName n | isConstructor n -> Nothing
                   | otherwise       -> Just (pretty n)
        PatternName n -> Just ("pattern" <+> pretty n)
  in  case e of
        WithConstructors    _ -> (<> "(..)") <$> s
        WithoutConstructors _ -> s

isConstructor :: Text -> Bool
isConstructor = \case
  T.Cons x _ | isUpper x -> True
  _                      -> False

moduleImports :: Module -> [Doc ()]
moduleImports Module {..} =
  let unqualifiedImportMap = Map.fromListWith
        union
        ((iModule &&& iImports) <$> [i | i@Import{} <- weImports =<< mWriteElements])
      qualifiedImportMap = Map.fromListWith
        union
        ((iModule &&& iImports) <$> [i | i@QualifiedImport{} <- weImports =<< mWriteElements])
      makeImport :: Doc () -> (Text, [Text]) -> Doc ()
      makeImport qualifier (moduleName, is) = [qci|
         import{qualifier}{pretty moduleName}
           ( {indent (-2) . vcat . intercalatePrepend "," $ pretty <$> is}
           )
       |]
  in (makeImport " "           <$> Map.assocs unqualifiedImportMap) ++
     (makeImport " qualified " <$> Map.assocs qualifiedImportMap)

findModuleHN :: [Module] -> HaskellName -> Maybe (Text, Export)
findModuleHN ms =
  let nameMap = Map.fromList
        [ (unExport e, (mName m, e))
        | m  <- ms
        , we <- mWriteElements m
        , e  <- weProvides we
        ]
  in  (`Map.lookup` nameMap)

findModule :: [Module] -> Text -> Maybe Text
findModule ms =
  let nameMap = Map.fromList
        [ (e, mName m)
        | m  <- ms
        , we <- mWriteElements m
        , e  <- unHaskellName . unExport <$> weProvides we
        ]
  in  (`Map.lookup` nameMap)

moduleInternalImports
  :: (HaskellName -> Maybe (Text, Export))
  -- ^ which module is this name from
  -> Module
  -> [Doc ()]
moduleInternalImports nameModule Module {..} =
  let depends = Map.fromListWith
        (<>)
        [ (m, [e])
        | d      <- nubOrd (weDepends =<< mWriteElements)
        , Just (m, e) <- [nameModule d]
        , d `notElem` (unExport <$> (weProvides =<< mWriteElements))
        ]
  in  Map.assocs depends <&> \(moduleName, is) -> [qci|
        import {pretty moduleName}
          ( {indent (-2) . vcat . intercalatePrepend "," $ mapMaybe exportHaskellName is}
          )
|]

moduleExtensions :: Module -> [Doc ()]
moduleExtensions Module{..} =
  let es = nubOrd $ weExtensions =<< mWriteElements
  in es <&> \e -> [qci|\{-# language {e} #-}|]

