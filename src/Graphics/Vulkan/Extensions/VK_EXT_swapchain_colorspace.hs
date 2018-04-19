{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.Extensions.VK_EXT_swapchain_colorspace
  ( pattern VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT
  , pattern VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT
  , pattern VK_COLOR_SPACE_DCI_P3_LINEAR_EXT
  , pattern VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT
  , pattern VK_COLOR_SPACE_BT709_LINEAR_EXT
  , pattern VK_COLOR_SPACE_BT709_NONLINEAR_EXT
  , pattern VK_COLOR_SPACE_BT2020_LINEAR_EXT
  , pattern VK_COLOR_SPACE_HDR10_ST2084_EXT
  , pattern VK_COLOR_SPACE_DOLBYVISION_EXT
  , pattern VK_COLOR_SPACE_HDR10_HLG_EXT
  , pattern VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT
  , pattern VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT
  , pattern VK_COLOR_SPACE_PASS_THROUGH_EXT
  , pattern VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT
  , pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION
  , pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME
  ) where

import Data.String
  ( IsString
  )


import Graphics.Vulkan.Extensions.VK_KHR_surface
  ( VkColorSpaceKHR(..)
  )


-- | Nothing
pattern VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT = VkColorSpaceKHR 1000104001
-- | Nothing
pattern VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT = VkColorSpaceKHR 1000104002
-- | Nothing
pattern VK_COLOR_SPACE_DCI_P3_LINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_DCI_P3_LINEAR_EXT = VkColorSpaceKHR 1000104003
-- | Nothing
pattern VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT = VkColorSpaceKHR 1000104004
-- | Nothing
pattern VK_COLOR_SPACE_BT709_LINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_BT709_LINEAR_EXT = VkColorSpaceKHR 1000104005
-- | Nothing
pattern VK_COLOR_SPACE_BT709_NONLINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_BT709_NONLINEAR_EXT = VkColorSpaceKHR 1000104006
-- | Nothing
pattern VK_COLOR_SPACE_BT2020_LINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_BT2020_LINEAR_EXT = VkColorSpaceKHR 1000104007
-- | Nothing
pattern VK_COLOR_SPACE_HDR10_ST2084_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_HDR10_ST2084_EXT = VkColorSpaceKHR 1000104008
-- | Nothing
pattern VK_COLOR_SPACE_DOLBYVISION_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_DOLBYVISION_EXT = VkColorSpaceKHR 1000104009
-- | Nothing
pattern VK_COLOR_SPACE_HDR10_HLG_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_HDR10_HLG_EXT = VkColorSpaceKHR 1000104010
-- | Nothing
pattern VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT = VkColorSpaceKHR 1000104011
-- | Nothing
pattern VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT = VkColorSpaceKHR 1000104012
-- | Nothing
pattern VK_COLOR_SPACE_PASS_THROUGH_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_PASS_THROUGH_EXT = VkColorSpaceKHR 1000104013
-- | Nothing
pattern VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT = VkColorSpaceKHR 1000104014
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION :: Integral a => a
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION = 3
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME = "VK_EXT_swapchain_colorspace"