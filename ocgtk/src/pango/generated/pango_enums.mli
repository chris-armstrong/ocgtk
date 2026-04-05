(* GENERATED CODE - DO NOT EDIT *)
(* Pango Enumeration and Bitfield Types *)

(* Alignment - enumeration *)
type alignment = [
  (** Put all available space on the right *)
  | `LEFT
  (** Center the line within the available space *)
  | `CENTER
  (** Put all available space on the left *)
  | `RIGHT
]

(* AttrType - enumeration *)
type attrtype = [
  (** does not happen *)
  | `INVALID
  (** language ([struct@Pango.AttrLanguage]) *)
  | `LANGUAGE
  (** font family name list ([struct@Pango.AttrString]) *)
  | `FAMILY
  (** font slant style ([struct@Pango.AttrInt]) *)
  | `STYLE
  (** font weight ([struct@Pango.AttrInt]) *)
  | `WEIGHT
  (** font variant (normal or small caps) ([struct@Pango.AttrInt]) *)
  | `VARIANT
  (** font stretch ([struct@Pango.AttrInt]) *)
  | `STRETCH
  (** font size in points scaled by %PANGO_SCALE ([struct@Pango.AttrInt]) *)
  | `SIZE
  (** font description ([struct@Pango.AttrFontDesc]) *)
  | `FONT_DESC
  (** foreground color ([struct@Pango.AttrColor]) *)
  | `FOREGROUND
  (** background color ([struct@Pango.AttrColor]) *)
  | `BACKGROUND
  (** whether the text has an underline ([struct@Pango.AttrInt]) *)
  | `UNDERLINE
  (** whether the text is struck-through ([struct@Pango.AttrInt]) *)
  | `STRIKETHROUGH
  (** baseline displacement ([struct@Pango.AttrInt]) *)
  | `RISE
  (** shape ([struct@Pango.AttrShape]) *)
  | `SHAPE
  (** font size scale factor ([struct@Pango.AttrFloat]) *)
  | `SCALE
  (** whether fallback is enabled ([struct@Pango.AttrInt]) *)
  | `FALLBACK
  (** letter spacing ([struct@PangoAttrInt]) *)
  | `LETTER_SPACING
  (** underline color ([struct@Pango.AttrColor]) *)
  | `UNDERLINE_COLOR
  (** strikethrough color ([struct@Pango.AttrColor]) *)
  | `STRIKETHROUGH_COLOR
  (** font size in pixels scaled by %PANGO_SCALE ([struct@Pango.AttrInt]) *)
  | `ABSOLUTE_SIZE
  (** base text gravity ([struct@Pango.AttrInt]) *)
  | `GRAVITY
  (** gravity hint ([struct@Pango.AttrInt]) *)
  | `GRAVITY_HINT
  (** OpenType font features ([struct@Pango.AttrFontFeatures]). Since 1.38 *)
  | `FONT_FEATURES
  (** foreground alpha ([struct@Pango.AttrInt]). Since 1.38 *)
  | `FOREGROUND_ALPHA
  (** background alpha ([struct@Pango.AttrInt]). Since 1.38 *)
  | `BACKGROUND_ALPHA
  (** whether breaks are allowed ([struct@Pango.AttrInt]). Since 1.44 *)
  | `ALLOW_BREAKS
  (** how to render invisible characters ([struct@Pango.AttrInt]). Since 1.44 *)
  | `SHOW
  (** whether to insert hyphens at intra-word line breaks ([struct@Pango.AttrInt]). Since 1.44 *)
  | `INSERT_HYPHENS
  (** whether the text has an overline ([struct@Pango.AttrInt]). Since 1.46 *)
  | `OVERLINE
  (** overline color ([struct@Pango.AttrColor]). Since 1.46 *)
  | `OVERLINE_COLOR
  (** line height factor ([struct@Pango.AttrFloat]). Since: 1.50 *)
  | `LINE_HEIGHT
  (** line height ([struct@Pango.AttrInt]). Since: 1.50 *)
  | `ABSOLUTE_LINE_HEIGHT
  | `TEXT_TRANSFORM
  (** override segmentation to classify the range of the attribute as a single word ([struct@Pango.AttrInt]). Since 1.50 *)
  | `WORD
  (** override segmentation to classify the range of the attribute as a single sentence ([struct@Pango.AttrInt]). Since 1.50 *)
  | `SENTENCE
  (** baseline displacement ([struct@Pango.AttrInt]). Since 1.50 *)
  | `BASELINE_SHIFT
  (** font-relative size change ([struct@Pango.AttrInt]). Since 1.50 *)
  | `FONT_SCALE
]

(* BaselineShift - enumeration *)
type baselineshift = [
  (** Leave the baseline unchanged *)
  | `NONE
  (** Shift the baseline to the superscript position,
  relative to the previous run *)
  | `SUPERSCRIPT
  (** Shift the baseline to the subscript position,
  relative to the previous run *)
  | `SUBSCRIPT
]

(* BidiType - enumeration *)
type biditype = [
  (** Left-to-Right *)
  | `L
  (** Left-to-Right Embedding *)
  | `LRE
  (** Left-to-Right Override *)
  | `LRO
  (** Right-to-Left *)
  | `R
  (** Right-to-Left Arabic *)
  | `AL
  (** Right-to-Left Embedding *)
  | `RLE
  (** Right-to-Left Override *)
  | `RLO
  (** Pop Directional Format *)
  | `PDF
  (** European Number *)
  | `EN
  (** European Number Separator *)
  | `ES
  (** European Number Terminator *)
  | `ET
  (** Arabic Number *)
  | `AN
  (** Common Number Separator *)
  | `CS
  (** Nonspacing Mark *)
  | `NSM
  (** Boundary Neutral *)
  | `BN
  (** Paragraph Separator *)
  | `B
  (** Segment Separator *)
  | `S
  (** Whitespace *)
  | `WS
  (** Other Neutrals *)
  | `ON
  (** Left-to-Right isolate. Since 1.48.6 *)
  | `LRI
  (** Right-to-Left isolate. Since 1.48.6 *)
  | `RLI
  (** First strong isolate. Since 1.48.6 *)
  | `FSI
  (** Pop directional isolate. Since 1.48.6 *)
  | `PDI
]

(* CoverageLevel - enumeration *)
type coveragelevel = [
  (** The character is not representable with
  the font. *)
  | `NONE
  (** The character is represented in a
  way that may be comprehensible but is not the correct
  graphical form. For instance, a Hangul character represented
  as a a sequence of Jamos, or a Latin transliteration of a
  Cyrillic word. *)
  | `FALLBACK
  (** The character is represented as
  basically the correct graphical form, but with a stylistic
  variant inappropriate for the current script. *)
  | `APPROXIMATE
  (** The character is represented as the
  correct graphical form. *)
  | `EXACT
]

(* Direction - enumeration *)
type direction = [
  (** A strong left-to-right direction *)
  | `LTR
  (** A strong right-to-left direction *)
  | `RTL
  (** Deprecated value; treated the
  same as `PANGO_DIRECTION_RTL`. *)
  | `TTB_LTR
  (** Deprecated value; treated the
  same as `PANGO_DIRECTION_LTR` *)
  | `TTB_RTL
  (** A weak left-to-right direction *)
  | `WEAK_LTR
  (** A weak right-to-left direction *)
  | `WEAK_RTL
  (** No direction specified *)
  | `NEUTRAL
]

(* EllipsizeMode - enumeration *)
type ellipsizemode = [
  (** No ellipsization *)
  | `NONE
  (** Omit characters at the start of the text *)
  | `START
  (** Omit characters in the middle of the text *)
  | `MIDDLE
  (** Omit characters at the end of the text *)
  | `END
]

(* FontScale - enumeration *)
type fontscale = [
  (** Leave the font size unchanged *)
  | `NONE
  (** Change the font to a size suitable for superscripts *)
  | `SUPERSCRIPT
  (** Change the font to a size suitable for subscripts *)
  | `SUBSCRIPT
  (** Change the font to a size suitable for Small Caps *)
  | `SMALL_CAPS
]

(* Gravity - enumeration *)
type gravity = [
  (** Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png"> *)
  | `SOUTH
  (** Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png"> *)
  | `EAST
  (** Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png"> *)
  | `NORTH
  (** Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png"> *)
  | `WEST
  (** Gravity is resolved from the context matrix *)
  | `AUTO
]

(* GravityHint - enumeration *)
type gravityhint = [
  (** scripts will take their natural gravity based
  on the base gravity and the script.  This is the default. *)
  | `NATURAL
  (** always use the base gravity set, regardless of
  the script. *)
  | `STRONG
  (** for scripts not in their natural direction (eg.
  Latin in East gravity), choose per-script gravity such that every script
  respects the line progression. This means, Latin and Arabic will take
  opposite gravities and both flow top-to-bottom for example. *)
  | `LINE
]

(* LayoutDeserializeError - enumeration *)
type layoutdeserializeerror = [
  (** Unspecified error *)
  | `INVALID
  (** A JSon value could not be
  interpreted *)
  | `INVALID_VALUE
  (** A required JSon member was
  not found *)
  | `MISSING_VALUE
]

(* Overline - enumeration *)
type overline = [
  (** no overline should be drawn *)
  | `NONE
  (** Draw a single line above the ink
  extents of the text being underlined. *)
  | `SINGLE
]

(* RenderPart - enumeration *)
type renderpart = [
  (** the text itself *)
  | `FOREGROUND
  (** the area behind the text *)
  | `BACKGROUND
  (** underlines *)
  | `UNDERLINE
  (** strikethrough lines *)
  | `STRIKETHROUGH
  (** overlines *)
  | `OVERLINE
]

(* Script - enumeration *)
type script = [
  (** a value never returned from pango_script_for_unichar() *)
  | `INVALID_CODE
  (** a character used by multiple different scripts *)
  | `COMMON
  (** a mark glyph that takes its script from the
base glyph to which it is attached *)
  | `INHERITED
  (** Arabic *)
  | `ARABIC
  (** Armenian *)
  | `ARMENIAN
  (** Bengali *)
  | `BENGALI
  (** Bopomofo *)
  | `BOPOMOFO
  (** Cherokee *)
  | `CHEROKEE
  (** Coptic *)
  | `COPTIC
  (** Cyrillic *)
  | `CYRILLIC
  (** Deseret *)
  | `DESERET
  (** Devanagari *)
  | `DEVANAGARI
  (** Ethiopic *)
  | `ETHIOPIC
  (** Georgian *)
  | `GEORGIAN
  (** Gothic *)
  | `GOTHIC
  (** Greek *)
  | `GREEK
  (** Gujarati *)
  | `GUJARATI
  (** Gurmukhi *)
  | `GURMUKHI
  (** Han *)
  | `HAN
  (** Hangul *)
  | `HANGUL
  (** Hebrew *)
  | `HEBREW
  (** Hiragana *)
  | `HIRAGANA
  (** Kannada *)
  | `KANNADA
  (** Katakana *)
  | `KATAKANA
  (** Khmer *)
  | `KHMER
  (** Lao *)
  | `LAO
  (** Latin *)
  | `LATIN
  (** Malayalam *)
  | `MALAYALAM
  (** Mongolian *)
  | `MONGOLIAN
  (** Myanmar *)
  | `MYANMAR
  (** Ogham *)
  | `OGHAM
  (** Old Italic *)
  | `OLD_ITALIC
  (** Oriya *)
  | `ORIYA
  (** Runic *)
  | `RUNIC
  (** Sinhala *)
  | `SINHALA
  (** Syriac *)
  | `SYRIAC
  (** Tamil *)
  | `TAMIL
  (** Telugu *)
  | `TELUGU
  (** Thaana *)
  | `THAANA
  (** Thai *)
  | `THAI
  (** Tibetan *)
  | `TIBETAN
  (** Canadian Aboriginal *)
  | `CANADIAN_ABORIGINAL
  (** Yi *)
  | `YI
  (** Tagalog *)
  | `TAGALOG
  (** Hanunoo *)
  | `HANUNOO
  (** Buhid *)
  | `BUHID
  (** Tagbanwa *)
  | `TAGBANWA
  (** Braille *)
  | `BRAILLE
  (** Cypriot *)
  | `CYPRIOT
  (** Limbu *)
  | `LIMBU
  (** Osmanya *)
  | `OSMANYA
  (** Shavian *)
  | `SHAVIAN
  (** Linear B *)
  | `LINEAR_B
  (** Tai Le *)
  | `TAI_LE
  (** Ugaritic *)
  | `UGARITIC
  (** New Tai Lue. Since 1.10 *)
  | `NEW_TAI_LUE
  (** Buginese. Since 1.10 *)
  | `BUGINESE
  (** Glagolitic. Since 1.10 *)
  | `GLAGOLITIC
  (** Tifinagh. Since 1.10 *)
  | `TIFINAGH
  (** Syloti Nagri. Since 1.10 *)
  | `SYLOTI_NAGRI
  (** Old Persian. Since 1.10 *)
  | `OLD_PERSIAN
  (** Kharoshthi. Since 1.10 *)
  | `KHAROSHTHI
  (** an unassigned code point. Since 1.14 *)
  | `UNKNOWN
  (** Balinese. Since 1.14 *)
  | `BALINESE
  (** Cuneiform. Since 1.14 *)
  | `CUNEIFORM
  (** Phoenician. Since 1.14 *)
  | `PHOENICIAN
  (** Phags-pa. Since 1.14 *)
  | `PHAGS_PA
  (** N'Ko. Since 1.14 *)
  | `NKO
  (** Kayah Li. Since 1.20.1 *)
  | `KAYAH_LI
  (** Lepcha. Since 1.20.1 *)
  | `LEPCHA
  (** Rejang. Since 1.20.1 *)
  | `REJANG
  (** Sundanese. Since 1.20.1 *)
  | `SUNDANESE
  (** Saurashtra. Since 1.20.1 *)
  | `SAURASHTRA
  (** Cham. Since 1.20.1 *)
  | `CHAM
  (** Ol Chiki. Since 1.20.1 *)
  | `OL_CHIKI
  (** Vai. Since 1.20.1 *)
  | `VAI
  (** Carian. Since 1.20.1 *)
  | `CARIAN
  (** Lycian. Since 1.20.1 *)
  | `LYCIAN
  (** Lydian. Since 1.20.1 *)
  | `LYDIAN
  (** Batak. Since 1.32 *)
  | `BATAK
  (** Brahmi. Since 1.32 *)
  | `BRAHMI
  (** Mandaic. Since 1.32 *)
  | `MANDAIC
  (** Chakma. Since: 1.32 *)
  | `CHAKMA
  (** Meroitic Cursive. Since: 1.32 *)
  | `MEROITIC_CURSIVE
  (** Meroitic Hieroglyphs. Since: 1.32 *)
  | `MEROITIC_HIEROGLYPHS
  (** Miao. Since: 1.32 *)
  | `MIAO
  (** Sharada. Since: 1.32 *)
  | `SHARADA
  (** Sora Sompeng. Since: 1.32 *)
  | `SORA_SOMPENG
  (** Takri. Since: 1.32 *)
  | `TAKRI
  (** Bassa. Since: 1.40 *)
  | `BASSA_VAH
  (** Caucasian Albanian. Since: 1.40 *)
  | `CAUCASIAN_ALBANIAN
  (** Duployan. Since: 1.40 *)
  | `DUPLOYAN
  (** Elbasan. Since: 1.40 *)
  | `ELBASAN
  (** Grantha. Since: 1.40 *)
  | `GRANTHA
  (** Kjohki. Since: 1.40 *)
  | `KHOJKI
  (** Khudawadi, Sindhi. Since: 1.40 *)
  | `KHUDAWADI
  (** Linear A. Since: 1.40 *)
  | `LINEAR_A
  (** Mahajani. Since: 1.40 *)
  | `MAHAJANI
  (** Manichaean. Since: 1.40 *)
  | `MANICHAEAN
  (** Mende Kikakui. Since: 1.40 *)
  | `MENDE_KIKAKUI
  (** Modi. Since: 1.40 *)
  | `MODI
  (** Mro. Since: 1.40 *)
  | `MRO
  (** Nabataean. Since: 1.40 *)
  | `NABATAEAN
  (** Old North Arabian. Since: 1.40 *)
  | `OLD_NORTH_ARABIAN
  (** Old Permic. Since: 1.40 *)
  | `OLD_PERMIC
  (** Pahawh Hmong. Since: 1.40 *)
  | `PAHAWH_HMONG
  (** Palmyrene. Since: 1.40 *)
  | `PALMYRENE
  (** Pau Cin Hau. Since: 1.40 *)
  | `PAU_CIN_HAU
  (** Psalter Pahlavi. Since: 1.40 *)
  | `PSALTER_PAHLAVI
  (** Siddham. Since: 1.40 *)
  | `SIDDHAM
  (** Tirhuta. Since: 1.40 *)
  | `TIRHUTA
  (** Warang Citi. Since: 1.40 *)
  | `WARANG_CITI
  (** Ahom. Since: 1.40 *)
  | `AHOM
  (** Anatolian Hieroglyphs. Since: 1.40 *)
  | `ANATOLIAN_HIEROGLYPHS
  (** Hatran. Since: 1.40 *)
  | `HATRAN
  (** Multani. Since: 1.40 *)
  | `MULTANI
  (** Old Hungarian. Since: 1.40 *)
  | `OLD_HUNGARIAN
  (** Signwriting. Since: 1.40 *)
  | `SIGNWRITING
]

(* Stretch - enumeration *)
type stretch = [
  (** ultra condensed width *)
  | `ULTRA_CONDENSED
  (** extra condensed width *)
  | `EXTRA_CONDENSED
  (** condensed width *)
  | `CONDENSED
  (** semi condensed width *)
  | `SEMI_CONDENSED
  (** the normal width *)
  | `NORMAL
  (** semi expanded width *)
  | `SEMI_EXPANDED
  (** expanded width *)
  | `EXPANDED
  (** extra expanded width *)
  | `EXTRA_EXPANDED
  (** ultra expanded width *)
  | `ULTRA_EXPANDED
]

(* Style - enumeration *)
type style = [
  (** the font is upright. *)
  | `NORMAL
  (** the font is slanted, but in a roman style. *)
  | `OBLIQUE
  (** the font is slanted in an italic style. *)
  | `ITALIC
]

(* TabAlign - enumeration *)
type tabalign = [
  (** the text appears to the right of the tab stop position *)
  | `LEFT
  (** the text appears to the left of the tab stop position
  until the available space is filled. Since: 1.50 *)
  | `RIGHT
  (** the text is centered at the tab stop position
  until the available space is filled. Since: 1.50 *)
  | `CENTER
  (** text before the first occurrence of the decimal point
  character appears to the left of the tab stop position (until the available
  space is filled), the rest to the right. Since: 1.50 *)
  | `DECIMAL
]

(* TextTransform - enumeration *)
type texttransform = [
  (** Leave text unchanged *)
  | `NONE
  (** Display letters and numbers as lowercase *)
  | `LOWERCASE
  (** Display letters and numbers as uppercase *)
  | `UPPERCASE
  (** Display the first character of a word
  in titlecase *)
  | `CAPITALIZE
]

(* Underline - enumeration *)
type underline = [
  (** no underline should be drawn *)
  | `NONE
  (** a single underline should be drawn *)
  | `SINGLE
  (** a double underline should be drawn *)
  | `DOUBLE
  (** a single underline should be drawn at a
  position beneath the ink extents of the text being
  underlined. This should be used only for underlining
  single characters, such as for keyboard accelerators.
  %PANGO_UNDERLINE_SINGLE should be used for extended
  portions of text. *)
  | `LOW
  (** an underline indicating an error should
  be drawn below. The exact style of rendering is up to the
  `PangoRenderer` in use, but typical styles include wavy
  or dotted lines.
  This underline is typically used to indicate an error such
  as a possible mispelling; in some cases a contrasting color
  may automatically be used. This type of underlining is
  available since Pango 1.4. *)
  | `ERROR
  (** Like @PANGO_UNDERLINE_SINGLE, but
  drawn continuously across multiple runs. This type
  of underlining is available since Pango 1.46. *)
  | `SINGLE_LINE
  (** Like @PANGO_UNDERLINE_DOUBLE, but
  drawn continuously across multiple runs. This type
  of underlining is available since Pango 1.46. *)
  | `DOUBLE_LINE
  (** Like @PANGO_UNDERLINE_ERROR, but
  drawn continuously across multiple runs. This type
  of underlining is available since Pango 1.46. *)
  | `ERROR_LINE
]

(* Variant - enumeration *)
type variant = [
  (** A normal font. *)
  | `NORMAL
  (** A font with the lower case characters
  replaced by smaller variants of the capital characters. *)
  | `SMALL_CAPS
  (** A font with all characters
  replaced by smaller variants of the capital characters. Since: 1.50 *)
  | `ALL_SMALL_CAPS
  (** A font with the lower case characters
  replaced by smaller variants of the capital characters.
  Petite Caps can be even smaller than Small Caps. Since: 1.50 *)
  | `PETITE_CAPS
  (** A font with all characters
  replaced by smaller variants of the capital characters.
  Petite Caps can be even smaller than Small Caps. Since: 1.50 *)
  | `ALL_PETITE_CAPS
  (** A font with the upper case characters
  replaced by smaller variants of the capital letters. Since: 1.50 *)
  | `UNICASE
  (** A font with capital letters that
  are more suitable for all-uppercase titles. Since: 1.50 *)
  | `TITLE_CAPS
]

(* Weight - enumeration *)
type weight = [
  (** the thin weight (= 100) Since: 1.24 *)
  | `THIN
  (** the ultralight weight (= 200) *)
  | `ULTRALIGHT
  (** the light weight (= 300) *)
  | `LIGHT
  (** the semilight weight (= 350) Since: 1.36.7 *)
  | `SEMILIGHT
  (** the book weight (= 380) Since: 1.24) *)
  | `BOOK
  (** the default weight (= 400) *)
  | `NORMAL
  (** the medium weight (= 500) Since: 1.24 *)
  | `MEDIUM
  (** the semibold weight (= 600) *)
  | `SEMIBOLD
  (** the bold weight (= 700) *)
  | `BOLD
  (** the ultrabold weight (= 800) *)
  | `ULTRABOLD
  (** the heavy weight (= 900) *)
  | `HEAVY
  (** the ultraheavy weight (= 1000) Since: 1.24 *)
  | `ULTRAHEAVY
]

(* WrapMode - enumeration *)
type wrapmode = [
  (** wrap lines at word boundaries. *)
  | `WORD
  (** wrap lines at character boundaries. *)
  | `CHAR
  (** wrap lines at word boundaries, but fall back to
  character boundaries if there is not enough space for a full word. *)
  | `WORD_CHAR
]

(* FontMask - bitfield/flags *)
type fontmask_flag = [
  (** the font family is specified. *)
  | `FAMILY
  (** the font style is specified. *)
  | `STYLE
  (** the font variant is specified. *)
  | `VARIANT
  (** the font weight is specified. *)
  | `WEIGHT
  (** the font stretch is specified. *)
  | `STRETCH
  (** the font size is specified. *)
  | `SIZE
  (** the font gravity is specified (Since: 1.16.) *)
  | `GRAVITY
  (** OpenType font variations are specified (Since: 1.42) *)
  | `VARIATIONS
]

type fontmask = fontmask_flag list

(* LayoutDeserializeFlags - bitfield/flags *)
type layoutdeserializeflags_flag = [
  (** Default behavior *)
  | `DEFAULT
  (** Apply context information
  from the serialization to the `PangoContext` *)
  | `CONTEXT
]

type layoutdeserializeflags = layoutdeserializeflags_flag list

(* LayoutSerializeFlags - bitfield/flags *)
type layoutserializeflags_flag = [
  (** Default behavior *)
  | `DEFAULT
  (** Include context information *)
  | `CONTEXT
  (** Include information about the formatted output *)
  | `OUTPUT
]

type layoutserializeflags = layoutserializeflags_flag list

(* ShapeFlags - bitfield/flags *)
type shapeflags_flag = [
  (** Default value *)
  | `NONE
  (** Round glyph positions and widths to whole device units
  This option should be set if the target renderer can't do subpixel positioning of glyphs *)
  | `ROUND_POSITIONS
]

type shapeflags = shapeflags_flag list

(* ShowFlags - bitfield/flags *)
type showflags_flag = [
  (** No special treatment for invisible characters *)
  | `NONE
  (** Render spaces, tabs and newlines visibly *)
  | `SPACES
  (** Render line breaks visibly *)
  | `LINE_BREAKS
  (** Render default-ignorable Unicode
  characters visibly *)
  | `IGNORABLES
]

type showflags = showflags_flag list

