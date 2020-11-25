{-# language CPP #-}
-- | = Name
--
-- VK_NV_framebuffer_mixed_samples - device extension
--
-- = Registered Extension Number
--
-- 153
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
--     2017-06-04
--
-- [__Contributors__]
--
--     -   Jeff Bolz, NVIDIA
--
-- == Description
--
-- This extension allows multisample rendering with a raster and
-- depth\/stencil sample count that is larger than the color sample count.
-- Rasterization and the results of the depth and stencil tests together
-- determine the portion of a pixel that is “covered”. It can be useful to
-- evaluate coverage at a higher frequency than color samples are stored.
-- This coverage is then “reduced” to a collection of covered color
-- samples, each having an opacity value corresponding to the fraction of
-- the color sample covered. The opacity can optionally be blended into
-- individual color samples.
--
-- Rendering with fewer color samples than depth\/stencil samples greatly
-- reduces the amount of memory and bandwidth consumed by the color buffer.
-- However, converting the coverage values into opacity introduces
-- artifacts where triangles share edges and /may/ not be suitable for
-- normal triangle mesh rendering.
--
-- One expected use case for this functionality is Stencil-then-Cover path
-- rendering (similar to the OpenGL GL_NV_path_rendering extension). The
-- stencil step determines the coverage (in the stencil buffer) for an
-- entire path at the higher sample frequency, and then the cover step
-- draws the path into the lower frequency color buffer using the coverage
-- information to antialias path edges. With this two-step process,
-- internal edges are fully covered when antialiasing is applied and there
-- is no corruption on these edges.
--
-- The key features of this extension are:
--
-- -   It allows render pass and framebuffer objects to be created where
--     the number of samples in the depth\/stencil attachment in a subpass
--     is a multiple of the number of samples in the color attachments in
--     the subpass.
--
-- -   A coverage reduction step is added to Fragment Operations which
--     converts a set of covered raster\/depth\/stencil samples to a set of
--     color samples that perform blending and color writes. The coverage
--     reduction step also includes an optional coverage modulation step,
--     multiplying color values by a fractional opacity corresponding to
--     the number of associated raster\/depth\/stencil samples covered.
--
-- == New Structures
--
-- -   Extending
--     'Vulkan.Core10.Pipeline.PipelineMultisampleStateCreateInfo':
--
--     -   'PipelineCoverageModulationStateCreateInfoNV'
--
-- == New Enums
--
-- -   'CoverageModulationModeNV'
--
-- == New Bitmasks
--
-- -   'PipelineCoverageModulationStateCreateFlagsNV'
--
-- == New Enum Constants
--
-- -   'NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME'
--
-- -   'NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV'
--
-- == Version History
--
-- -   Revision 1, 2017-06-04 (Jeff Bolz)
--
--     -   Internal revisions
--
-- = See Also
--
-- 'CoverageModulationModeNV',
-- 'PipelineCoverageModulationStateCreateFlagsNV',
-- 'PipelineCoverageModulationStateCreateInfoNV'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_NV_framebuffer_mixed_samples Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_NV_framebuffer_mixed_samples  (PipelineCoverageModulationStateCreateInfoNV) where

import Data.Kind (Type)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
data PipelineCoverageModulationStateCreateInfoNV

instance ToCStruct PipelineCoverageModulationStateCreateInfoNV
instance Show PipelineCoverageModulationStateCreateInfoNV

instance FromCStruct PipelineCoverageModulationStateCreateInfoNV

