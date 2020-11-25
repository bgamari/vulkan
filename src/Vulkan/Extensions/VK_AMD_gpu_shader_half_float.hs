{-# language CPP #-}
-- | = Name
--
-- VK_AMD_gpu_shader_half_float - device extension
--
-- = Registered Extension Number
--
-- 37
--
-- = Revision
--
-- 2
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- = Deprecation state
--
-- -   /Deprecated/ by @VK_KHR_shader_float16_int8@ extension
--
--     -   Which in turn was /promoted/ to
--         <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#versions-1.2-promotions Vulkan 1.2>
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2019-04-11
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Interactions and External Dependencies__]
--
--     -   This extension requires
--         {spirv}\/AMD\/SPV_AMD_gpu_shader_half_float.html[@SPV_AMD_gpu_shader_half_float@]
--
-- [__Contributors__]
--
--     -   Daniel Rakos, AMD
--
--     -   Dominik Witczak, AMD
--
--     -   Donglin Wei, AMD
--
--     -   Graham Sellers, AMD
--
--     -   Qun Lin, AMD
--
--     -   Rex Xu, AMD
--
-- == Description
--
-- This extension adds support for using half float variables in shaders.
--
-- == Deprecation by @VK_KHR_shader_float16_int8@
--
-- Functionality in this extension was included in
-- @VK_KHR_shader_float16_int8@ extension, when
-- 'Vulkan.Extensions.VK_KHR_shader_float16_int8.PhysicalDeviceShaderFloat16Int8FeaturesKHR'::@shaderFloat16@
-- is enabled.
--
-- == New Enum Constants
--
-- -   'AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME'
--
-- -   'AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION'
--
-- == Version History
--
-- -   Revision 2, 2019-04-11 (Tobias Hector)
--
--     -   Marked as deprecated
--
-- -   Revision 1, 2016-09-21 (Dominik Witczak)
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
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_AMD_gpu_shader_half_float Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_AMD_gpu_shader_half_float  ( AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION
                                                       , pattern AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION
                                                       , AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME
                                                       , pattern AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME
                                                       ) where

import Data.String (IsString)

type AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION = 2

-- No documentation found for TopLevel "VK_AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION"
pattern AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION :: forall a . Integral a => a
pattern AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION = 2


type AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME = "VK_AMD_gpu_shader_half_float"

-- No documentation found for TopLevel "VK_AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME"
pattern AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME = "VK_AMD_gpu_shader_half_float"

