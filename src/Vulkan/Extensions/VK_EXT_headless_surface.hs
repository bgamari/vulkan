{-# language CPP #-}
-- | = Name
--
-- VK_EXT_headless_surface - instance extension
--
-- = Registered Extension Number
--
-- 257
--
-- = Revision
--
-- 1
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- -   Requires @VK_KHR_surface@
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2019-03-21
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Ray Smith, Arm
--
-- == Description
--
-- The @VK_EXT_headless_surface@ extension is an instance extension. It
-- provides a mechanism to create 'Vulkan.Extensions.Handles.SurfaceKHR'
-- objects independently of any window system or display device. The
-- presentation operation for a swapchain created from a headless surface
-- is by default a no-op, resulting in no externally-visible result.
--
-- Because there is no real presentation target, future extensions can
-- layer on top of the headless surface to introduce arbitrary or
-- customisable sets of restrictions or features. These could include
-- features like saving to a file or restrictions to emulate a particular
-- presentation target.
--
-- This functionality is expected to be useful for application and driver
-- development because it allows any platform to expose an arbitrary or
-- customisable set of restrictions and features of a presentation engine.
-- This makes it a useful portable test target for applications targeting a
-- wide range of presentation engines where the actual target presentation
-- engines might be scarce, unavailable or otherwise undesirable or
-- inconvenient to use for general Vulkan application development.
--
-- == New Commands
--
-- -   'createHeadlessSurfaceEXT'
--
-- == New Structures
--
-- -   'HeadlessSurfaceCreateInfoEXT'
--
-- == New Bitmasks
--
-- -   'HeadlessSurfaceCreateFlagsEXT'
--
-- == New Enum Constants
--
-- -   'EXT_HEADLESS_SURFACE_EXTENSION_NAME'
--
-- -   'EXT_HEADLESS_SURFACE_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT'
--
-- == Version History
--
-- -   Revision 1, 2019-03-21 (Ray Smith)
--
--     -   Initial draft
--
-- = See Also
--
-- 'HeadlessSurfaceCreateFlagsEXT', 'HeadlessSurfaceCreateInfoEXT',
-- 'createHeadlessSurfaceEXT'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_headless_surface Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_headless_surface  ( createHeadlessSurfaceEXT
                                                  , HeadlessSurfaceCreateInfoEXT(..)
                                                  , HeadlessSurfaceCreateFlagsEXT(..)
                                                  , EXT_HEADLESS_SURFACE_SPEC_VERSION
                                                  , pattern EXT_HEADLESS_SURFACE_SPEC_VERSION
                                                  , EXT_HEADLESS_SURFACE_EXTENSION_NAME
                                                  , pattern EXT_HEADLESS_SURFACE_EXTENSION_NAME
                                                  , SurfaceKHR(..)
                                                  ) where

import Control.Exception.Base (bracket)
import Control.Monad (unless)
import Control.Monad.IO.Class (liftIO)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (nullFunPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import Numeric (showHex)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Control.Monad.IO.Class (MonadIO)
import Data.Bits (Bits)
import Data.Bits (FiniteBits)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import GHC.Generics (Generic)
import GHC.IO.Exception (IOErrorType(..))
import GHC.IO.Exception (IOException(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Vulkan.NamedType ((:::))
import Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Vulkan.Core10.FundamentalTypes (Flags)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (FromCStruct(..))
import Vulkan.Core10.Handles (Instance)
import Vulkan.Core10.Handles (Instance(..))
import Vulkan.Dynamic (InstanceCmds(pVkCreateHeadlessSurfaceEXT))
import Vulkan.Core10.Handles (Instance_T)
import Vulkan.Core10.Enums.Result (Result)
import Vulkan.Core10.Enums.Result (Result(..))
import Vulkan.Core10.Enums.StructureType (StructureType)
import Vulkan.Extensions.Handles (SurfaceKHR)
import Vulkan.Extensions.Handles (SurfaceKHR(..))
import Vulkan.CStruct (ToCStruct)
import Vulkan.CStruct (ToCStruct(..))
import Vulkan.Exception (VulkanException(..))
import Vulkan.Zero (Zero)
import Vulkan.Zero (Zero(..))
import Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT))
import Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Vulkan.Extensions.Handles (SurfaceKHR(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateHeadlessSurfaceEXT
  :: FunPtr (Ptr Instance_T -> Ptr HeadlessSurfaceCreateInfoEXT -> Ptr AllocationCallbacks -> Ptr SurfaceKHR -> IO Result) -> Ptr Instance_T -> Ptr HeadlessSurfaceCreateInfoEXT -> Ptr AllocationCallbacks -> Ptr SurfaceKHR -> IO Result

-- | vkCreateHeadlessSurfaceEXT - Create a headless
-- 'Vulkan.Extensions.Handles.SurfaceKHR' object
--
-- == Valid Usage (Implicit)
--
-- -   #VUID-vkCreateHeadlessSurfaceEXT-instance-parameter# @instance@
--     /must/ be a valid 'Vulkan.Core10.Handles.Instance' handle
--
-- -   #VUID-vkCreateHeadlessSurfaceEXT-pCreateInfo-parameter#
--     @pCreateInfo@ /must/ be a valid pointer to a valid
--     'HeadlessSurfaceCreateInfoEXT' structure
--
-- -   #VUID-vkCreateHeadlessSurfaceEXT-pAllocator-parameter# If
--     @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid pointer
--     to a valid 'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   #VUID-vkCreateHeadlessSurfaceEXT-pSurface-parameter# @pSurface@
--     /must/ be a valid pointer to a
--     'Vulkan.Extensions.Handles.SurfaceKHR' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'HeadlessSurfaceCreateInfoEXT', 'Vulkan.Core10.Handles.Instance',
-- 'Vulkan.Extensions.Handles.SurfaceKHR'
createHeadlessSurfaceEXT :: forall io
                          . (MonadIO io)
                         => -- | @instance@ is the instance to associate the surface with.
                            Instance
                         -> -- | @pCreateInfo@ is a pointer to a 'HeadlessSurfaceCreateInfoEXT' structure
                            -- containing parameters affecting the creation of the surface object.
                            HeadlessSurfaceCreateInfoEXT
                         -> -- | @pAllocator@ is the allocator used for host memory allocated for the
                            -- surface object when there is no more specific allocator available (see
                            -- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
                            ("allocator" ::: Maybe AllocationCallbacks)
                         -> io (SurfaceKHR)
createHeadlessSurfaceEXT instance' createInfo allocator = liftIO . evalContT $ do
  let vkCreateHeadlessSurfaceEXTPtr = pVkCreateHeadlessSurfaceEXT (instanceCmds (instance' :: Instance))
  lift $ unless (vkCreateHeadlessSurfaceEXTPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkCreateHeadlessSurfaceEXT is null" Nothing Nothing
  let vkCreateHeadlessSurfaceEXT' = mkVkCreateHeadlessSurfaceEXT vkCreateHeadlessSurfaceEXTPtr
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPSurface <- ContT $ bracket (callocBytes @SurfaceKHR 8) free
  r <- lift $ vkCreateHeadlessSurfaceEXT' (instanceHandle (instance')) pCreateInfo pAllocator (pPSurface)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pSurface <- lift $ peek @SurfaceKHR pPSurface
  pure $ (pSurface)


-- | VkHeadlessSurfaceCreateInfoEXT - Structure specifying parameters of a
-- newly created headless surface object
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'HeadlessSurfaceCreateFlagsEXT',
-- 'Vulkan.Core10.Enums.StructureType.StructureType',
-- 'createHeadlessSurfaceEXT'
data HeadlessSurfaceCreateInfoEXT = HeadlessSurfaceCreateInfoEXT
  { -- | @flags@ is reserved for future use.
    --
    -- #VUID-VkHeadlessSurfaceCreateInfoEXT-flags-zerobitmask# @flags@ /must/
    -- be @0@
    flags :: HeadlessSurfaceCreateFlagsEXT }
  deriving (Typeable, Eq)
#if defined(GENERIC_INSTANCES)
deriving instance Generic (HeadlessSurfaceCreateInfoEXT)
#endif
deriving instance Show HeadlessSurfaceCreateInfoEXT

instance ToCStruct HeadlessSurfaceCreateInfoEXT where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p HeadlessSurfaceCreateInfoEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr HeadlessSurfaceCreateFlagsEXT)) (flags)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f

instance FromCStruct HeadlessSurfaceCreateInfoEXT where
  peekCStruct p = do
    flags <- peek @HeadlessSurfaceCreateFlagsEXT ((p `plusPtr` 16 :: Ptr HeadlessSurfaceCreateFlagsEXT))
    pure $ HeadlessSurfaceCreateInfoEXT
             flags

instance Storable HeadlessSurfaceCreateInfoEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero HeadlessSurfaceCreateInfoEXT where
  zero = HeadlessSurfaceCreateInfoEXT
           zero


-- | VkHeadlessSurfaceCreateFlagsEXT - Reserved for future use
--
-- = Description
--
-- 'HeadlessSurfaceCreateFlagsEXT' is a bitmask type for setting a mask,
-- but is currently reserved for future use.
--
-- = See Also
--
-- 'HeadlessSurfaceCreateInfoEXT'
newtype HeadlessSurfaceCreateFlagsEXT = HeadlessSurfaceCreateFlagsEXT Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)



instance Show HeadlessSurfaceCreateFlagsEXT where
  showsPrec p = \case
    HeadlessSurfaceCreateFlagsEXT x -> showParen (p >= 11) (showString "HeadlessSurfaceCreateFlagsEXT 0x" . showHex x)

instance Read HeadlessSurfaceCreateFlagsEXT where
  readPrec = parens (choose []
                     +++
                     prec 10 (do
                       expectP (Ident "HeadlessSurfaceCreateFlagsEXT")
                       v <- step readPrec
                       pure (HeadlessSurfaceCreateFlagsEXT v)))


type EXT_HEADLESS_SURFACE_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_EXT_HEADLESS_SURFACE_SPEC_VERSION"
pattern EXT_HEADLESS_SURFACE_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_HEADLESS_SURFACE_SPEC_VERSION = 1


type EXT_HEADLESS_SURFACE_EXTENSION_NAME = "VK_EXT_headless_surface"

-- No documentation found for TopLevel "VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME"
pattern EXT_HEADLESS_SURFACE_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_HEADLESS_SURFACE_EXTENSION_NAME = "VK_EXT_headless_surface"

