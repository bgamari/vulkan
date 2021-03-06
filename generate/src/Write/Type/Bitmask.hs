{-# LANGUAGE QuasiQuotes #-}

module Write.Type.Bitmask
  ( writeBitmaskType
  ) where

import Data.Word(Word32)
import Data.Maybe(fromMaybe)
import Data.Bits(shiftL)
import Spec.Bitmask
import Spec.Type
import Text.InterpolatedString.Perl6
import Text.PrettyPrint.Leijen.Text hiding ((<$>))
import Write.Utils
import Write.TypeConverter
import Write.WriteMonad

-- | This writes the bitmasks, and adds patterns for them if they require an
-- enumeration in 'bitmasks'.
writeBitmaskType :: BitmaskType -> Maybe Bitmask -> Write Doc
writeBitmaskType bmt Nothing = writeOpaqueBitmaskType bmt
writeBitmaskType bmt (Just bm) = writeBitmaskTypeWithBits bmt bm

writeOpaqueBitmaskType :: BitmaskType -> Write Doc
writeOpaqueBitmaskType bmt = do
  doesDeriveStorable
  bmtHsType <- cTypeToHsTypeString (bmtCType bmt)
  pure $ [qc|-- ** {bmtName bmt}
{predocComment "Opaque flag"}
newtype {bmtName bmt} = {bmtName bmt} {bmtHsType}
  deriving (Eq, Storable)
|]

writeBitmaskTypeWithBits :: BitmaskType -> Bitmask -> Write Doc
writeBitmaskTypeWithBits bmt bm = do
  bmtHsType <- cTypeToHsTypeString (bmtCType bmt)
  doesDeriveStorable
  tellExtension "GeneralizedNewtypeDeriving"
  tellExtension "PatternSynonyms"
  tellRequiredName (ExternalName (ModuleName "Data.Bits") "Bits")
  tellRequiredName (ExternalName (ModuleName "Data.Bits") "FiniteBits")
  pure [qc|-- ** {bmtName bmt}
{predocComment $ fromMaybe "" (bmComment bm)}
newtype {bmName bm} = {bmName bm} {bmtHsType}
  deriving (Eq, Storable, Bits, FiniteBits)
-- | Alias for {bmName bm}
type {bmtName bmt} = {bmName bm}
{vcat $ writeBitPosition bm <$> bmBitPositions bm}
{vcat $ writeValue bm <$> bmValues bm}
|]

writeValue :: Bitmask -> BitmaskValue -> Doc
writeValue bm v = 
  [qc|{maybe "" predocComment (bmvComment v)}
pattern {bmvName v} = {bmName bm} {showHex' $ bmvValue v}|] 

writeBitPosition :: Bitmask -> BitmaskBitPosition -> Doc
writeBitPosition bm bp = 
  [qc|{maybe "" predocComment (bmbpComment bp)}
pattern {bmbpName bp} = {bmName bm} {showHex' $ (1 `shiftL` bmbpBitPos bp :: Word32)}|] 

