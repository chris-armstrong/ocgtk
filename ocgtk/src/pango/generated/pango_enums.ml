(* GENERATED CODE - DO NOT EDIT *)
(* Pango Enumeration and Bitfield Converters *)

type alignment = [ `LEFT | `CENTER | `RIGHT ]

let alignment_of_int n =
  match n with
  | 0 -> `LEFT
  | 1 -> `CENTER
  | 2 -> `RIGHT
  | n -> failwith (Printf.sprintf "Alignment: unknown int %d" n)

let alignment_to_int v = match v with `LEFT -> 0 | `CENTER -> 1 | `RIGHT -> 2

type attrtype =
  [ `INVALID
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
  | `FONT_SCALE ]

let attrtype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `LANGUAGE
  | 2 -> `FAMILY
  | 3 -> `STYLE
  | 4 -> `WEIGHT
  | 5 -> `VARIANT
  | 6 -> `STRETCH
  | 7 -> `SIZE
  | 8 -> `FONT_DESC
  | 9 -> `FOREGROUND
  | 10 -> `BACKGROUND
  | 11 -> `UNDERLINE
  | 12 -> `STRIKETHROUGH
  | 13 -> `RISE
  | 14 -> `SHAPE
  | 15 -> `SCALE
  | 16 -> `FALLBACK
  | 17 -> `LETTER_SPACING
  | 18 -> `UNDERLINE_COLOR
  | 19 -> `STRIKETHROUGH_COLOR
  | 20 -> `ABSOLUTE_SIZE
  | 21 -> `GRAVITY
  | 22 -> `GRAVITY_HINT
  | 23 -> `FONT_FEATURES
  | 24 -> `FOREGROUND_ALPHA
  | 25 -> `BACKGROUND_ALPHA
  | 26 -> `ALLOW_BREAKS
  | 27 -> `SHOW
  | 28 -> `INSERT_HYPHENS
  | 29 -> `OVERLINE
  | 30 -> `OVERLINE_COLOR
  | 31 -> `LINE_HEIGHT
  | 32 -> `ABSOLUTE_LINE_HEIGHT
  | 33 -> `TEXT_TRANSFORM
  | 34 -> `WORD
  | 35 -> `SENTENCE
  | 36 -> `BASELINE_SHIFT
  | 37 -> `FONT_SCALE
  | n -> failwith (Printf.sprintf "AttrType: unknown int %d" n)

let attrtype_to_int v =
  match v with
  | `INVALID -> 0
  | `LANGUAGE -> 1
  | `FAMILY -> 2
  | `STYLE -> 3
  | `WEIGHT -> 4
  | `VARIANT -> 5
  | `STRETCH -> 6
  | `SIZE -> 7
  | `FONT_DESC -> 8
  | `FOREGROUND -> 9
  | `BACKGROUND -> 10
  | `UNDERLINE -> 11
  | `STRIKETHROUGH -> 12
  | `RISE -> 13
  | `SHAPE -> 14
  | `SCALE -> 15
  | `FALLBACK -> 16
  | `LETTER_SPACING -> 17
  | `UNDERLINE_COLOR -> 18
  | `STRIKETHROUGH_COLOR -> 19
  | `ABSOLUTE_SIZE -> 20
  | `GRAVITY -> 21
  | `GRAVITY_HINT -> 22
  | `FONT_FEATURES -> 23
  | `FOREGROUND_ALPHA -> 24
  | `BACKGROUND_ALPHA -> 25
  | `ALLOW_BREAKS -> 26
  | `SHOW -> 27
  | `INSERT_HYPHENS -> 28
  | `OVERLINE -> 29
  | `OVERLINE_COLOR -> 30
  | `LINE_HEIGHT -> 31
  | `ABSOLUTE_LINE_HEIGHT -> 32
  | `TEXT_TRANSFORM -> 33
  | `WORD -> 34
  | `SENTENCE -> 35
  | `BASELINE_SHIFT -> 36
  | `FONT_SCALE -> 37

type baselineshift = [ `NONE | `SUPERSCRIPT | `SUBSCRIPT ]

let baselineshift_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SUPERSCRIPT
  | 2 -> `SUBSCRIPT
  | n -> failwith (Printf.sprintf "BaselineShift: unknown int %d" n)

let baselineshift_to_int v =
  match v with `NONE -> 0 | `SUPERSCRIPT -> 1 | `SUBSCRIPT -> 2

type biditype =
  [ `L
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
  | `PDI ]

let biditype_of_int n =
  match n with
  | 0 -> `L
  | 1 -> `LRE
  | 2 -> `LRO
  | 3 -> `R
  | 4 -> `AL
  | 5 -> `RLE
  | 6 -> `RLO
  | 7 -> `PDF
  | 8 -> `EN
  | 9 -> `ES
  | 10 -> `ET
  | 11 -> `AN
  | 12 -> `CS
  | 13 -> `NSM
  | 14 -> `BN
  | 15 -> `B
  | 16 -> `S
  | 17 -> `WS
  | 18 -> `ON
  | 19 -> `LRI
  | 20 -> `RLI
  | 21 -> `FSI
  | 22 -> `PDI
  | n -> failwith (Printf.sprintf "BidiType: unknown int %d" n)

let biditype_to_int v =
  match v with
  | `L -> 0
  | `LRE -> 1
  | `LRO -> 2
  | `R -> 3
  | `AL -> 4
  | `RLE -> 5
  | `RLO -> 6
  | `PDF -> 7
  | `EN -> 8
  | `ES -> 9
  | `ET -> 10
  | `AN -> 11
  | `CS -> 12
  | `NSM -> 13
  | `BN -> 14
  | `B -> 15
  | `S -> 16
  | `WS -> 17
  | `ON -> 18
  | `LRI -> 19
  | `RLI -> 20
  | `FSI -> 21
  | `PDI -> 22

type coveragelevel = [ `NONE | `FALLBACK | `APPROXIMATE | `EXACT ]

let coveragelevel_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `FALLBACK
  | 2 -> `APPROXIMATE
  | 3 -> `EXACT
  | n -> failwith (Printf.sprintf "CoverageLevel: unknown int %d" n)

let coveragelevel_to_int v =
  match v with `NONE -> 0 | `FALLBACK -> 1 | `APPROXIMATE -> 2 | `EXACT -> 3

type direction =
  [ `LTR | `RTL | `TTB_LTR | `TTB_RTL | `WEAK_LTR | `WEAK_RTL | `NEUTRAL ]

let direction_of_int n =
  match n with
  | 0 -> `LTR
  | 1 -> `RTL
  | 2 -> `TTB_LTR
  | 3 -> `TTB_RTL
  | 4 -> `WEAK_LTR
  | 5 -> `WEAK_RTL
  | 6 -> `NEUTRAL
  | n -> failwith (Printf.sprintf "Direction: unknown int %d" n)

let direction_to_int v =
  match v with
  | `LTR -> 0
  | `RTL -> 1
  | `TTB_LTR -> 2
  | `TTB_RTL -> 3
  | `WEAK_LTR -> 4
  | `WEAK_RTL -> 5
  | `NEUTRAL -> 6

type ellipsizemode = [ `NONE | `START | `MIDDLE | `END ]

let ellipsizemode_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `START
  | 2 -> `MIDDLE
  | 3 -> `END
  | n -> failwith (Printf.sprintf "EllipsizeMode: unknown int %d" n)

let ellipsizemode_to_int v =
  match v with `NONE -> 0 | `START -> 1 | `MIDDLE -> 2 | `END -> 3

type fontscale = [ `NONE | `SUPERSCRIPT | `SUBSCRIPT | `SMALL_CAPS ]

let fontscale_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SUPERSCRIPT
  | 2 -> `SUBSCRIPT
  | 3 -> `SMALL_CAPS
  | n -> failwith (Printf.sprintf "FontScale: unknown int %d" n)

let fontscale_to_int v =
  match v with
  | `NONE -> 0
  | `SUPERSCRIPT -> 1
  | `SUBSCRIPT -> 2
  | `SMALL_CAPS -> 3

type gravity = [ `SOUTH | `EAST | `NORTH | `WEST | `AUTO ]

let gravity_of_int n =
  match n with
  | 0 -> `SOUTH
  | 1 -> `EAST
  | 2 -> `NORTH
  | 3 -> `WEST
  | 4 -> `AUTO
  | n -> failwith (Printf.sprintf "Gravity: unknown int %d" n)

let gravity_to_int v =
  match v with
  | `SOUTH -> 0
  | `EAST -> 1
  | `NORTH -> 2
  | `WEST -> 3
  | `AUTO -> 4

type gravityhint = [ `NATURAL | `STRONG | `LINE ]

let gravityhint_of_int n =
  match n with
  | 0 -> `NATURAL
  | 1 -> `STRONG
  | 2 -> `LINE
  | n -> failwith (Printf.sprintf "GravityHint: unknown int %d" n)

let gravityhint_to_int v =
  match v with `NATURAL -> 0 | `STRONG -> 1 | `LINE -> 2

type layoutdeserializeerror = [ `INVALID | `INVALID_VALUE | `MISSING_VALUE ]

let layoutdeserializeerror_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `INVALID_VALUE
  | 2 -> `MISSING_VALUE
  | n -> failwith (Printf.sprintf "LayoutDeserializeError: unknown int %d" n)

let layoutdeserializeerror_to_int v =
  match v with `INVALID -> 0 | `INVALID_VALUE -> 1 | `MISSING_VALUE -> 2

type overline = [ `NONE | `SINGLE ]

let overline_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SINGLE
  | n -> failwith (Printf.sprintf "Overline: unknown int %d" n)

let overline_to_int v = match v with `NONE -> 0 | `SINGLE -> 1

type renderpart =
  [ `FOREGROUND | `BACKGROUND | `UNDERLINE | `STRIKETHROUGH | `OVERLINE ]

let renderpart_of_int n =
  match n with
  | 0 -> `FOREGROUND
  | 1 -> `BACKGROUND
  | 2 -> `UNDERLINE
  | 3 -> `STRIKETHROUGH
  | 4 -> `OVERLINE
  | n -> failwith (Printf.sprintf "RenderPart: unknown int %d" n)

let renderpart_to_int v =
  match v with
  | `FOREGROUND -> 0
  | `BACKGROUND -> 1
  | `UNDERLINE -> 2
  | `STRIKETHROUGH -> 3
  | `OVERLINE -> 4

type script =
  [ `INVALID_CODE
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
  | `SIGNWRITING ]

let script_of_int n =
  match n with
  | -1 -> `INVALID_CODE
  | 0 -> `COMMON
  | 1 -> `INHERITED
  | 2 -> `ARABIC
  | 3 -> `ARMENIAN
  | 4 -> `BENGALI
  | 5 -> `BOPOMOFO
  | 6 -> `CHEROKEE
  | 7 -> `COPTIC
  | 8 -> `CYRILLIC
  | 9 -> `DESERET
  | 10 -> `DEVANAGARI
  | 11 -> `ETHIOPIC
  | 12 -> `GEORGIAN
  | 13 -> `GOTHIC
  | 14 -> `GREEK
  | 15 -> `GUJARATI
  | 16 -> `GURMUKHI
  | 17 -> `HAN
  | 18 -> `HANGUL
  | 19 -> `HEBREW
  | 20 -> `HIRAGANA
  | 21 -> `KANNADA
  | 22 -> `KATAKANA
  | 23 -> `KHMER
  | 24 -> `LAO
  | 25 -> `LATIN
  | 26 -> `MALAYALAM
  | 27 -> `MONGOLIAN
  | 28 -> `MYANMAR
  | 29 -> `OGHAM
  | 30 -> `OLD_ITALIC
  | 31 -> `ORIYA
  | 32 -> `RUNIC
  | 33 -> `SINHALA
  | 34 -> `SYRIAC
  | 35 -> `TAMIL
  | 36 -> `TELUGU
  | 37 -> `THAANA
  | 38 -> `THAI
  | 39 -> `TIBETAN
  | 40 -> `CANADIAN_ABORIGINAL
  | 41 -> `YI
  | 42 -> `TAGALOG
  | 43 -> `HANUNOO
  | 44 -> `BUHID
  | 45 -> `TAGBANWA
  | 46 -> `BRAILLE
  | 47 -> `CYPRIOT
  | 48 -> `LIMBU
  | 49 -> `OSMANYA
  | 50 -> `SHAVIAN
  | 51 -> `LINEAR_B
  | 52 -> `TAI_LE
  | 53 -> `UGARITIC
  | 54 -> `NEW_TAI_LUE
  | 55 -> `BUGINESE
  | 56 -> `GLAGOLITIC
  | 57 -> `TIFINAGH
  | 58 -> `SYLOTI_NAGRI
  | 59 -> `OLD_PERSIAN
  | 60 -> `KHAROSHTHI
  | 61 -> `UNKNOWN
  | 62 -> `BALINESE
  | 63 -> `CUNEIFORM
  | 64 -> `PHOENICIAN
  | 65 -> `PHAGS_PA
  | 66 -> `NKO
  | 67 -> `KAYAH_LI
  | 68 -> `LEPCHA
  | 69 -> `REJANG
  | 70 -> `SUNDANESE
  | 71 -> `SAURASHTRA
  | 72 -> `CHAM
  | 73 -> `OL_CHIKI
  | 74 -> `VAI
  | 75 -> `CARIAN
  | 76 -> `LYCIAN
  | 77 -> `LYDIAN
  | 78 -> `BATAK
  | 79 -> `BRAHMI
  | 80 -> `MANDAIC
  | 81 -> `CHAKMA
  | 82 -> `MEROITIC_CURSIVE
  | 83 -> `MEROITIC_HIEROGLYPHS
  | 84 -> `MIAO
  | 85 -> `SHARADA
  | 86 -> `SORA_SOMPENG
  | 87 -> `TAKRI
  | 88 -> `BASSA_VAH
  | 89 -> `CAUCASIAN_ALBANIAN
  | 90 -> `DUPLOYAN
  | 91 -> `ELBASAN
  | 92 -> `GRANTHA
  | 93 -> `KHOJKI
  | 94 -> `KHUDAWADI
  | 95 -> `LINEAR_A
  | 96 -> `MAHAJANI
  | 97 -> `MANICHAEAN
  | 98 -> `MENDE_KIKAKUI
  | 99 -> `MODI
  | 100 -> `MRO
  | 101 -> `NABATAEAN
  | 102 -> `OLD_NORTH_ARABIAN
  | 103 -> `OLD_PERMIC
  | 104 -> `PAHAWH_HMONG
  | 105 -> `PALMYRENE
  | 106 -> `PAU_CIN_HAU
  | 107 -> `PSALTER_PAHLAVI
  | 108 -> `SIDDHAM
  | 109 -> `TIRHUTA
  | 110 -> `WARANG_CITI
  | 111 -> `AHOM
  | 112 -> `ANATOLIAN_HIEROGLYPHS
  | 113 -> `HATRAN
  | 114 -> `MULTANI
  | 115 -> `OLD_HUNGARIAN
  | 116 -> `SIGNWRITING
  | n -> failwith (Printf.sprintf "Script: unknown int %d" n)

let script_to_int v =
  match v with
  | `INVALID_CODE -> -1
  | `COMMON -> 0
  | `INHERITED -> 1
  | `ARABIC -> 2
  | `ARMENIAN -> 3
  | `BENGALI -> 4
  | `BOPOMOFO -> 5
  | `CHEROKEE -> 6
  | `COPTIC -> 7
  | `CYRILLIC -> 8
  | `DESERET -> 9
  | `DEVANAGARI -> 10
  | `ETHIOPIC -> 11
  | `GEORGIAN -> 12
  | `GOTHIC -> 13
  | `GREEK -> 14
  | `GUJARATI -> 15
  | `GURMUKHI -> 16
  | `HAN -> 17
  | `HANGUL -> 18
  | `HEBREW -> 19
  | `HIRAGANA -> 20
  | `KANNADA -> 21
  | `KATAKANA -> 22
  | `KHMER -> 23
  | `LAO -> 24
  | `LATIN -> 25
  | `MALAYALAM -> 26
  | `MONGOLIAN -> 27
  | `MYANMAR -> 28
  | `OGHAM -> 29
  | `OLD_ITALIC -> 30
  | `ORIYA -> 31
  | `RUNIC -> 32
  | `SINHALA -> 33
  | `SYRIAC -> 34
  | `TAMIL -> 35
  | `TELUGU -> 36
  | `THAANA -> 37
  | `THAI -> 38
  | `TIBETAN -> 39
  | `CANADIAN_ABORIGINAL -> 40
  | `YI -> 41
  | `TAGALOG -> 42
  | `HANUNOO -> 43
  | `BUHID -> 44
  | `TAGBANWA -> 45
  | `BRAILLE -> 46
  | `CYPRIOT -> 47
  | `LIMBU -> 48
  | `OSMANYA -> 49
  | `SHAVIAN -> 50
  | `LINEAR_B -> 51
  | `TAI_LE -> 52
  | `UGARITIC -> 53
  | `NEW_TAI_LUE -> 54
  | `BUGINESE -> 55
  | `GLAGOLITIC -> 56
  | `TIFINAGH -> 57
  | `SYLOTI_NAGRI -> 58
  | `OLD_PERSIAN -> 59
  | `KHAROSHTHI -> 60
  | `UNKNOWN -> 61
  | `BALINESE -> 62
  | `CUNEIFORM -> 63
  | `PHOENICIAN -> 64
  | `PHAGS_PA -> 65
  | `NKO -> 66
  | `KAYAH_LI -> 67
  | `LEPCHA -> 68
  | `REJANG -> 69
  | `SUNDANESE -> 70
  | `SAURASHTRA -> 71
  | `CHAM -> 72
  | `OL_CHIKI -> 73
  | `VAI -> 74
  | `CARIAN -> 75
  | `LYCIAN -> 76
  | `LYDIAN -> 77
  | `BATAK -> 78
  | `BRAHMI -> 79
  | `MANDAIC -> 80
  | `CHAKMA -> 81
  | `MEROITIC_CURSIVE -> 82
  | `MEROITIC_HIEROGLYPHS -> 83
  | `MIAO -> 84
  | `SHARADA -> 85
  | `SORA_SOMPENG -> 86
  | `TAKRI -> 87
  | `BASSA_VAH -> 88
  | `CAUCASIAN_ALBANIAN -> 89
  | `DUPLOYAN -> 90
  | `ELBASAN -> 91
  | `GRANTHA -> 92
  | `KHOJKI -> 93
  | `KHUDAWADI -> 94
  | `LINEAR_A -> 95
  | `MAHAJANI -> 96
  | `MANICHAEAN -> 97
  | `MENDE_KIKAKUI -> 98
  | `MODI -> 99
  | `MRO -> 100
  | `NABATAEAN -> 101
  | `OLD_NORTH_ARABIAN -> 102
  | `OLD_PERMIC -> 103
  | `PAHAWH_HMONG -> 104
  | `PALMYRENE -> 105
  | `PAU_CIN_HAU -> 106
  | `PSALTER_PAHLAVI -> 107
  | `SIDDHAM -> 108
  | `TIRHUTA -> 109
  | `WARANG_CITI -> 110
  | `AHOM -> 111
  | `ANATOLIAN_HIEROGLYPHS -> 112
  | `HATRAN -> 113
  | `MULTANI -> 114
  | `OLD_HUNGARIAN -> 115
  | `SIGNWRITING -> 116

type stretch =
  [ `ULTRA_CONDENSED
  | `EXTRA_CONDENSED
  | `CONDENSED
  | `SEMI_CONDENSED
  | `NORMAL
  | `SEMI_EXPANDED
  | `EXPANDED
  | `EXTRA_EXPANDED
  | `ULTRA_EXPANDED ]

let stretch_of_int n =
  match n with
  | 0 -> `ULTRA_CONDENSED
  | 1 -> `EXTRA_CONDENSED
  | 2 -> `CONDENSED
  | 3 -> `SEMI_CONDENSED
  | 4 -> `NORMAL
  | 5 -> `SEMI_EXPANDED
  | 6 -> `EXPANDED
  | 7 -> `EXTRA_EXPANDED
  | 8 -> `ULTRA_EXPANDED
  | n -> failwith (Printf.sprintf "Stretch: unknown int %d" n)

let stretch_to_int v =
  match v with
  | `ULTRA_CONDENSED -> 0
  | `EXTRA_CONDENSED -> 1
  | `CONDENSED -> 2
  | `SEMI_CONDENSED -> 3
  | `NORMAL -> 4
  | `SEMI_EXPANDED -> 5
  | `EXPANDED -> 6
  | `EXTRA_EXPANDED -> 7
  | `ULTRA_EXPANDED -> 8

type style = [ `NORMAL | `OBLIQUE | `ITALIC ]

let style_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `OBLIQUE
  | 2 -> `ITALIC
  | n -> failwith (Printf.sprintf "Style: unknown int %d" n)

let style_to_int v = match v with `NORMAL -> 0 | `OBLIQUE -> 1 | `ITALIC -> 2

type tabalign = [ `LEFT | `RIGHT | `CENTER | `DECIMAL ]

let tabalign_of_int n =
  match n with
  | 0 -> `LEFT
  | 1 -> `RIGHT
  | 2 -> `CENTER
  | 3 -> `DECIMAL
  | n -> failwith (Printf.sprintf "TabAlign: unknown int %d" n)

let tabalign_to_int v =
  match v with `LEFT -> 0 | `RIGHT -> 1 | `CENTER -> 2 | `DECIMAL -> 3

type texttransform = [ `NONE | `LOWERCASE | `UPPERCASE | `CAPITALIZE ]

let texttransform_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `LOWERCASE
  | 2 -> `UPPERCASE
  | 3 -> `CAPITALIZE
  | n -> failwith (Printf.sprintf "TextTransform: unknown int %d" n)

let texttransform_to_int v =
  match v with
  | `NONE -> 0
  | `LOWERCASE -> 1
  | `UPPERCASE -> 2
  | `CAPITALIZE -> 3

type underline =
  [ `NONE
  | `SINGLE
  | `DOUBLE
  | `LOW
  | `ERROR
  | `SINGLE_LINE
  | `DOUBLE_LINE
  | `ERROR_LINE ]

let underline_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SINGLE
  | 2 -> `DOUBLE
  | 3 -> `LOW
  | 4 -> `ERROR
  | 5 -> `SINGLE_LINE
  | 6 -> `DOUBLE_LINE
  | 7 -> `ERROR_LINE
  | n -> failwith (Printf.sprintf "Underline: unknown int %d" n)

let underline_to_int v =
  match v with
  | `NONE -> 0
  | `SINGLE -> 1
  | `DOUBLE -> 2
  | `LOW -> 3
  | `ERROR -> 4
  | `SINGLE_LINE -> 5
  | `DOUBLE_LINE -> 6
  | `ERROR_LINE -> 7

type variant =
  [ `NORMAL
  | `SMALL_CAPS
  | `ALL_SMALL_CAPS
  | `PETITE_CAPS
  | `ALL_PETITE_CAPS
  | `UNICASE
  | `TITLE_CAPS ]

let variant_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `SMALL_CAPS
  | 2 -> `ALL_SMALL_CAPS
  | 3 -> `PETITE_CAPS
  | 4 -> `ALL_PETITE_CAPS
  | 5 -> `UNICASE
  | 6 -> `TITLE_CAPS
  | n -> failwith (Printf.sprintf "Variant: unknown int %d" n)

let variant_to_int v =
  match v with
  | `NORMAL -> 0
  | `SMALL_CAPS -> 1
  | `ALL_SMALL_CAPS -> 2
  | `PETITE_CAPS -> 3
  | `ALL_PETITE_CAPS -> 4
  | `UNICASE -> 5
  | `TITLE_CAPS -> 6

type weight =
  [ `THIN
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
  | `ULTRAHEAVY ]

let weight_of_int n =
  match n with
  | 100 -> `THIN
  | 200 -> `ULTRALIGHT
  | 300 -> `LIGHT
  | 350 -> `SEMILIGHT
  | 380 -> `BOOK
  | 400 -> `NORMAL
  | 500 -> `MEDIUM
  | 600 -> `SEMIBOLD
  | 700 -> `BOLD
  | 800 -> `ULTRABOLD
  | 900 -> `HEAVY
  | 1000 -> `ULTRAHEAVY
  | n -> failwith (Printf.sprintf "Weight: unknown int %d" n)

let weight_to_int v =
  match v with
  | `THIN -> 100
  | `ULTRALIGHT -> 200
  | `LIGHT -> 300
  | `SEMILIGHT -> 350
  | `BOOK -> 380
  | `NORMAL -> 400
  | `MEDIUM -> 500
  | `SEMIBOLD -> 600
  | `BOLD -> 700
  | `ULTRABOLD -> 800
  | `HEAVY -> 900
  | `ULTRAHEAVY -> 1000

type wrapmode = [ `WORD | `CHAR | `WORD_CHAR ]

let wrapmode_of_int n =
  match n with
  | 0 -> `WORD
  | 1 -> `CHAR
  | 2 -> `WORD_CHAR
  | n -> failwith (Printf.sprintf "WrapMode: unknown int %d" n)

let wrapmode_to_int v = match v with `WORD -> 0 | `CHAR -> 1 | `WORD_CHAR -> 2

type fontmask_flag =
  [ `FAMILY
  | `STYLE
  | `VARIANT
  | `WEIGHT
  | `STRETCH
  | `SIZE
  | `GRAVITY
  | `VARIATIONS ]

type fontmask = fontmask_flag list

let fontmask_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `FAMILY :: acc else acc in
  let acc = if flags land 2 <> 0 then `STYLE :: acc else acc in
  let acc = if flags land 4 <> 0 then `VARIANT :: acc else acc in
  let acc = if flags land 8 <> 0 then `WEIGHT :: acc else acc in
  let acc = if flags land 16 <> 0 then `STRETCH :: acc else acc in
  let acc = if flags land 32 <> 0 then `SIZE :: acc else acc in
  let acc = if flags land 64 <> 0 then `GRAVITY :: acc else acc in
  let acc = if flags land 128 <> 0 then `VARIATIONS :: acc else acc in
  acc

let fontmask_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `FAMILY -> acc lor 1
      | `STYLE -> acc lor 2
      | `VARIANT -> acc lor 4
      | `WEIGHT -> acc lor 8
      | `STRETCH -> acc lor 16
      | `SIZE -> acc lor 32
      | `GRAVITY -> acc lor 64
      | `VARIATIONS -> acc lor 128)
    0 flags

type layoutdeserializeflags_flag = [ `DEFAULT | `CONTEXT ]
type layoutdeserializeflags = layoutdeserializeflags_flag list

let layoutdeserializeflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `DEFAULT :: acc else acc in
  let acc = if flags land 1 <> 0 then `CONTEXT :: acc else acc in
  acc

let layoutdeserializeflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `DEFAULT -> acc lor 0 | `CONTEXT -> acc lor 1)
    0 flags

type layoutserializeflags_flag = [ `DEFAULT | `CONTEXT | `OUTPUT ]
type layoutserializeflags = layoutserializeflags_flag list

let layoutserializeflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `DEFAULT :: acc else acc in
  let acc = if flags land 1 <> 0 then `CONTEXT :: acc else acc in
  let acc = if flags land 2 <> 0 then `OUTPUT :: acc else acc in
  acc

let layoutserializeflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `DEFAULT -> acc lor 0
      | `CONTEXT -> acc lor 1
      | `OUTPUT -> acc lor 2)
    0 flags

type shapeflags_flag = [ `NONE | `ROUND_POSITIONS ]
type shapeflags = shapeflags_flag list

let shapeflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `ROUND_POSITIONS :: acc else acc in
  acc

let shapeflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `ROUND_POSITIONS -> acc lor 1)
    0 flags

type showflags_flag = [ `NONE | `SPACES | `LINE_BREAKS | `IGNORABLES ]
type showflags = showflags_flag list

let showflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `SPACES :: acc else acc in
  let acc = if flags land 2 <> 0 then `LINE_BREAKS :: acc else acc in
  let acc = if flags land 4 <> 0 then `IGNORABLES :: acc else acc in
  acc

let showflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `SPACES -> acc lor 1
      | `LINE_BREAKS -> acc lor 2
      | `IGNORABLES -> acc lor 4)
    0 flags
