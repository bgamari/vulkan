{-# language CPP #-}
-- | = Name
--
-- VK_EXT_shader_subgroup_ballot - device extension
--
-- = Registered Extension Number
--
-- 65
--
-- = Revision
--
-- 1
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- = Deprecation state
--
-- -   /Deprecated/ by
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#versions-1.2-new-features Vulkan 1.2>
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2016-11-28
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Interactions and External Dependencies__]
--
--     -   This extension requires
--         {spirv}\/KHR\/SPV_KHR_shader_ballot.html[@SPV_KHR_shader_ballot@]
--
--     -   This extension provides API support for
--         <https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_shader_ballot.txt GL_ARB_shader_ballot>
--
-- [__Contributors__]
--
--     -   Jeff Bolz, NVIDIA
--
--     -   Neil Henning, Codeplay
--
--     -   Daniel Koch, NVIDIA Corporation
--
-- == Description
--
-- This extension adds support for the following SPIR-V extension in
-- Vulkan:
--
-- -   @SPV_KHR_shader_ballot@
--
-- This extension provides the ability for a group of invocations, which
-- execute in parallel, to do limited forms of cross-invocation
-- communication via a group broadcast of a invocation value, or broadcast
-- of a bitarray representing a predicate value from each invocation in the
-- group.
--
-- This extension provides access to a number of additional built-in shader
-- variables in Vulkan:
--
-- -   @SubgroupEqMaskKHR@, which contains the subgroup mask of the current
--     subgroup invocation,
--
-- -   @SubgroupGeMaskKHR@, which contains the subgroup mask of the
--     invocations greater than or equal to the current invocation,
--
-- -   @SubgroupGtMaskKHR@, which contains the subgroup mask of the
--     invocations greater than the current invocation,
--
-- -   @SubgroupLeMaskKHR@, which contains the subgroup mask of the
--     invocations less than or equal to the current invocation,
--
-- -   @SubgroupLtMaskKHR@, which contains the subgroup mask of the
--     invocations less than the current invocation,
--
-- -   @SubgroupLocalInvocationId@, which contains the index of an
--     invocation within a subgroup, and
--
-- -   @SubgroupSize@, which contains the maximum number of invocations in
--     a subgroup.
--
-- Additionally, this extension provides access to the new SPIR-V
-- instructions:
--
-- -   @OpSubgroupBallotKHR@,
--
-- -   @OpSubgroupFirstInvocationKHR@, and
--
-- -   @OpSubgroupReadInvocationKHR@,
--
-- When using GLSL source-based shader languages, the following variables
-- and shader functions from GL_ARB_shader_ballot can map to these SPIR-V
-- built-in decorations and instructions:
--
-- -   @in uint64_t gl_SubGroupEqMaskARB;@ → @SubgroupEqMaskKHR@,
--
-- -   @in uint64_t gl_SubGroupGeMaskARB;@ → @SubgroupGeMaskKHR@,
--
-- -   @in uint64_t gl_SubGroupGtMaskARB;@ → @SubgroupGtMaskKHR@,
--
-- -   @in uint64_t gl_SubGroupLeMaskARB;@ → @SubgroupLeMaskKHR@,
--
-- -   @in uint64_t gl_SubGroupLtMaskARB;@ → @SubgroupLtMaskKHR@,
--
-- -   @in uint gl_SubGroupInvocationARB;@ → @SubgroupLocalInvocationId@,
--
-- -   @uniform uint gl_SubGroupSizeARB;@ → @SubgroupSize@,
--
-- -   @ballotARB@() → @OpSubgroupBallotKHR@,
--
-- -   @readFirstInvocationARB@() → @OpSubgroupFirstInvocationKHR@, and
--
-- -   @readInvocationARB@() → @OpSubgroupReadInvocationKHR@.
--
-- == Deprecated by Vulkan 1.2
--
-- Most of the functionality in this extension is superseded by the core
-- Vulkan 1.1
-- <VkPhysicalDeviceSubgroupProperties.html subgroup operations>. However,
-- Vulkan 1.1 required the @OpGroupNonUniformBroadcast@ \"Id\" to be
-- constant. This restriction was removed in Vulkan 1.2 with the addition
-- of the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-subgroupBroadcastDynamicId subgroupBroadcastDynamicId>
-- feature.
--
-- == New Enum Constants
--
-- -   'EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME'
--
-- -   'EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION'
--
-- == New Built-In Variables
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sgeq SubgroupEqMaskKHR>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sgge SubgroupGeMaskKHR>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sggt SubgroupGtMaskKHR>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sgle SubgroupLeMaskKHR>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sglt SubgroupLtMaskKHR>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sgli SubgroupLocalInvocationId>
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#interfaces-builtin-variables-sgs SubgroupSize>
--
-- == New SPIR-V Capabilities
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#spirvenv-capabilities-table-subgroupballot SubgroupBallotKHR>
--
-- == Version History
--
-- -   Revision 1, 2016-11-28 (Daniel Koch)
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
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_shader_subgroup_ballot Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_shader_subgroup_ballot  ( EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION
                                                        , pattern EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION
                                                        , EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME
                                                        , pattern EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME
                                                        ) where

import Data.String (IsString)

type EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION"
pattern EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION = 1


type EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME = "VK_EXT_shader_subgroup_ballot"

-- No documentation found for TopLevel "VK_EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME"
pattern EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME = "VK_EXT_shader_subgroup_ballot"

