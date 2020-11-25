{-# language CPP #-}
-- | = Name
--
-- VK_KHR_display_swapchain - device extension
--
-- = Registered Extension Number
--
-- 4
--
-- = Revision
--
-- 10
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- -   Requires @VK_KHR_swapchain@
--
-- -   Requires @VK_KHR_display@
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2017-03-13
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   James Jones, NVIDIA
--
--     -   Jeff Vigil, Qualcomm
--
--     -   Jesse Hall, Google
--
-- == Description
--
-- This extension provides an API to create a swapchain directly on a
-- device’s display without any underlying window system.
--
-- == New Commands
--
-- -   'createSharedSwapchainsKHR'
--
-- == New Structures
--
-- -   Extending 'Vulkan.Extensions.VK_KHR_swapchain.PresentInfoKHR':
--
--     -   'DisplayPresentInfoKHR'
--
-- == New Enum Constants
--
-- -   'KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME'
--
-- -   'KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.Result.Result':
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_INCOMPATIBLE_DISPLAY_KHR'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR'
--
-- == Issues
--
-- 1) Should swapchains sharing images each hold a reference to the images,
-- or should it be up to the application to destroy the swapchains and
-- images in an order that avoids the need for reference counting?
--
-- __RESOLVED__: Take a reference. The lifetime of presentable images is
-- already complex enough.
--
-- 2) Should the @srcRect@ and @dstRect@ parameters be specified as part of
-- the present command, or at swapchain creation time?
--
-- __RESOLVED__: As part of the presentation command. This allows moving
-- and scaling the image on the screen without the need to respecify the
-- mode or create a new swapchain and presentable images.
--
-- 3) Should @srcRect@ and @dstRect@ be specified as rects, or separate
-- offset\/extent values?
--
-- __RESOLVED__: As rects. Specifying them separately might make it easier
-- for hardware to expose support for one but not the other, but in such
-- cases applications must just take care to obey the reported capabilities
-- and not use non-zero offsets or extents that require scaling, as
-- appropriate.
--
-- 4) How can applications create multiple swapchains that use the same
-- images?
--
-- __RESOLVED__: By calling 'createSharedSwapchainsKHR'.
--
-- An earlier resolution used
-- 'Vulkan.Extensions.VK_KHR_swapchain.createSwapchainKHR', chaining
-- multiple 'Vulkan.Extensions.VK_KHR_swapchain.SwapchainCreateInfoKHR'
-- structures through @pNext@. In order to allow each swapchain to also
-- allow other extension structs, a level of indirection was used:
-- 'Vulkan.Extensions.VK_KHR_swapchain.SwapchainCreateInfoKHR'::@pNext@
-- pointed to a different structure, which had both @sType@ and @pNext@
-- members for additional extensions, and also had a pointer to the next
-- 'Vulkan.Extensions.VK_KHR_swapchain.SwapchainCreateInfoKHR' structure.
-- The number of swapchains to be created could only be found by walking
-- this linked list of alternating structures, and the @pSwapchains@ out
-- parameter was reinterpreted to be an array of
-- 'Vulkan.Extensions.Handles.SwapchainKHR' handles.
--
-- Another option considered was a method to specify a “shared” swapchain
-- when creating a new swapchain, such that groups of swapchains using the
-- same images could be built up one at a time. This was deemed unusable
-- because drivers need to know all of the displays an image will be used
-- on when determining which internal formats and layouts to use for that
-- image.
--
-- == Examples
--
-- Note
--
-- The example code for the @VK_KHR_display@ and @VK_KHR_display_swapchain@
-- extensions was removed from the appendix after revision 1.0.43. The
-- display swapchain creation example code was ported to the cube demo that
-- is shipped with the official Khronos SDK, and is being kept up-to-date
-- in that location (see:
-- <https://github.com/KhronosGroup/Vulkan-Tools/blob/master/cube/cube.c>).
--
-- == Version History
--
-- -   Revision 1, 2015-07-29 (James Jones)
--
--     -   Initial draft
--
-- -   Revision 2, 2015-08-21 (Ian Elliott)
--
--     -   Renamed this extension and all of its enumerations, types,
--         functions, etc. This makes it compliant with the proposed
--         standard for Vulkan extensions.
--
--     -   Switched from \"revision\" to \"version\", including use of the
--         VK_MAKE_VERSION macro in the header file.
--
-- -   Revision 3, 2015-09-01 (James Jones)
--
--     -   Restore single-field revision number.
--
-- -   Revision 4, 2015-09-08 (James Jones)
--
--     -   Allow creating multiple swap chains that share the same images
--         using a single call to vkCreateSwapChainKHR().
--
-- -   Revision 5, 2015-09-10 (Alon Or-bach)
--
--     -   Removed underscores from SWAP_CHAIN in two enums.
--
-- -   Revision 6, 2015-10-02 (James Jones)
--
--     -   Added support for smart panels\/buffered displays.
--
-- -   Revision 7, 2015-10-26 (Ian Elliott)
--
--     -   Renamed from VK_EXT_KHR_display_swapchain to
--         VK_KHR_display_swapchain.
--
-- -   Revision 8, 2015-11-03 (Daniel Rakos)
--
--     -   Updated sample code based on the changes to VK_KHR_swapchain.
--
-- -   Revision 9, 2015-11-10 (Jesse Hall)
--
--     -   Replaced VkDisplaySwapchainCreateInfoKHR with
--         vkCreateSharedSwapchainsKHR, changing resolution of issue #4.
--
-- -   Revision 10, 2017-03-13 (James Jones)
--
--     -   Closed all remaining issues. The specification and
--         implementations have been shipping with the proposed resolutions
--         for some time now.
--
--     -   Removed the sample code and noted it has been integrated into
--         the official Vulkan SDK cube demo.
--
-- = See Also
--
-- 'DisplayPresentInfoKHR', 'createSharedSwapchainsKHR'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_KHR_display_swapchain Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_KHR_display_swapchain  (DisplayPresentInfoKHR) where

import Data.Kind (Type)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
data DisplayPresentInfoKHR

instance ToCStruct DisplayPresentInfoKHR
instance Show DisplayPresentInfoKHR

instance FromCStruct DisplayPresentInfoKHR

