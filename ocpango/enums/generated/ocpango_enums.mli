(* GENERATED CODE - DO NOT EDIT *)
(* Pango Enumeration and Bitfield Types *)

(* Alignment - enumeration *)
type alignment = [
  | `LEFT (** Put all available space on the right *)
  | `CENTER (** Center the line within the available space *)
  | `RIGHT (** Put all available space on the left *)
]

val alignment_of_int : int -> alignment
val alignment_to_int : alignment -> int

(* AttrType - enumeration *)
type attrtype = [
  | `INVALID (** does not happen *)
  | `LANGUAGE (** language ([Pango.AttrLanguage]) *)
  | `FAMILY (** font family name list ([Pango.AttrString]) *)
  | `STYLE (** font slant style ([Pango.AttrInt]) *)
  | `WEIGHT (** font weight ([Pango.AttrInt]) *)
  | `VARIANT (** font variant (normal or small caps) ([Pango.AttrInt]) *)
  | `STRETCH (** font stretch ([Pango.AttrInt]) *)
  | `SIZE (** font size in points scaled by [PANGO_SCALE] ([Pango.AttrInt]) *)
  | `FONT_DESC (** font description ([Pango.AttrFontDesc]) *)
  | `FOREGROUND (** foreground color ([Pango.AttrColor]) *)
  | `BACKGROUND (** background color ([Pango.AttrColor]) *)
  | `UNDERLINE (** whether the text has an underline ([Pango.AttrInt]) *)
  | `STRIKETHROUGH (** whether the text is struck-through ([Pango.AttrInt]) *)
  | `RISE (** baseline displacement ([Pango.AttrInt]) *)
  | `SHAPE (** shape ([Pango.AttrShape]) *)
  | `SCALE (** font size scale factor ([Pango.AttrFloat]) *)
  | `FALLBACK (** whether fallback is enabled ([Pango.AttrInt]) *)
  | `LETTER_SPACING (** letter spacing ([PangoAttrInt]) *)
  | `UNDERLINE_COLOR (** underline color ([Pango.AttrColor]) *)
  | `STRIKETHROUGH_COLOR (** strikethrough color ([Pango.AttrColor]) *)
  | `ABSOLUTE_SIZE (** font size in pixels scaled by [PANGO_SCALE] ([Pango.AttrInt]) *)
  | `GRAVITY (** base text gravity ([Pango.AttrInt]) *)
  | `GRAVITY_HINT (** gravity hint ([Pango.AttrInt]) *)
  | `FONT_FEATURES (** OpenType font features ([Pango.AttrFontFeatures]). Since 1.38 *)
  | `FOREGROUND_ALPHA (** foreground alpha ([Pango.AttrInt]). Since 1.38 *)
  | `BACKGROUND_ALPHA (** background alpha ([Pango.AttrInt]). Since 1.38 *)
  | `ALLOW_BREAKS (** whether breaks are allowed ([Pango.AttrInt]). Since 1.44 *)
  | `SHOW (** how to render invisible characters ([Pango.AttrInt]). Since 1.44 *)
  | `INSERT_HYPHENS (** whether to insert hyphens at intra-word line breaks ([Pango.AttrInt]). Since 1.44 *)
  | `OVERLINE (** whether the text has an overline ([Pango.AttrInt]). Since 1.46 *)
  | `OVERLINE_COLOR (** overline color ([Pango.AttrColor]). Since 1.46 *)
  | `LINE_HEIGHT (** line height factor ([Pango.AttrFloat]). Since: 1.50 *)
  | `ABSOLUTE_LINE_HEIGHT (** line height ([Pango.AttrInt]). Since: 1.50 *)
  | `TEXT_TRANSFORM
  | `WORD (** override segmentation to classify the range of the attribute as a single word ([Pango.AttrInt]). Since 1.50 *)
  | `SENTENCE (** override segmentation to classify the range of the attribute as a single sentence ([Pango.AttrInt]). Since 1.50 *)
  | `BASELINE_SHIFT (** baseline displacement ([Pango.AttrInt]). Since 1.50 *)
  | `FONT_SCALE (** font-relative size change ([Pango.AttrInt]). Since 1.50 *)
]

val attrtype_of_int : int -> attrtype
val attrtype_to_int : attrtype -> int

(* BaselineShift - enumeration *)
type baselineshift = [
  | `NONE (** Leave the baseline unchanged *)
  | `SUPERSCRIPT (** Shift the baseline to the superscript position,
relative to the previous run *)
  | `SUBSCRIPT (** Shift the baseline to the subscript position,
relative to the previous run *)
]

val baselineshift_of_int : int -> baselineshift
val baselineshift_to_int : baselineshift -> int

(* BidiType - enumeration *)
type biditype = [
  | `L (** Left-to-Right *)
  | `LRE (** Left-to-Right Embedding *)
  | `LRO (** Left-to-Right Override *)
  | `R (** Right-to-Left *)
  | `AL (** Right-to-Left Arabic *)
  | `RLE (** Right-to-Left Embedding *)
  | `RLO (** Right-to-Left Override *)
  | `PDF (** Pop Directional Format *)
  | `EN (** European Number *)
  | `ES (** European Number Separator *)
  | `ET (** European Number Terminator *)
  | `AN (** Arabic Number *)
  | `CS (** Common Number Separator *)
  | `NSM (** Nonspacing Mark *)
  | `BN (** Boundary Neutral *)
  | `B (** Paragraph Separator *)
  | `S (** Segment Separator *)
  | `WS (** Whitespace *)
  | `ON (** Other Neutrals *)
  | `LRI (** Left-to-Right isolate. Since 1.48.6 *)
  | `RLI (** Right-to-Left isolate. Since 1.48.6 *)
  | `FSI (** First strong isolate. Since 1.48.6 *)
  | `PDI (** Pop directional isolate. Since 1.48.6 *)
]

val biditype_of_int : int -> biditype
val biditype_to_int : biditype -> int

(* CoverageLevel - enumeration *)
type coveragelevel = [
  | `NONE (** The character is not representable with
the font. *)
  | `FALLBACK (** The character is represented in a
way that may be comprehensible but is not the correct
graphical form. For instance, a Hangul character represented
as a a sequence of Jamos, or a Latin transliteration of a
Cyrillic word. *)
  | `APPROXIMATE (** The character is represented as
basically the correct graphical form, but with a stylistic
variant inappropriate for the current script. *)
  | `EXACT (** The character is represented as the
correct graphical form. *)
]

val coveragelevel_of_int : int -> coveragelevel
val coveragelevel_to_int : coveragelevel -> int

(* Direction - enumeration *)
type direction = [
  | `LTR (** A strong left-to-right direction *)
  | `RTL (** A strong right-to-left direction *)
  | `TTB_LTR (** Deprecated value; treated the
same as [PANGO_DIRECTION_RTL]. *)
  | `TTB_RTL (** Deprecated value; treated the
same as [PANGO_DIRECTION_LTR] *)
  | `WEAK_LTR (** A weak left-to-right direction *)
  | `WEAK_RTL (** A weak right-to-left direction *)
  | `NEUTRAL (** No direction specified *)
]

val direction_of_int : int -> direction
val direction_to_int : direction -> int

(* EllipsizeMode - enumeration *)
type ellipsizemode = [
  | `NONE (** No ellipsization *)
  | `START (** Omit characters at the start of the text *)
  | `MIDDLE (** Omit characters in the middle of the text *)
  | `END (** Omit characters at the end of the text *)
]

val ellipsizemode_of_int : int -> ellipsizemode
val ellipsizemode_to_int : ellipsizemode -> int

(* FontColor - enumeration *)
type fontcolor = [
  | `FORBIDDEN (** The font should not have color glyphs *)
  | `REQUIRED (** The font should have color glyphs *)
  | `DONT_CARE (** The font may or may not use color *)
]

val fontcolor_of_int : int -> fontcolor
val fontcolor_to_int : fontcolor -> int

(* FontScale - enumeration *)
type fontscale = [
  | `NONE (** Leave the font size unchanged *)
  | `SUPERSCRIPT (** Change the font to a size suitable for superscripts *)
  | `SUBSCRIPT (** Change the font to a size suitable for subscripts *)
  | `SMALL_CAPS (** Change the font to a size suitable for Small Caps *)
]

val fontscale_of_int : int -> fontscale
val fontscale_to_int : fontscale -> int

(* Gravity - enumeration *)
type gravity = [
  | `SOUTH (** Glyphs stand upright (default) *)
  | `EAST (** Glyphs are rotated 90 degrees counter-clockwise. *)
  | `NORTH (** Glyphs are upside-down. *)
  | `WEST (** Glyphs are rotated 90 degrees clockwise. *)
  | `AUTO (** Gravity is resolved from the context matrix *)
]

val gravity_of_int : int -> gravity
val gravity_to_int : gravity -> int

(* GravityHint - enumeration *)
type gravityhint = [
  | `NATURAL (** scripts will take their natural gravity based
on the base gravity and the script.  This is the default. *)
  | `STRONG (** always use the base gravity set, regardless of
the script. *)
  | `LINE (** for scripts not in their natural direction (eg.
Latin in East gravity), choose per-script gravity such that every script
respects the line progression. This means, Latin and Arabic will take
opposite gravities and both flow top-to-bottom for example. *)
]

val gravityhint_of_int : int -> gravityhint
val gravityhint_to_int : gravityhint -> int

(* LayoutDeserializeError - enumeration *)
type layoutdeserializeerror = [
  | `INVALID (** Unspecified error *)
  | `INVALID_VALUE (** A JSon value could not be
interpreted *)
  | `MISSING_VALUE (** A required JSon member was
not found *)
]

val layoutdeserializeerror_of_int : int -> layoutdeserializeerror
val layoutdeserializeerror_to_int : layoutdeserializeerror -> int

(* Overline - enumeration *)
type overline = [
  | `NONE (** no overline should be drawn *)
  | `SINGLE (** Draw a single line above the ink
extents of the text being underlined. *)
]

val overline_of_int : int -> overline
val overline_to_int : overline -> int

(* RenderPart - enumeration *)
type renderpart = [
  | `FOREGROUND (** the text itself *)
  | `BACKGROUND (** the area behind the text *)
  | `UNDERLINE (** underlines *)
  | `STRIKETHROUGH (** strikethrough lines *)
  | `OVERLINE (** overlines *)
]

val renderpart_of_int : int -> renderpart
val renderpart_to_int : renderpart -> int

(* Script - enumeration *)
type script = [
  | `INVALID_CODE (** a value never returned from pango_script_for_unichar() *)
  | `COMMON (** a character used by multiple different scripts *)
  | `INHERITED (** a mark glyph that takes its script from the
base glyph to which it is attached *)
  | `ARABIC (** Arabic *)
  | `ARMENIAN (** Armenian *)
  | `BENGALI (** Bengali *)
  | `BOPOMOFO (** Bopomofo *)
  | `CHEROKEE (** Cherokee *)
  | `COPTIC (** Coptic *)
  | `CYRILLIC (** Cyrillic *)
  | `DESERET (** Deseret *)
  | `DEVANAGARI (** Devanagari *)
  | `ETHIOPIC (** Ethiopic *)
  | `GEORGIAN (** Georgian *)
  | `GOTHIC (** Gothic *)
  | `GREEK (** Greek *)
  | `GUJARATI (** Gujarati *)
  | `GURMUKHI (** Gurmukhi *)
  | `HAN (** Han *)
  | `HANGUL (** Hangul *)
  | `HEBREW (** Hebrew *)
  | `HIRAGANA (** Hiragana *)
  | `KANNADA (** Kannada *)
  | `KATAKANA (** Katakana *)
  | `KHMER (** Khmer *)
  | `LAO (** Lao *)
  | `LATIN (** Latin *)
  | `MALAYALAM (** Malayalam *)
  | `MONGOLIAN (** Mongolian *)
  | `MYANMAR (** Myanmar *)
  | `OGHAM (** Ogham *)
  | `OLD_ITALIC (** Old Italic *)
  | `ORIYA (** Oriya *)
  | `RUNIC (** Runic *)
  | `SINHALA (** Sinhala *)
  | `SYRIAC (** Syriac *)
  | `TAMIL (** Tamil *)
  | `TELUGU (** Telugu *)
  | `THAANA (** Thaana *)
  | `THAI (** Thai *)
  | `TIBETAN (** Tibetan *)
  | `CANADIAN_ABORIGINAL (** Canadian Aboriginal *)
  | `YI (** Yi *)
  | `TAGALOG (** Tagalog *)
  | `HANUNOO (** Hanunoo *)
  | `BUHID (** Buhid *)
  | `TAGBANWA (** Tagbanwa *)
  | `BRAILLE (** Braille *)
  | `CYPRIOT (** Cypriot *)
  | `LIMBU (** Limbu *)
  | `OSMANYA (** Osmanya *)
  | `SHAVIAN (** Shavian *)
  | `LINEAR_B (** Linear B *)
  | `TAI_LE (** Tai Le *)
  | `UGARITIC (** Ugaritic *)
  | `NEW_TAI_LUE (** New Tai Lue. Since 1.10 *)
  | `BUGINESE (** Buginese. Since 1.10 *)
  | `GLAGOLITIC (** Glagolitic. Since 1.10 *)
  | `TIFINAGH (** Tifinagh. Since 1.10 *)
  | `SYLOTI_NAGRI (** Syloti Nagri. Since 1.10 *)
  | `OLD_PERSIAN (** Old Persian. Since 1.10 *)
  | `KHAROSHTHI (** Kharoshthi. Since 1.10 *)
  | `UNKNOWN (** an unassigned code point. Since 1.14 *)
  | `BALINESE (** Balinese. Since 1.14 *)
  | `CUNEIFORM (** Cuneiform. Since 1.14 *)
  | `PHOENICIAN (** Phoenician. Since 1.14 *)
  | `PHAGS_PA (** Phags-pa. Since 1.14 *)
  | `NKO (** N'Ko. Since 1.14 *)
  | `KAYAH_LI (** Kayah Li. Since 1.20.1 *)
  | `LEPCHA (** Lepcha. Since 1.20.1 *)
  | `REJANG (** Rejang. Since 1.20.1 *)
  | `SUNDANESE (** Sundanese. Since 1.20.1 *)
  | `SAURASHTRA (** Saurashtra. Since 1.20.1 *)
  | `CHAM (** Cham. Since 1.20.1 *)
  | `OL_CHIKI (** Ol Chiki. Since 1.20.1 *)
  | `VAI (** Vai. Since 1.20.1 *)
  | `CARIAN (** Carian. Since 1.20.1 *)
  | `LYCIAN (** Lycian. Since 1.20.1 *)
  | `LYDIAN (** Lydian. Since 1.20.1 *)
  | `BATAK (** Batak. Since 1.32 *)
  | `BRAHMI (** Brahmi. Since 1.32 *)
  | `MANDAIC (** Mandaic. Since 1.32 *)
  | `CHAKMA (** Chakma. Since: 1.32 *)
  | `MEROITIC_CURSIVE (** Meroitic Cursive. Since: 1.32 *)
  | `MEROITIC_HIEROGLYPHS (** Meroitic Hieroglyphs. Since: 1.32 *)
  | `MIAO (** Miao. Since: 1.32 *)
  | `SHARADA (** Sharada. Since: 1.32 *)
  | `SORA_SOMPENG (** Sora Sompeng. Since: 1.32 *)
  | `TAKRI (** Takri. Since: 1.32 *)
  | `BASSA_VAH (** Bassa. Since: 1.40 *)
  | `CAUCASIAN_ALBANIAN (** Caucasian Albanian. Since: 1.40 *)
  | `DUPLOYAN (** Duployan. Since: 1.40 *)
  | `ELBASAN (** Elbasan. Since: 1.40 *)
  | `GRANTHA (** Grantha. Since: 1.40 *)
  | `KHOJKI (** Kjohki. Since: 1.40 *)
  | `KHUDAWADI (** Khudawadi, Sindhi. Since: 1.40 *)
  | `LINEAR_A (** Linear A. Since: 1.40 *)
  | `MAHAJANI (** Mahajani. Since: 1.40 *)
  | `MANICHAEAN (** Manichaean. Since: 1.40 *)
  | `MENDE_KIKAKUI (** Mende Kikakui. Since: 1.40 *)
  | `MODI (** Modi. Since: 1.40 *)
  | `MRO (** Mro. Since: 1.40 *)
  | `NABATAEAN (** Nabataean. Since: 1.40 *)
  | `OLD_NORTH_ARABIAN (** Old North Arabian. Since: 1.40 *)
  | `OLD_PERMIC (** Old Permic. Since: 1.40 *)
  | `PAHAWH_HMONG (** Pahawh Hmong. Since: 1.40 *)
  | `PALMYRENE (** Palmyrene. Since: 1.40 *)
  | `PAU_CIN_HAU (** Pau Cin Hau. Since: 1.40 *)
  | `PSALTER_PAHLAVI (** Psalter Pahlavi. Since: 1.40 *)
  | `SIDDHAM (** Siddham. Since: 1.40 *)
  | `TIRHUTA (** Tirhuta. Since: 1.40 *)
  | `WARANG_CITI (** Warang Citi. Since: 1.40 *)
  | `AHOM (** Ahom. Since: 1.40 *)
  | `ANATOLIAN_HIEROGLYPHS (** Anatolian Hieroglyphs. Since: 1.40 *)
  | `HATRAN (** Hatran. Since: 1.40 *)
  | `MULTANI (** Multani. Since: 1.40 *)
  | `OLD_HUNGARIAN (** Old Hungarian. Since: 1.40 *)
  | `SIGNWRITING (** Signwriting. Since: 1.40 *)
]

val script_of_int : int -> script
val script_to_int : script -> int

(* Stretch - enumeration *)
type stretch = [
  | `ULTRA_CONDENSED (** ultra condensed width *)
  | `EXTRA_CONDENSED (** extra condensed width *)
  | `CONDENSED (** condensed width *)
  | `SEMI_CONDENSED (** semi condensed width *)
  | `NORMAL (** the normal width *)
  | `SEMI_EXPANDED (** semi expanded width *)
  | `EXPANDED (** expanded width *)
  | `EXTRA_EXPANDED (** extra expanded width *)
  | `ULTRA_EXPANDED (** ultra expanded width *)
]

val stretch_of_int : int -> stretch
val stretch_to_int : stretch -> int

(* Style - enumeration *)
type style = [
  | `NORMAL (** the font is upright. *)
  | `OBLIQUE (** the font is slanted, but in a roman style. *)
  | `ITALIC (** the font is slanted in an italic style. *)
]

val style_of_int : int -> style
val style_to_int : style -> int

(* TabAlign - enumeration *)
type tabalign = [
  | `LEFT (** the text appears to the right of the tab stop position *)
  | `RIGHT (** the text appears to the left of the tab stop position
until the available space is filled. Since: 1.50 *)
  | `CENTER (** the text is centered at the tab stop position
until the available space is filled. Since: 1.50 *)
  | `DECIMAL (** text before the first occurrence of the decimal point
character appears to the left of the tab stop position (until the available
space is filled), the rest to the right. Since: 1.50 *)
]

val tabalign_of_int : int -> tabalign
val tabalign_to_int : tabalign -> int

(* TextTransform - enumeration *)
type texttransform = [
  | `NONE (** Leave text unchanged *)
  | `LOWERCASE (** Display letters and numbers as lowercase *)
  | `UPPERCASE (** Display letters and numbers as uppercase *)
  | `CAPITALIZE (** Display the first character of a word
in titlecase *)
]

val texttransform_of_int : int -> texttransform
val texttransform_to_int : texttransform -> int

(* Underline - enumeration *)
type underline = [
  | `NONE (** no underline should be drawn *)
  | `SINGLE (** a single underline should be drawn *)
  | `DOUBLE (** a double underline should be drawn *)
  | `LOW (** a single underline should be drawn at a
position beneath the ink extents of the text being
underlined. This should be used only for underlining
single characters, such as for keyboard accelerators.
[PANGO_UNDERLINE_SINGLE] should be used for extended
portions of text. *)
  | `ERROR (** an underline indicating an error should
be drawn below. The exact style of rendering is up to the
[PangoRenderer] in use, but typical styles include wavy
or dotted lines.
This underline is typically used to indicate an error such
as a possible mispelling; in some cases a contrasting color
may automatically be used. This type of underlining is
available since Pango 1.4. *)
  | `SINGLE_LINE (** Like \@PANGO_UNDERLINE_SINGLE, but
drawn continuously across multiple runs. This type
of underlining is available since Pango 1.46. *)
  | `DOUBLE_LINE (** Like \@PANGO_UNDERLINE_DOUBLE, but
drawn continuously across multiple runs. This type
of underlining is available since Pango 1.46. *)
  | `ERROR_LINE (** Like \@PANGO_UNDERLINE_ERROR, but
drawn continuously across multiple runs. This type
of underlining is available since Pango 1.46. *)
]

val underline_of_int : int -> underline
val underline_to_int : underline -> int

(* Variant - enumeration *)
type variant = [
  | `NORMAL (** A normal font. *)
  | `SMALL_CAPS (** A font with the lower case characters
replaced by smaller variants of the capital characters. *)
  | `ALL_SMALL_CAPS (** A font with all characters
replaced by smaller variants of the capital characters. Since: 1.50 *)
  | `PETITE_CAPS (** A font with the lower case characters
replaced by smaller variants of the capital characters.
Petite Caps can be even smaller than Small Caps. Since: 1.50 *)
  | `ALL_PETITE_CAPS (** A font with all characters
replaced by smaller variants of the capital characters.
Petite Caps can be even smaller than Small Caps. Since: 1.50 *)
  | `UNICASE (** A font with the upper case characters
replaced by smaller variants of the capital letters. Since: 1.50 *)
  | `TITLE_CAPS (** A font with capital letters that
are more suitable for all-uppercase titles. Since: 1.50 *)
]

val variant_of_int : int -> variant
val variant_to_int : variant -> int

(* Weight - enumeration *)
type weight = [
  | `THIN (** the thin weight (= 100) Since: 1.24 *)
  | `ULTRALIGHT (** the ultralight weight (= 200) *)
  | `LIGHT (** the light weight (= 300) *)
  | `SEMILIGHT (** the semilight weight (= 350) Since: 1.36.7 *)
  | `BOOK (** the book weight (= 380) Since: 1.24) *)
  | `NORMAL (** the default weight (= 400) *)
  | `MEDIUM (** the medium weight (= 500) Since: 1.24 *)
  | `SEMIBOLD (** the semibold weight (= 600) *)
  | `BOLD (** the bold weight (= 700) *)
  | `ULTRABOLD (** the ultrabold weight (= 800) *)
  | `HEAVY (** the heavy weight (= 900) *)
  | `ULTRAHEAVY (** the ultraheavy weight (= 1000) Since: 1.24 *)
]

val weight_of_int : int -> weight
val weight_to_int : weight -> int

(* WrapMode - enumeration *)
type wrapmode = [
  | `WORD (** wrap lines at word boundaries. *)
  | `CHAR (** wrap lines at character boundaries. *)
  | `WORD_CHAR (** wrap lines at word boundaries, but fall back to
character boundaries if there is not enough space for a full word. *)
  | `NONE (** do not wrap. *)
]

val wrapmode_of_int : int -> wrapmode
val wrapmode_to_int : wrapmode -> int

(* FontMask - bitfield/flags *)
type fontmask_flag = [
  | `FAMILY (** the font family is specified. *)
  | `STYLE (** the font style is specified. *)
  | `VARIANT (** the font variant is specified. *)
  | `WEIGHT (** the font weight is specified. *)
  | `STRETCH (** the font stretch is specified. *)
  | `SIZE (** the font size is specified. *)
  | `GRAVITY (** The font gravity is specified. *)
  | `VARIATIONS (** OpenType font variations are specified. *)
  | `FEATURES (** OpenType font features are specified. *)
  | `COLOR (** Font color is specified. *)
]

type fontmask = fontmask_flag list

val fontmask_of_int : int -> fontmask
val fontmask_to_int : fontmask -> int

(* LayoutDeserializeFlags - bitfield/flags *)
type layoutdeserializeflags_flag = [
  | `DEFAULT (** Default behavior *)
  | `CONTEXT (** Apply context information
from the serialization to the [PangoContext] *)
]

type layoutdeserializeflags = layoutdeserializeflags_flag list

val layoutdeserializeflags_of_int : int -> layoutdeserializeflags
val layoutdeserializeflags_to_int : layoutdeserializeflags -> int

(* LayoutSerializeFlags - bitfield/flags *)
type layoutserializeflags_flag = [
  | `DEFAULT (** Default behavior *)
  | `CONTEXT (** Include context information *)
  | `OUTPUT (** Include information about the formatted output *)
]

type layoutserializeflags = layoutserializeflags_flag list

val layoutserializeflags_of_int : int -> layoutserializeflags
val layoutserializeflags_to_int : layoutserializeflags -> int

(* ShapeFlags - bitfield/flags *)
type shapeflags_flag = [
  | `NONE (** Default value *)
  | `ROUND_POSITIONS (** Round glyph positions and widths to whole device units
This option should be set if the target renderer can't do subpixel positioning of glyphs *)
]

type shapeflags = shapeflags_flag list

val shapeflags_of_int : int -> shapeflags
val shapeflags_to_int : shapeflags -> int

(* ShowFlags - bitfield/flags *)
type showflags_flag = [
  | `NONE (** No special treatment for invisible characters *)
  | `SPACES (** Render spaces, tabs and newlines visibly *)
  | `LINE_BREAKS (** Render line breaks visibly *)
  | `IGNORABLES (** Render default-ignorable Unicode
characters visibly *)
]

type showflags = showflags_flag list

val showflags_of_int : int -> showflags
val showflags_to_int : showflags -> int

