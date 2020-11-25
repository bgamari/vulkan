{-# language CPP #-}
-- | = Name
--
-- VK_AMD_shader_image_load_store_lod - device extension
--
-- = Registered Extension Number
--
-- 47
--
-- = Revision
--
-- 1
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2017-08-21
--
-- [__Interactions and External Dependencies__]
--
--     -   This extension requires
--         {spirv}\/AMD\/SPV_AMD_shader_image_load_store_lod.html[@SPV_AMD_shader_image_load_store_lod@]
--
--     -   This extension provides API support for
--         <https://www.khronos.org/registry/OpenGL/extensions/AMD/AMD_shader_image_load_store_lod.txt GL_AMD_shader_image_load_store_lod>
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Dominik Witczak, AMD
--
--     -   Qun Lin, AMD
--
--     -   Rex Xu, AMD
--
-- == Description
--
-- This extension adds support for the following SPIR-V extension in
-- Vulkan:
--
-- -   {spirv}\/AMD\/SPV_AMD_shader_image_load_store_lod.html[@SPV_AMD_shader_image_load_store_lod@]
--
-- == New Enum Constants
--
-- -   'AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME'
--
-- -   'AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION'
--
-- == Version History
--
-- -   Revision 1, 2017-08-21 (Dominik Witczak)
--
--     -   Initial draft
--
-- = See Also
--
-- No cross-references are available
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_AMD_shader_image_load_store_lod Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_AMD_shader_image_load_store_lod  ( AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION
                                                             , pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION
                                                             , AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME
                                                             , pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME
                                                             ) where

import Data.String (IsString)

type AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION"
pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION :: forall a . Integral a => a
pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION = 1


type AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME = "VK_AMD_shader_image_load_store_lod"

-- No documentation found for TopLevel "VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME"
pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME = "VK_AMD_shader_image_load_store_lod"

