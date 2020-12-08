module Bespoke.MarshalParams
  ( marshalParams
  ) where

import qualified Data.HashMap.Strict           as Map
import qualified Data.Text                     as T
import           Polysemy
import           Relude                  hiding ( Handle
                                                , Type
                                                , uncons
                                                )
import           Relude.Extra.Map

import           Bespoke
import           CType
import           Marshal.Scheme
import           Spec.Parse

marshalParams :: Spec t -> Sem r MarshalParams
marshalParams spec@Spec {..} = do
  bespokeSchemes <- bespokeSchemes spec
  let
    aliasMap :: Map.HashMap CName CName
    aliasMap = fromList [ (aName, aTarget) | Alias {..} <- toList specAliases ]
    resolveAlias :: CName -> CName
    resolveAlias t = maybe t resolveAlias (Map.lookup t aliasMap) -- TODO: handle cycles!
    bitmaskNames :: HashSet CName
    bitmaskNames = fromList
      [ n
      | Enum {..}      <- toList specEnums
      , ABitmask flags <- pure eType
      , n              <- [eName, flags]
      ]
    isBitmask     = (`member` bitmaskNames)
    isBitmaskType = \case
      TypeName n -> isBitmask n || isBitmask (resolveAlias n)
      _          -> False
    nonDispatchableHandleNames :: HashSet CName
    nonDispatchableHandleNames = fromList
      [ hName
      | Handle {..} <- toList specHandles
      , hDispatchable == NonDispatchable
      ]
    isNonDispatchableHandle     = (`member` nonDispatchableHandleNames)
    isNonDispatchableHandleType = \case
      TypeName n ->
        isNonDispatchableHandle n || isNonDispatchableHandle (resolveAlias n)
      _ -> False
    dispatchableHandleNames :: HashSet CName
    dispatchableHandleNames = fromList
      [ hName
      | Handle {..} <- toList specHandles
      , hDispatchable == Dispatchable
      ]
    -- TODO Remove, these will not be defaultable once we bundle the
    -- command pointers
    isDispatchableHandle     = (`member` dispatchableHandleNames)
    isDispatchableHandleType = \case
      TypeName n ->
        isDispatchableHandle n || isDispatchableHandle (resolveAlias n)
      _ -> False
    atomNames :: HashSet CName
    atomNames  = fromList [ atName | Atom {..} <- toList specAtoms ]
    isAtomType = \case
      TypeName n -> n `member` atomNames
      _          -> False
  pure MarshalParams
    { isDefaultable       = isDefaultable'
                            <||> isBitmaskType
                            <||> isNonDispatchableHandleType
                            <||> isDispatchableHandleType
                            <||> isAtomType
    , isPassAsPointerType = isPassAsPointerType'
    , getBespokeScheme    = \p a ->
      asum . fmap (\(BespokeScheme f) -> f p a) $ bespokeSchemes
    }

----------------------------------------------------------------
-- Bespoke Vulkan stuff
----------------------------------------------------------------

isDefaultable' :: CType -> Bool
isDefaultable' t =
  isDefaultableForeignType t || isIntegral t || isFloating t || hasUnknownEnum t

isIntegral :: CType -> Bool
isIntegral =
  (`elem` [ Int
          , Char
          , TypeName "uint8_t"
          , TypeName "uint16_t"
          , TypeName "uint32_t"
          , TypeName "uint64_t"
          , TypeName "int8_t"
          , TypeName "int16_t"
          , TypeName "int32_t"
          , TypeName "int64_t"
          , TypeName "size_t"
          , TypeName "VkDeviceSize"
          , TypeName "VkDeviceAddress"
          , TypeName "VkDeviceOrHostAddressConstKHR"
          , TypeName "VkDeviceOrHostAddressKHR"
          , TypeName "VkBool32"
          , TypeName "LARGE_INTEGER"
          -- TODO: Get these from spec
          -- Base types
          , TypeName "XrTime"
          , TypeName "XrDuration"
          , TypeName "XrBool32"
          ]
  )

isFloating :: CType -> Bool
isFloating = (`elem` [Float, Double])

isDefaultableForeignType :: CType -> Bool
isDefaultableForeignType t =
  (      t
    `elem` [ TypeName "HANDLE"
           , TypeName "DWORD"
           , TypeName "LPCWSTR"
           , Ptr CType.Const (TypeName "SECURITY_ATTRIBUTES")
           ]
    )
    || case t of
         TypeName (CName n) -> "PFN_" `T.isPrefixOf` n
         _                  -> False

-- TODO: These shouldn't be defaultable, probably a spec oversight
hasUnknownEnum :: CType -> Bool
hasUnknownEnum = (`elem` [TypeName "VkFormat", TypeName "VkObjectType"])

-- | Is this a type we don't want to marshal
isPassAsPointerType' :: CType -> Bool
isPassAsPointerType' = \case
  TypeName n ->
    n
      `elem` [ "MirConnection"
             , "wl_display"
             , "wl_surface"
             , "Display"
             , "xcb_connection_t"
             , "AHardwareBuffer"
             , "ANativeWindow"
             , "CAMetalLayer"
             , "SECURITY_ATTRIBUTES"
             , "IDirectFB"
             , "IDirectFBSurface"
             -- TODO: remove these
             , "VkInstanceCreateInfo"
             , "VkAllocationCallbacks"
             , "VkDeviceCreateInfo"
             , "VkAllocationCallbacks"
             , "LARGE_INTEGER"
             , "timespec"
             ]
  _ -> False

----------------------------------------------------------------
-- Utils
----------------------------------------------------------------

(<||>) :: Applicative f => f Bool -> f Bool -> f Bool
(<||>) = liftA2 (||)
