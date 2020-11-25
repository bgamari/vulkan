{-# language CPP #-}
-- | = Name
--
-- VK_AMD_gcn_shader - device extension
--
-- = Registered Extension Number
--
-- 26
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
--     2016-05-30
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Interactions and External Dependencies__]
--
--     -   This extension requires
--         {spirv}\/AMD\/SPV_AMD_gcn_shader.html[@SPV_AMD_gcn_shader@]
--
-- [__Contributors__]
--
--     -   Dominik Witczak, AMD
--
--     -   Daniel Rakos, AMD
--
--     -   Rex Xu, AMD
--
--     -   Graham Sellers, AMD
--
-- == Description
--
-- This extension adds support for the following SPIR-V extension in
-- Vulkan:
--
-- -   {spirv}\/AMD\/SPV_AMD_gcn_shader.html[@SPV_AMD_gcn_shader@]
--
-- == New Enum Constants
--
-- -   'AMD_GCN_SHADER_EXTENSION_NAME'
--
-- -   'AMD_GCN_SHADER_SPEC_VERSION'
--
-- == Version History
--
-- -   Revision 1, 2016-05-30 (Dominik Witczak)
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
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_AMD_gcn_shader Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_AMD_gcn_shader  ( AMD_GCN_SHADER_SPEC_VERSION
                                            , pattern AMD_GCN_SHADER_SPEC_VERSION
                                            , AMD_GCN_SHADER_EXTENSION_NAME
                                            , pattern AMD_GCN_SHADER_EXTENSION_NAME
                                            ) where

import Data.String (IsString)

type AMD_GCN_SHADER_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_AMD_GCN_SHADER_SPEC_VERSION"
pattern AMD_GCN_SHADER_SPEC_VERSION :: forall a . Integral a => a
pattern AMD_GCN_SHADER_SPEC_VERSION = 1


type AMD_GCN_SHADER_EXTENSION_NAME = "VK_AMD_gcn_shader"

-- No documentation found for TopLevel "VK_AMD_GCN_SHADER_EXTENSION_NAME"
pattern AMD_GCN_SHADER_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern AMD_GCN_SHADER_EXTENSION_NAME = "VK_AMD_gcn_shader"

