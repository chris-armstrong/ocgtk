(* GENERATED CODE - DO NOT EDIT *)
(* Pango Enumeration and Bitfield Types *)

(* Alignment - enumeration *)
type alignment = [
  | `LEFT
  | `CENTER
  | `RIGHT
]

(* AttrType - enumeration *)
type attrtype = [
  | `INVALID
  | `LANGUAGE
  | `FAMILY
  | `STYLE
  | `WEIGHT
  | `VARIANT
  | `STRETCH
  | `SIZE
  | `FONT_DESC
  | `FOREGROUND
  | `BACKGROUND
  | `UNDERLINE
  | `STRIKETHROUGH
  | `RISE
  | `SHAPE
  | `SCALE
  | `FALLBACK
  | `LETTER_SPACING
  | `UNDERLINE_COLOR
  | `STRIKETHROUGH_COLOR
  | `ABSOLUTE_SIZE
  | `GRAVITY
  | `GRAVITY_HINT
  | `FONT_FEATURES
  | `FOREGROUND_ALPHA
  | `BACKGROUND_ALPHA
  | `ALLOW_BREAKS
  | `SHOW
  | `INSERT_HYPHENS
  | `OVERLINE
  | `OVERLINE_COLOR
  | `LINE_HEIGHT
  | `ABSOLUTE_LINE_HEIGHT
  | `TEXT_TRANSFORM
  | `WORD
  | `SENTENCE
  | `BASELINE_SHIFT
  | `FONT_SCALE
]

(* BaselineShift - enumeration *)
type baselineshift = [
  | `NONE
  | `SUPERSCRIPT
  | `SUBSCRIPT
]

(* BidiType - enumeration *)
type biditype = [
  | `L
  | `LRE
  | `LRO
  | `R
  | `AL
  | `RLE
  | `RLO
  | `PDF
  | `EN
  | `ES
  | `ET
  | `AN
  | `CS
  | `NSM
  | `BN
  | `B
  | `S
  | `WS
  | `ON
  | `LRI
  | `RLI
  | `FSI
  | `PDI
]

(* CoverageLevel - enumeration *)
type coveragelevel = [
  | `NONE
  | `FALLBACK
  | `APPROXIMATE
  | `EXACT
]

(* Direction - enumeration *)
type direction = [
  | `LTR
  | `RTL
  | `TTB_LTR
  | `TTB_RTL
  | `WEAK_LTR
  | `WEAK_RTL
  | `NEUTRAL
]

(* EllipsizeMode - enumeration *)
type ellipsizemode = [
  | `NONE
  | `START
  | `MIDDLE
  | `END
]

(* FontScale - enumeration *)
type fontscale = [
  | `NONE
  | `SUPERSCRIPT
  | `SUBSCRIPT
  | `SMALL_CAPS
]

(* Gravity - enumeration *)
type gravity = [
  | `SOUTH
  | `EAST
  | `NORTH
  | `WEST
  | `AUTO
]

(* GravityHint - enumeration *)
type gravityhint = [
  | `NATURAL
  | `STRONG
  | `LINE
]

(* LayoutDeserializeError - enumeration *)
type layoutdeserializeerror = [
  | `INVALID
  | `INVALID_VALUE
  | `MISSING_VALUE
]

(* Overline - enumeration *)
type overline = [
  | `NONE
  | `SINGLE
]

(* RenderPart - enumeration *)
type renderpart = [
  | `FOREGROUND
  | `BACKGROUND
  | `UNDERLINE
  | `STRIKETHROUGH
  | `OVERLINE
]

(* Script - enumeration *)
type script = [
  | `INVALID_CODE
  | `COMMON
  | `INHERITED
  | `ARABIC
  | `ARMENIAN
  | `BENGALI
  | `BOPOMOFO
  | `CHEROKEE
  | `COPTIC
  | `CYRILLIC
  | `DESERET
  | `DEVANAGARI
  | `ETHIOPIC
  | `GEORGIAN
  | `GOTHIC
  | `GREEK
  | `GUJARATI
  | `GURMUKHI
  | `HAN
  | `HANGUL
  | `HEBREW
  | `HIRAGANA
  | `KANNADA
  | `KATAKANA
  | `KHMER
  | `LAO
  | `LATIN
  | `MALAYALAM
  | `MONGOLIAN
  | `MYANMAR
  | `OGHAM
  | `OLD_ITALIC
  | `ORIYA
  | `RUNIC
  | `SINHALA
  | `SYRIAC
  | `TAMIL
  | `TELUGU
  | `THAANA
  | `THAI
  | `TIBETAN
  | `CANADIAN_ABORIGINAL
  | `YI
  | `TAGALOG
  | `HANUNOO
  | `BUHID
  | `TAGBANWA
  | `BRAILLE
  | `CYPRIOT
  | `LIMBU
  | `OSMANYA
  | `SHAVIAN
  | `LINEAR_B
  | `TAI_LE
  | `UGARITIC
  | `NEW_TAI_LUE
  | `BUGINESE
  | `GLAGOLITIC
  | `TIFINAGH
  | `SYLOTI_NAGRI
  | `OLD_PERSIAN
  | `KHAROSHTHI
  | `UNKNOWN
  | `BALINESE
  | `CUNEIFORM
  | `PHOENICIAN
  | `PHAGS_PA
  | `NKO
  | `KAYAH_LI
  | `LEPCHA
  | `REJANG
  | `SUNDANESE
  | `SAURASHTRA
  | `CHAM
  | `OL_CHIKI
  | `VAI
  | `CARIAN
  | `LYCIAN
  | `LYDIAN
  | `BATAK
  | `BRAHMI
  | `MANDAIC
  | `CHAKMA
  | `MEROITIC_CURSIVE
  | `MEROITIC_HIEROGLYPHS
  | `MIAO
  | `SHARADA
  | `SORA_SOMPENG
  | `TAKRI
  | `BASSA_VAH
  | `CAUCASIAN_ALBANIAN
  | `DUPLOYAN
  | `ELBASAN
  | `GRANTHA
  | `KHOJKI
  | `KHUDAWADI
  | `LINEAR_A
  | `MAHAJANI
  | `MANICHAEAN
  | `MENDE_KIKAKUI
  | `MODI
  | `MRO
  | `NABATAEAN
  | `OLD_NORTH_ARABIAN
  | `OLD_PERMIC
  | `PAHAWH_HMONG
  | `PALMYRENE
  | `PAU_CIN_HAU
  | `PSALTER_PAHLAVI
  | `SIDDHAM
  | `TIRHUTA
  | `WARANG_CITI
  | `AHOM
  | `ANATOLIAN_HIEROGLYPHS
  | `HATRAN
  | `MULTANI
  | `OLD_HUNGARIAN
  | `SIGNWRITING
]

(* Stretch - enumeration *)
type stretch = [
  | `ULTRA_CONDENSED
  | `EXTRA_CONDENSED
  | `CONDENSED
  | `SEMI_CONDENSED
  | `NORMAL
  | `SEMI_EXPANDED
  | `EXPANDED
  | `EXTRA_EXPANDED
  | `ULTRA_EXPANDED
]

(* Style - enumeration *)
type style = [
  | `NORMAL
  | `OBLIQUE
  | `ITALIC
]

(* TabAlign - enumeration *)
type tabalign = [
  | `LEFT
  | `RIGHT
  | `CENTER
  | `DECIMAL
]

(* TextTransform - enumeration *)
type texttransform = [
  | `NONE
  | `LOWERCASE
  | `UPPERCASE
  | `CAPITALIZE
]

(* Underline - enumeration *)
type underline = [
  | `NONE
  | `SINGLE
  | `DOUBLE
  | `LOW
  | `ERROR
  | `SINGLE_LINE
  | `DOUBLE_LINE
  | `ERROR_LINE
]

(* Variant - enumeration *)
type variant = [
  | `NORMAL
  | `SMALL_CAPS
  | `ALL_SMALL_CAPS
  | `PETITE_CAPS
  | `ALL_PETITE_CAPS
  | `UNICASE
  | `TITLE_CAPS
]

(* Weight - enumeration *)
type weight = [
  | `THIN
  | `ULTRALIGHT
  | `LIGHT
  | `SEMILIGHT
  | `BOOK
  | `NORMAL
  | `MEDIUM
  | `SEMIBOLD
  | `BOLD
  | `ULTRABOLD
  | `HEAVY
  | `ULTRAHEAVY
]

(* WrapMode - enumeration *)
type wrapmode = [
  | `WORD
  | `CHAR
  | `WORD_CHAR
]

(* FontMask - bitfield/flags *)
type fontmask_flag = [
  | `FAMILY
  | `STYLE
  | `VARIANT
  | `WEIGHT
  | `STRETCH
  | `SIZE
  | `GRAVITY
  | `VARIATIONS
]

type fontmask = fontmask_flag list

(* LayoutDeserializeFlags - bitfield/flags *)
type layoutdeserializeflags_flag = [
  | `DEFAULT
  | `CONTEXT
]

type layoutdeserializeflags = layoutdeserializeflags_flag list

(* LayoutSerializeFlags - bitfield/flags *)
type layoutserializeflags_flag = [
  | `DEFAULT
  | `CONTEXT
  | `OUTPUT
]

type layoutserializeflags = layoutserializeflags_flag list

(* ShapeFlags - bitfield/flags *)
type shapeflags_flag = [
  | `NONE
  | `ROUND_POSITIONS
]

type shapeflags = shapeflags_flag list

(* ShowFlags - bitfield/flags *)
type showflags_flag = [
  | `NONE
  | `SPACES
  | `LINE_BREAKS
  | `IGNORABLES
]

type showflags = showflags_flag list
