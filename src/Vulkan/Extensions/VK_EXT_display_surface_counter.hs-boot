{-# language CPP #-}
-- | = Name
--
-- VK_EXT_display_surface_counter - instance extension
--
-- = Registered Extension Number
--
-- 91
--
-- = Revision
--
-- 1
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- -   Requires @VK_KHR_display@
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2016-12-13
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Pierre Boudier, NVIDIA
--
--     -   James Jones, NVIDIA
--
--     -   Damien Leone, NVIDIA
--
--     -   Pierre-Loup Griffais, Valve
--
--     -   Daniel Vetter, Intel
--
-- == Description
--
-- This extension defines a vertical blanking period counter associated
-- with display surfaces. It provides a mechanism to query support for such
-- a counter from a 'Vulkan.Extensions.Handles.SurfaceKHR' object.
--
-- == New Commands
--
-- -   'getPhysicalDeviceSurfaceCapabilities2EXT'
--
-- == New Structures
--
-- -   'SurfaceCapabilities2EXT'
--
-- == New Enums
--
-- -   'SurfaceCounterFlagBitsEXT'
--
-- == New Bitmasks
--
-- -   'SurfaceCounterFlagsEXT'
--
-- == New Enum Constants
--
-- -   'EXT_DISPLAY_SURFACE_COUNTER_EXTENSION_NAME'
--
-- -   'EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT'
--
-- == Version History
--
-- -   Revision 1, 2016-12-13 (James Jones)
--
--     -   Initial draft
--
-- = See Also
--
-- 'SurfaceCapabilities2EXT', 'SurfaceCounterFlagBitsEXT',
-- 'SurfaceCounterFlagsEXT', 'getPhysicalDeviceSurfaceCapabilities2EXT'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_display_surface_counter Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_display_surface_counter  ( SurfaceCapabilities2EXT
                                                         , SurfaceCounterFlagBitsEXT
                                                         , SurfaceCounterFlagsEXT
                                                         ) where

import Data.Kind (Type)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
data SurfaceCapabilities2EXT

instance ToCStruct SurfaceCapabilities2EXT
instance Show SurfaceCapabilities2EXT

instance FromCStruct SurfaceCapabilities2EXT


data SurfaceCounterFlagBitsEXT

type SurfaceCounterFlagsEXT = SurfaceCounterFlagBitsEXT

