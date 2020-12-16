{-# language CPP #-}
-- No documentation found for Chapter "Queue"
module Vulkan.Core10.Queue  (SubmitInfo) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)
import {-# SOURCE #-} Vulkan.CStruct.Extends (Chain)
import {-# SOURCE #-} Vulkan.CStruct.Extends (Extendss)
import {-# SOURCE #-} Vulkan.CStruct.Extends (PeekChain)
import {-# SOURCE #-} Vulkan.CStruct.Extends (PokeChain)
type role SubmitInfo nominal
data SubmitInfo (es :: [Type])

instance (Extendss SubmitInfo es, PokeChain es) => ToCStruct (SubmitInfo es)
instance Show (Chain es) => Show (SubmitInfo es)

instance (Extendss SubmitInfo es, PeekChain es) => FromCStruct (SubmitInfo es)

