module Render.Names
  ( HasRenderedNames
  , withRenderedNames
  , isStructOrUnion
  , isNewtype
  , getResolveAlias
  ) where

import           Relude                  hiding ( ask )
import           Data.List                      ( partition )
import           Polysemy
import           Polysemy.Input
import           Polysemy.Reader
import qualified Data.HashSet                  as Set
import qualified Data.HashMap.Strict           as Map

import           Haskell.Name
import           Render.Element
import           Spec.Types

type HasRenderedNames r = MemberWithError (Input RenderedNames) r

data RenderedNames = RenderedNames
  { rnStructs                :: HashSet HName
  , rnUnions                 :: HashSet HName
  , rnEnums                  :: HashSet HName
  , rnNonDispatchableHandles :: HashSet HName
  , rnDispatchableHandles    :: HashSet HName
  -- , rnConstructorParents     :: HashMap HName HName
  --   -- ^ To import the constructors of a type @T@ we can't just import @T(..)@
  --   -- because @T@ might be a type alias, this maps typenames to resolved
  --   -- typenames.
  , rnResolveAlias           :: HName -> HName
  }

withRenderedNames
  :: HasRenderParams r => Spec -> Sem (Input RenderedNames ': r) a -> Sem r a
withRenderedNames Spec {..} a = do
  RenderParams {..} <- ask
  let
    rnStructs = Set.fromList (mkTyName . sName <$> toList specStructs)
    rnUnions  = Set.fromList (mkTyName . sName <$> toList specUnions)
    rnEnums   = Set.fromList (mkTyName . eName <$> toList specEnums)
    (dispHandles, nonDispHandles) =
      partition ((== Dispatchable) . hDispatchable) $ toList specHandles
    rnDispatchableHandles = Set.fromList (mkTyName . hName <$> dispHandles)
    rnNonDispatchableHandles =
      Set.fromList (mkTyName . hName <$> nonDispHandles)
    aliasMap = Map.fromList
      [ (mkTyName aName, mkTyName aTarget)
      | Alias {..} <- toList specAliases
      , TypeAlias == aType
      ]
    -- TODO: Handle alias cycles!
    rnResolveAlias n = maybe n rnResolveAlias (Map.lookup n aliasMap)
    rnConstructorParents =
      Map.fromList
        $  [ (n, n)
           | Struct {..} <- toList specStructs
           , let n = mkTyName sName
           ]
        <> [ (n, n)
           | Struct {..} <- toList specUnions
           , let n = mkTyName sName
           ]
        <> [ (n, n) | Enum {..} <- toList specEnums, let n = mkTyName eName ]
        <> [ (n, n)
           | Handle {..} <- toList specHandles
           , NonDispatchable == hDispatchable
           , let n = mkTyName hName
           ]
  runInputConst RenderedNames { .. } a

isStructOrUnion :: HasRenderedNames r => HName -> Sem r Bool
isStructOrUnion n = do
  RenderedNames {..} <- input
  let n' = rnResolveAlias n
  pure (Set.member n' rnStructs || Set.member n' rnUnions)

isNewtype :: HasRenderedNames r => HName -> Sem r Bool
isNewtype n = do
  RenderedNames {..} <- input
  let n' = rnResolveAlias n
  pure (Set.member n' rnNonDispatchableHandles || Set.member n' rnEnums)

getResolveAlias :: HasRenderedNames r => Sem r (HName -> HName)
getResolveAlias = rnResolveAlias <$> input

    -- aliasMap = Map.fromList
    --   [ (aName, aTarget)
    --   | Alias {..} <- toList specAliases
    --   , TypeAlias == aType
    --   ]
    -- -- TODO: Handle alias cycles!
    -- resolveAlias :: Text -> Text
    -- resolveAlias :: CName -> CName
    -- resolveAlias n = maybe n resolveAlias (Map.lookup n aliasMap)
    -- siGetConstructorParent n = case Map.lookup n aliasMap of
    --   Nothing -> Map.lookup n constructorMap
    --   Just n' -> siGetConstructorParent n'

