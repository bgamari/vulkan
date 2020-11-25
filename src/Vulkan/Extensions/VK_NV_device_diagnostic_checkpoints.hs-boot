{-# language CPP #-}
-- | = Name
--
-- VK_NV_device_diagnostic_checkpoints - device extension
--
-- = Registered Extension Number
--
-- 207
--
-- = Revision
--
-- 2
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- -   Requires @VK_KHR_get_physical_device_properties2@
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2018-07-16
--
-- [__Contributors__]
--
--     -   Oleg Kuznetsov, NVIDIA
--
--     -   Alex Dunn, NVIDIA
--
--     -   Jeff Bolz, NVIDIA
--
--     -   Eric Werness, NVIDIA
--
--     -   Daniel Koch, NVIDIA
--
-- == Description
--
-- This extension allows applications to insert markers in the command
-- stream and associate them with custom data.
--
-- If a device lost error occurs, the application /may/ then query the
-- implementation for the last markers to cross specific
-- implementation-defined pipeline stages, in order to narrow down which
-- commands were executing at the time and might have caused the failure.
--
-- == New Commands
--
-- -   'cmdSetCheckpointNV'
--
-- -   'getQueueCheckpointDataNV'
--
-- == New Structures
--
-- -   'CheckpointDataNV'
--
-- -   Extending
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.QueueFamilyProperties2':
--
--     -   'QueueFamilyCheckpointPropertiesNV'
--
-- == New Enum Constants
--
-- -   'NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME'
--
-- -   'NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CHECKPOINT_DATA_NV'
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV'
--
-- == Version History
--
-- -   Revision 1, 2018-07-16 (Nuno Subtil)
--
--     -   Internal revisions
--
-- -   Revision 2, 2018-07-16 (Nuno Subtil)
--
--     -   ???
--
-- = See Also
--
-- 'CheckpointDataNV', 'QueueFamilyCheckpointPropertiesNV',
-- 'cmdSetCheckpointNV', 'getQueueCheckpointDataNV'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_NV_device_diagnostic_checkpoints Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_NV_device_diagnostic_checkpoints  ( CheckpointDataNV
                                                              , QueueFamilyCheckpointPropertiesNV
                                                              ) where

import Data.Kind (Type)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
data CheckpointDataNV

instance ToCStruct CheckpointDataNV
instance Show CheckpointDataNV

instance FromCStruct CheckpointDataNV


data QueueFamilyCheckpointPropertiesNV

instance ToCStruct QueueFamilyCheckpointPropertiesNV
instance Show QueueFamilyCheckpointPropertiesNV

instance FromCStruct QueueFamilyCheckpointPropertiesNV

