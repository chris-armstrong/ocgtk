/* GENERATED CODE - DO NOT EDIT */
/* Pango enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <pango/pango.h>

/* Convert PangoAlignment to OCaml value */
value Val_PangoAlignment(PangoAlignment val) {
  switch (val) {
    case PANGO_ALIGN_LEFT: return Val_int(28713888); /* `LEFT */
    case PANGO_ALIGN_CENTER: return Val_int(428864253); /* `CENTER */
    case PANGO_ALIGN_RIGHT: return Val_int(961111566); /* `RIGHT */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoAlignment */
PangoAlignment PangoAlignment_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return PANGO_ALIGN_LEFT; /* `LEFT */
  else if (tag == 428864253) return PANGO_ALIGN_CENTER; /* `CENTER */
  else if (tag == 961111566) return PANGO_ALIGN_RIGHT; /* `RIGHT */
  else return PANGO_ALIGN_LEFT; /* fallback to first value */
}

/* Convert PangoAttrType to OCaml value */
value Val_PangoAttrType(PangoAttrType val) {
  switch (val) {
    case PANGO_ATTR_INVALID: return Val_int(21795536); /* `INVALID */
    case PANGO_ATTR_LANGUAGE: return Val_int(696246403); /* `LANGUAGE */
    case PANGO_ATTR_FAMILY: return Val_int(690675795); /* `FAMILY */
    case PANGO_ATTR_STYLE: return Val_int(994234501); /* `STYLE */
    case PANGO_ATTR_WEIGHT: return Val_int(444952276); /* `WEIGHT */
    case PANGO_ATTR_VARIANT: return Val_int(149033485); /* `VARIANT */
    case PANGO_ATTR_STRETCH: return Val_int(776874522); /* `STRETCH */
    case PANGO_ATTR_SIZE: return Val_int(583873574); /* `SIZE */
    case PANGO_ATTR_FONT_DESC: return Val_int(600019319); /* `FONT_DESC */
    case PANGO_ATTR_FOREGROUND: return Val_int(351117237); /* `FOREGROUND */
    case PANGO_ATTR_BACKGROUND: return Val_int(470994225); /* `BACKGROUND */
    case PANGO_ATTR_UNDERLINE: return Val_int(915931128); /* `UNDERLINE */
    case PANGO_ATTR_STRIKETHROUGH: return Val_int(1031065527); /* `STRIKETHROUGH */
    case PANGO_ATTR_RISE: return Val_int(367016468); /* `RISE */
    case PANGO_ATTR_SHAPE: return Val_int(830742436); /* `SHAPE */
    case PANGO_ATTR_SCALE: return Val_int(656763574); /* `SCALE */
    case PANGO_ATTR_FALLBACK: return Val_int(779493537); /* `FALLBACK */
    case PANGO_ATTR_LETTER_SPACING: return Val_int(874486577); /* `LETTER_SPACING */
    case PANGO_ATTR_UNDERLINE_COLOR: return Val_int(161618783); /* `UNDERLINE_COLOR */
    case PANGO_ATTR_STRIKETHROUGH_COLOR: return Val_int(468969062); /* `STRIKETHROUGH_COLOR */
    case PANGO_ATTR_ABSOLUTE_SIZE: return Val_int(600033714); /* `ABSOLUTE_SIZE */
    case PANGO_ATTR_GRAVITY: return Val_int(428947646); /* `GRAVITY */
    case PANGO_ATTR_GRAVITY_HINT: return Val_int(1039934895); /* `GRAVITY_HINT */
    case PANGO_ATTR_FONT_FEATURES: return Val_int(1027575744); /* `FONT_FEATURES */
    case PANGO_ATTR_FOREGROUND_ALPHA: return Val_int(96434402); /* `FOREGROUND_ALPHA */
    case PANGO_ATTR_BACKGROUND_ALPHA: return Val_int(43402935); /* `BACKGROUND_ALPHA */
    case PANGO_ATTR_ALLOW_BREAKS: return Val_int(846298335); /* `ALLOW_BREAKS */
    case PANGO_ATTR_SHOW: return Val_int(246205598); /* `SHOW */
    case PANGO_ATTR_INSERT_HYPHENS: return Val_int(262113864); /* `INSERT_HYPHENS */
    case PANGO_ATTR_OVERLINE: return Val_int(404255281); /* `OVERLINE */
    case PANGO_ATTR_OVERLINE_COLOR: return Val_int(35756311); /* `OVERLINE_COLOR */
    case PANGO_ATTR_LINE_HEIGHT: return Val_int(160509663); /* `LINE_HEIGHT */
    case PANGO_ATTR_ABSOLUTE_LINE_HEIGHT: return Val_int(412525584); /* `ABSOLUTE_LINE_HEIGHT */
    case PANGO_ATTR_TEXT_TRANSFORM: return Val_int(1018486956); /* `TEXT_TRANSFORM */
    case PANGO_ATTR_WORD: return Val_int(777616121); /* `WORD */
    case PANGO_ATTR_SENTENCE: return Val_int(336540193); /* `SENTENCE */
    case PANGO_ATTR_BASELINE_SHIFT: return Val_int(481160053); /* `BASELINE_SHIFT */
    case PANGO_ATTR_FONT_SCALE: return Val_int(388180849); /* `FONT_SCALE */
    default: return Val_int(21795536); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoAttrType */
PangoAttrType PangoAttrType_val(value val) {
  int tag = Int_val(val);
  if (tag == 21795536) return PANGO_ATTR_INVALID; /* `INVALID */
  else if (tag == 696246403) return PANGO_ATTR_LANGUAGE; /* `LANGUAGE */
  else if (tag == 690675795) return PANGO_ATTR_FAMILY; /* `FAMILY */
  else if (tag == 994234501) return PANGO_ATTR_STYLE; /* `STYLE */
  else if (tag == 444952276) return PANGO_ATTR_WEIGHT; /* `WEIGHT */
  else if (tag == 149033485) return PANGO_ATTR_VARIANT; /* `VARIANT */
  else if (tag == 776874522) return PANGO_ATTR_STRETCH; /* `STRETCH */
  else if (tag == 583873574) return PANGO_ATTR_SIZE; /* `SIZE */
  else if (tag == 600019319) return PANGO_ATTR_FONT_DESC; /* `FONT_DESC */
  else if (tag == 351117237) return PANGO_ATTR_FOREGROUND; /* `FOREGROUND */
  else if (tag == 470994225) return PANGO_ATTR_BACKGROUND; /* `BACKGROUND */
  else if (tag == 915931128) return PANGO_ATTR_UNDERLINE; /* `UNDERLINE */
  else if (tag == 1031065527) return PANGO_ATTR_STRIKETHROUGH; /* `STRIKETHROUGH */
  else if (tag == 367016468) return PANGO_ATTR_RISE; /* `RISE */
  else if (tag == 830742436) return PANGO_ATTR_SHAPE; /* `SHAPE */
  else if (tag == 656763574) return PANGO_ATTR_SCALE; /* `SCALE */
  else if (tag == 779493537) return PANGO_ATTR_FALLBACK; /* `FALLBACK */
  else if (tag == 874486577) return PANGO_ATTR_LETTER_SPACING; /* `LETTER_SPACING */
  else if (tag == 161618783) return PANGO_ATTR_UNDERLINE_COLOR; /* `UNDERLINE_COLOR */
  else if (tag == 468969062) return PANGO_ATTR_STRIKETHROUGH_COLOR; /* `STRIKETHROUGH_COLOR */
  else if (tag == 600033714) return PANGO_ATTR_ABSOLUTE_SIZE; /* `ABSOLUTE_SIZE */
  else if (tag == 428947646) return PANGO_ATTR_GRAVITY; /* `GRAVITY */
  else if (tag == 1039934895) return PANGO_ATTR_GRAVITY_HINT; /* `GRAVITY_HINT */
  else if (tag == 1027575744) return PANGO_ATTR_FONT_FEATURES; /* `FONT_FEATURES */
  else if (tag == 96434402) return PANGO_ATTR_FOREGROUND_ALPHA; /* `FOREGROUND_ALPHA */
  else if (tag == 43402935) return PANGO_ATTR_BACKGROUND_ALPHA; /* `BACKGROUND_ALPHA */
  else if (tag == 846298335) return PANGO_ATTR_ALLOW_BREAKS; /* `ALLOW_BREAKS */
  else if (tag == 246205598) return PANGO_ATTR_SHOW; /* `SHOW */
  else if (tag == 262113864) return PANGO_ATTR_INSERT_HYPHENS; /* `INSERT_HYPHENS */
  else if (tag == 404255281) return PANGO_ATTR_OVERLINE; /* `OVERLINE */
  else if (tag == 35756311) return PANGO_ATTR_OVERLINE_COLOR; /* `OVERLINE_COLOR */
  else if (tag == 160509663) return PANGO_ATTR_LINE_HEIGHT; /* `LINE_HEIGHT */
  else if (tag == 412525584) return PANGO_ATTR_ABSOLUTE_LINE_HEIGHT; /* `ABSOLUTE_LINE_HEIGHT */
  else if (tag == 1018486956) return PANGO_ATTR_TEXT_TRANSFORM; /* `TEXT_TRANSFORM */
  else if (tag == 777616121) return PANGO_ATTR_WORD; /* `WORD */
  else if (tag == 336540193) return PANGO_ATTR_SENTENCE; /* `SENTENCE */
  else if (tag == 481160053) return PANGO_ATTR_BASELINE_SHIFT; /* `BASELINE_SHIFT */
  else if (tag == 388180849) return PANGO_ATTR_FONT_SCALE; /* `FONT_SCALE */
  else return PANGO_ATTR_INVALID; /* fallback to first value */
}

/* Convert PangoBaselineShift to OCaml value */
value Val_PangoBaselineShift(PangoBaselineShift val) {
  switch (val) {
    case PANGO_BASELINE_SHIFT_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_BASELINE_SHIFT_SUPERSCRIPT: return Val_int(3635498); /* `SUPERSCRIPT */
    case PANGO_BASELINE_SHIFT_SUBSCRIPT: return Val_int(150827848); /* `SUBSCRIPT */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoBaselineShift */
PangoBaselineShift PangoBaselineShift_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_BASELINE_SHIFT_NONE; /* `NONE */
  else if (tag == 3635498) return PANGO_BASELINE_SHIFT_SUPERSCRIPT; /* `SUPERSCRIPT */
  else if (tag == 150827848) return PANGO_BASELINE_SHIFT_SUBSCRIPT; /* `SUBSCRIPT */
  else return PANGO_BASELINE_SHIFT_NONE; /* fallback to first value */
}

/* Convert PangoBidiType to OCaml value */
value Val_PangoBidiType(PangoBidiType val) {
  switch (val) {
    case PANGO_BIDI_TYPE_L: return Val_int(968623803); /* `L */
    case PANGO_BIDI_TYPE_LRE: return Val_int(370372783); /* `LRE */
    case PANGO_BIDI_TYPE_LRO: return Val_int(673508804); /* `LRO */
    case PANGO_BIDI_TYPE_R: return Val_int(79828666); /* `R */
    case PANGO_BIDI_TYPE_AL: return Val_int(174524869); /* `AL */
    case PANGO_BIDI_TYPE_RLE: return Val_int(132631321); /* `RLE */
    case PANGO_BIDI_TYPE_RLO: return Val_int(669464831); /* `RLO */
    case PANGO_BIDI_TYPE_PDF: return Val_int(263986643); /* `PDF */
    case PANGO_BIDI_TYPE_EN: return Val_int(213841260); /* `EN */
    case PANGO_BIDI_TYPE_ES: return Val_int(77305852); /* `ES */
    case PANGO_BIDI_TYPE_ET: return Val_int(235190962); /* `ET */
    case PANGO_BIDI_TYPE_AN: return Val_int(515408503); /* `AN */
    case PANGO_BIDI_TYPE_CS: return Val_int(287920971); /* `CS */
    case PANGO_BIDI_TYPE_NSM: return Val_int(77081022); /* `NSM */
    case PANGO_BIDI_TYPE_BN: return Val_int(1011612352); /* `BN */
    case PANGO_BIDI_TYPE_B: return Val_int(306990974); /* `B */
    case PANGO_BIDI_TYPE_S: return Val_int(536346917); /* `S */
    case PANGO_BIDI_TYPE_WS: return Val_int(701020638); /* `WS */
    case PANGO_BIDI_TYPE_ON: return Val_int(358689837); /* `ON */
    case PANGO_BIDI_TYPE_LRI: return Val_int(647185929); /* `LRI */
    case PANGO_BIDI_TYPE_RLI: return Val_int(978621341); /* `RLI */
    case PANGO_BIDI_TYPE_FSI: return Val_int(299210672); /* `FSI */
    case PANGO_BIDI_TYPE_PDI: return Val_int(877048734); /* `PDI */
    default: return Val_int(968623803); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoBidiType */
PangoBidiType PangoBidiType_val(value val) {
  int tag = Int_val(val);
  if (tag == 968623803) return PANGO_BIDI_TYPE_L; /* `L */
  else if (tag == 370372783) return PANGO_BIDI_TYPE_LRE; /* `LRE */
  else if (tag == 673508804) return PANGO_BIDI_TYPE_LRO; /* `LRO */
  else if (tag == 79828666) return PANGO_BIDI_TYPE_R; /* `R */
  else if (tag == 174524869) return PANGO_BIDI_TYPE_AL; /* `AL */
  else if (tag == 132631321) return PANGO_BIDI_TYPE_RLE; /* `RLE */
  else if (tag == 669464831) return PANGO_BIDI_TYPE_RLO; /* `RLO */
  else if (tag == 263986643) return PANGO_BIDI_TYPE_PDF; /* `PDF */
  else if (tag == 213841260) return PANGO_BIDI_TYPE_EN; /* `EN */
  else if (tag == 77305852) return PANGO_BIDI_TYPE_ES; /* `ES */
  else if (tag == 235190962) return PANGO_BIDI_TYPE_ET; /* `ET */
  else if (tag == 515408503) return PANGO_BIDI_TYPE_AN; /* `AN */
  else if (tag == 287920971) return PANGO_BIDI_TYPE_CS; /* `CS */
  else if (tag == 77081022) return PANGO_BIDI_TYPE_NSM; /* `NSM */
  else if (tag == 1011612352) return PANGO_BIDI_TYPE_BN; /* `BN */
  else if (tag == 306990974) return PANGO_BIDI_TYPE_B; /* `B */
  else if (tag == 536346917) return PANGO_BIDI_TYPE_S; /* `S */
  else if (tag == 701020638) return PANGO_BIDI_TYPE_WS; /* `WS */
  else if (tag == 358689837) return PANGO_BIDI_TYPE_ON; /* `ON */
  else if (tag == 647185929) return PANGO_BIDI_TYPE_LRI; /* `LRI */
  else if (tag == 978621341) return PANGO_BIDI_TYPE_RLI; /* `RLI */
  else if (tag == 299210672) return PANGO_BIDI_TYPE_FSI; /* `FSI */
  else if (tag == 877048734) return PANGO_BIDI_TYPE_PDI; /* `PDI */
  else return PANGO_BIDI_TYPE_L; /* fallback to first value */
}

/* Convert PangoCoverageLevel to OCaml value */
value Val_PangoCoverageLevel(PangoCoverageLevel val) {
  switch (val) {
    case PANGO_COVERAGE_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_COVERAGE_FALLBACK: return Val_int(779493537); /* `FALLBACK */
    case PANGO_COVERAGE_APPROXIMATE: return Val_int(559033432); /* `APPROXIMATE */
    case PANGO_COVERAGE_EXACT: return Val_int(863737765); /* `EXACT */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoCoverageLevel */
PangoCoverageLevel PangoCoverageLevel_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_COVERAGE_NONE; /* `NONE */
  else if (tag == 779493537) return PANGO_COVERAGE_FALLBACK; /* `FALLBACK */
  else if (tag == 559033432) return PANGO_COVERAGE_APPROXIMATE; /* `APPROXIMATE */
  else if (tag == 863737765) return PANGO_COVERAGE_EXACT; /* `EXACT */
  else return PANGO_COVERAGE_NONE; /* fallback to first value */
}

/* Convert PangoDirection to OCaml value */
value Val_PangoDirection(PangoDirection val) {
  switch (val) {
    case PANGO_DIRECTION_LTR: return Val_int(1043707392); /* `LTR */
    case PANGO_DIRECTION_RTL: return Val_int(286034419); /* `RTL */
    case PANGO_DIRECTION_TTB_LTR: return Val_int(574761293); /* `TTB_LTR */
    case PANGO_DIRECTION_TTB_RTL: return Val_int(279789118); /* `TTB_RTL */
    case PANGO_DIRECTION_WEAK_LTR: return Val_int(520644184); /* `WEAK_LTR */
    case PANGO_DIRECTION_WEAK_RTL: return Val_int(1022395282); /* `WEAK_RTL */
    case PANGO_DIRECTION_NEUTRAL: return Val_int(678781523); /* `NEUTRAL */
    default: return Val_int(1043707392); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoDirection */
PangoDirection PangoDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 1043707392) return PANGO_DIRECTION_LTR; /* `LTR */
  else if (tag == 286034419) return PANGO_DIRECTION_RTL; /* `RTL */
  else if (tag == 574761293) return PANGO_DIRECTION_TTB_LTR; /* `TTB_LTR */
  else if (tag == 279789118) return PANGO_DIRECTION_TTB_RTL; /* `TTB_RTL */
  else if (tag == 520644184) return PANGO_DIRECTION_WEAK_LTR; /* `WEAK_LTR */
  else if (tag == 1022395282) return PANGO_DIRECTION_WEAK_RTL; /* `WEAK_RTL */
  else if (tag == 678781523) return PANGO_DIRECTION_NEUTRAL; /* `NEUTRAL */
  else return PANGO_DIRECTION_LTR; /* fallback to first value */
}

/* Convert PangoEllipsizeMode to OCaml value */
value Val_PangoEllipsizeMode(PangoEllipsizeMode val) {
  switch (val) {
    case PANGO_ELLIPSIZE_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_ELLIPSIZE_START: return Val_int(23743610); /* `START */
    case PANGO_ELLIPSIZE_MIDDLE: return Val_int(830963744); /* `MIDDLE */
    case PANGO_ELLIPSIZE_END: return Val_int(735747473); /* `END */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoEllipsizeMode */
PangoEllipsizeMode PangoEllipsizeMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_ELLIPSIZE_NONE; /* `NONE */
  else if (tag == 23743610) return PANGO_ELLIPSIZE_START; /* `START */
  else if (tag == 830963744) return PANGO_ELLIPSIZE_MIDDLE; /* `MIDDLE */
  else if (tag == 735747473) return PANGO_ELLIPSIZE_END; /* `END */
  else return PANGO_ELLIPSIZE_NONE; /* fallback to first value */
}

/* Convert PangoFontScale to OCaml value */
value Val_PangoFontScale(PangoFontScale val) {
  switch (val) {
    case PANGO_FONT_SCALE_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_FONT_SCALE_SUPERSCRIPT: return Val_int(3635498); /* `SUPERSCRIPT */
    case PANGO_FONT_SCALE_SUBSCRIPT: return Val_int(150827848); /* `SUBSCRIPT */
    case PANGO_FONT_SCALE_SMALL_CAPS: return Val_int(777054865); /* `SMALL_CAPS */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoFontScale */
PangoFontScale PangoFontScale_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_FONT_SCALE_NONE; /* `NONE */
  else if (tag == 3635498) return PANGO_FONT_SCALE_SUPERSCRIPT; /* `SUPERSCRIPT */
  else if (tag == 150827848) return PANGO_FONT_SCALE_SUBSCRIPT; /* `SUBSCRIPT */
  else if (tag == 777054865) return PANGO_FONT_SCALE_SMALL_CAPS; /* `SMALL_CAPS */
  else return PANGO_FONT_SCALE_NONE; /* fallback to first value */
}

/* Convert PangoGravity to OCaml value */
value Val_PangoGravity(PangoGravity val) {
  switch (val) {
    case PANGO_GRAVITY_SOUTH: return Val_int(799707224); /* `SOUTH */
    case PANGO_GRAVITY_EAST: return Val_int(1069568433); /* `EAST */
    case PANGO_GRAVITY_NORTH: return Val_int(632341845); /* `NORTH */
    case PANGO_GRAVITY_WEST: return Val_int(385862739); /* `WEST */
    case PANGO_GRAVITY_AUTO: return Val_int(736658275); /* `AUTO */
    default: return Val_int(799707224); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoGravity */
PangoGravity PangoGravity_val(value val) {
  int tag = Int_val(val);
  if (tag == 799707224) return PANGO_GRAVITY_SOUTH; /* `SOUTH */
  else if (tag == 1069568433) return PANGO_GRAVITY_EAST; /* `EAST */
  else if (tag == 632341845) return PANGO_GRAVITY_NORTH; /* `NORTH */
  else if (tag == 385862739) return PANGO_GRAVITY_WEST; /* `WEST */
  else if (tag == 736658275) return PANGO_GRAVITY_AUTO; /* `AUTO */
  else return PANGO_GRAVITY_SOUTH; /* fallback to first value */
}

/* Convert PangoGravityHint to OCaml value */
value Val_PangoGravityHint(PangoGravityHint val) {
  switch (val) {
    case PANGO_GRAVITY_HINT_NATURAL: return Val_int(934000437); /* `NATURAL */
    case PANGO_GRAVITY_HINT_STRONG: return Val_int(953257587); /* `STRONG */
    case PANGO_GRAVITY_HINT_LINE: return Val_int(452458406); /* `LINE */
    default: return Val_int(934000437); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoGravityHint */
PangoGravityHint PangoGravityHint_val(value val) {
  int tag = Int_val(val);
  if (tag == 934000437) return PANGO_GRAVITY_HINT_NATURAL; /* `NATURAL */
  else if (tag == 953257587) return PANGO_GRAVITY_HINT_STRONG; /* `STRONG */
  else if (tag == 452458406) return PANGO_GRAVITY_HINT_LINE; /* `LINE */
  else return PANGO_GRAVITY_HINT_NATURAL; /* fallback to first value */
}

/* Convert PangoLayoutDeserializeError to OCaml value */
value Val_PangoLayoutDeserializeError(PangoLayoutDeserializeError val) {
  switch (val) {
    case PANGO_LAYOUT_DESERIALIZE_INVALID: return Val_int(21795536); /* `INVALID */
    case PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE: return Val_int(12173541); /* `INVALID_VALUE */
    case PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE: return Val_int(572667593); /* `MISSING_VALUE */
    default: return Val_int(21795536); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoLayoutDeserializeError */
PangoLayoutDeserializeError PangoLayoutDeserializeError_val(value val) {
  int tag = Int_val(val);
  if (tag == 21795536) return PANGO_LAYOUT_DESERIALIZE_INVALID; /* `INVALID */
  else if (tag == 12173541) return PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE; /* `INVALID_VALUE */
  else if (tag == 572667593) return PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE; /* `MISSING_VALUE */
  else return PANGO_LAYOUT_DESERIALIZE_INVALID; /* fallback to first value */
}

/* Convert PangoOverline to OCaml value */
value Val_PangoOverline(PangoOverline val) {
  switch (val) {
    case PANGO_OVERLINE_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_OVERLINE_SINGLE: return Val_int(155377302); /* `SINGLE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoOverline */
PangoOverline PangoOverline_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_OVERLINE_NONE; /* `NONE */
  else if (tag == 155377302) return PANGO_OVERLINE_SINGLE; /* `SINGLE */
  else return PANGO_OVERLINE_NONE; /* fallback to first value */
}

/* Convert PangoRenderPart to OCaml value */
value Val_PangoRenderPart(PangoRenderPart val) {
  switch (val) {
    case PANGO_RENDER_PART_FOREGROUND: return Val_int(351117237); /* `FOREGROUND */
    case PANGO_RENDER_PART_BACKGROUND: return Val_int(470994225); /* `BACKGROUND */
    case PANGO_RENDER_PART_UNDERLINE: return Val_int(915931128); /* `UNDERLINE */
    case PANGO_RENDER_PART_STRIKETHROUGH: return Val_int(1031065527); /* `STRIKETHROUGH */
    case PANGO_RENDER_PART_OVERLINE: return Val_int(404255281); /* `OVERLINE */
    default: return Val_int(351117237); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoRenderPart */
PangoRenderPart PangoRenderPart_val(value val) {
  int tag = Int_val(val);
  if (tag == 351117237) return PANGO_RENDER_PART_FOREGROUND; /* `FOREGROUND */
  else if (tag == 470994225) return PANGO_RENDER_PART_BACKGROUND; /* `BACKGROUND */
  else if (tag == 915931128) return PANGO_RENDER_PART_UNDERLINE; /* `UNDERLINE */
  else if (tag == 1031065527) return PANGO_RENDER_PART_STRIKETHROUGH; /* `STRIKETHROUGH */
  else if (tag == 404255281) return PANGO_RENDER_PART_OVERLINE; /* `OVERLINE */
  else return PANGO_RENDER_PART_FOREGROUND; /* fallback to first value */
}

/* Convert PangoScript to OCaml value */
value Val_PangoScript(PangoScript val) {
  switch (val) {
    case PANGO_SCRIPT_INVALID_CODE: return Val_int(457631147); /* `INVALID_CODE */
    case PANGO_SCRIPT_COMMON: return Val_int(888403474); /* `COMMON */
    case PANGO_SCRIPT_INHERITED: return Val_int(947069025); /* `INHERITED */
    case PANGO_SCRIPT_ARABIC: return Val_int(1046854101); /* `ARABIC */
    case PANGO_SCRIPT_ARMENIAN: return Val_int(204956222); /* `ARMENIAN */
    case PANGO_SCRIPT_BENGALI: return Val_int(33720650); /* `BENGALI */
    case PANGO_SCRIPT_BOPOMOFO: return Val_int(905448207); /* `BOPOMOFO */
    case PANGO_SCRIPT_CHEROKEE: return Val_int(115415412); /* `CHEROKEE */
    case PANGO_SCRIPT_COPTIC: return Val_int(89989651); /* `COPTIC */
    case PANGO_SCRIPT_CYRILLIC: return Val_int(740988910); /* `CYRILLIC */
    case PANGO_SCRIPT_DESERET: return Val_int(317009713); /* `DESERET */
    case PANGO_SCRIPT_DEVANAGARI: return Val_int(921122319); /* `DEVANAGARI */
    case PANGO_SCRIPT_ETHIOPIC: return Val_int(832765559); /* `ETHIOPIC */
    case PANGO_SCRIPT_GEORGIAN: return Val_int(248643106); /* `GEORGIAN */
    case PANGO_SCRIPT_GOTHIC: return Val_int(696993988); /* `GOTHIC */
    case PANGO_SCRIPT_GREEK: return Val_int(739185517); /* `GREEK */
    case PANGO_SCRIPT_GUJARATI: return Val_int(366169248); /* `GUJARATI */
    case PANGO_SCRIPT_GURMUKHI: return Val_int(35038955); /* `GURMUKHI */
    case PANGO_SCRIPT_HAN: return Val_int(554288721); /* `HAN */
    case PANGO_SCRIPT_HANGUL: return Val_int(648535209); /* `HANGUL */
    case PANGO_SCRIPT_HEBREW: return Val_int(990031594); /* `HEBREW */
    case PANGO_SCRIPT_HIRAGANA: return Val_int(1033990551); /* `HIRAGANA */
    case PANGO_SCRIPT_KANNADA: return Val_int(804223036); /* `KANNADA */
    case PANGO_SCRIPT_KATAKANA: return Val_int(993070887); /* `KATAKANA */
    case PANGO_SCRIPT_KHMER: return Val_int(471120818); /* `KHMER */
    case PANGO_SCRIPT_LAO: return Val_int(957912931); /* `LAO */
    case PANGO_SCRIPT_LATIN: return Val_int(1005970602); /* `LATIN */
    case PANGO_SCRIPT_MALAYALAM: return Val_int(758277928); /* `MALAYALAM */
    case PANGO_SCRIPT_MONGOLIAN: return Val_int(550923525); /* `MONGOLIAN */
    case PANGO_SCRIPT_MYANMAR: return Val_int(625288029); /* `MYANMAR */
    case PANGO_SCRIPT_OGHAM: return Val_int(828572809); /* `OGHAM */
    case PANGO_SCRIPT_OLD_ITALIC: return Val_int(570308534); /* `OLD_ITALIC */
    case PANGO_SCRIPT_ORIYA: return Val_int(594214862); /* `ORIYA */
    case PANGO_SCRIPT_RUNIC: return Val_int(930650220); /* `RUNIC */
    case PANGO_SCRIPT_SINHALA: return Val_int(539336143); /* `SINHALA */
    case PANGO_SCRIPT_SYRIAC: return Val_int(926724461); /* `SYRIAC */
    case PANGO_SCRIPT_TAMIL: return Val_int(651788888); /* `TAMIL */
    case PANGO_SCRIPT_TELUGU: return Val_int(85301294); /* `TELUGU */
    case PANGO_SCRIPT_THAANA: return Val_int(128641928); /* `THAANA */
    case PANGO_SCRIPT_THAI: return Val_int(118915059); /* `THAI */
    case PANGO_SCRIPT_TIBETAN: return Val_int(785312355); /* `TIBETAN */
    case PANGO_SCRIPT_CANADIAN_ABORIGINAL: return Val_int(752023847); /* `CANADIAN_ABORIGINAL */
    case PANGO_SCRIPT_YI: return Val_int(654774522); /* `YI */
    case PANGO_SCRIPT_TAGALOG: return Val_int(141909653); /* `TAGALOG */
    case PANGO_SCRIPT_HANUNOO: return Val_int(341929430); /* `HANUNOO */
    case PANGO_SCRIPT_BUHID: return Val_int(773451847); /* `BUHID */
    case PANGO_SCRIPT_TAGBANWA: return Val_int(1036292903); /* `TAGBANWA */
    case PANGO_SCRIPT_BRAILLE: return Val_int(675694331); /* `BRAILLE */
    case PANGO_SCRIPT_CYPRIOT: return Val_int(158148565); /* `CYPRIOT */
    case PANGO_SCRIPT_LIMBU: return Val_int(769354317); /* `LIMBU */
    case PANGO_SCRIPT_OSMANYA: return Val_int(1037752390); /* `OSMANYA */
    case PANGO_SCRIPT_SHAVIAN: return Val_int(937925872); /* `SHAVIAN */
    case PANGO_SCRIPT_LINEAR_B: return Val_int(215885707); /* `LINEAR_B */
    case PANGO_SCRIPT_TAI_LE: return Val_int(680043698); /* `TAI_LE */
    case PANGO_SCRIPT_UGARITIC: return Val_int(222284778); /* `UGARITIC */
    case PANGO_SCRIPT_NEW_TAI_LUE: return Val_int(686931958); /* `NEW_TAI_LUE */
    case PANGO_SCRIPT_BUGINESE: return Val_int(522710951); /* `BUGINESE */
    case PANGO_SCRIPT_GLAGOLITIC: return Val_int(3658062); /* `GLAGOLITIC */
    case PANGO_SCRIPT_TIFINAGH: return Val_int(339632113); /* `TIFINAGH */
    case PANGO_SCRIPT_SYLOTI_NAGRI: return Val_int(78369994); /* `SYLOTI_NAGRI */
    case PANGO_SCRIPT_OLD_PERSIAN: return Val_int(884719065); /* `OLD_PERSIAN */
    case PANGO_SCRIPT_KHAROSHTHI: return Val_int(268026677); /* `KHAROSHTHI */
    case PANGO_SCRIPT_UNKNOWN: return Val_int(140725159); /* `UNKNOWN */
    case PANGO_SCRIPT_BALINESE: return Val_int(343177033); /* `BALINESE */
    case PANGO_SCRIPT_CUNEIFORM: return Val_int(637813617); /* `CUNEIFORM */
    case PANGO_SCRIPT_PHOENICIAN: return Val_int(1027009176); /* `PHOENICIAN */
    case PANGO_SCRIPT_PHAGS_PA: return Val_int(976815464); /* `PHAGS_PA */
    case PANGO_SCRIPT_NKO: return Val_int(1049114334); /* `NKO */
    case PANGO_SCRIPT_KAYAH_LI: return Val_int(575245500); /* `KAYAH_LI */
    case PANGO_SCRIPT_LEPCHA: return Val_int(78559658); /* `LEPCHA */
    case PANGO_SCRIPT_REJANG: return Val_int(726825295); /* `REJANG */
    case PANGO_SCRIPT_SUNDANESE: return Val_int(973580318); /* `SUNDANESE */
    case PANGO_SCRIPT_SAURASHTRA: return Val_int(689573803); /* `SAURASHTRA */
    case PANGO_SCRIPT_CHAM: return Val_int(597624174); /* `CHAM */
    case PANGO_SCRIPT_OL_CHIKI: return Val_int(700137543); /* `OL_CHIKI */
    case PANGO_SCRIPT_VAI: return Val_int(435942453); /* `VAI */
    case PANGO_SCRIPT_CARIAN: return Val_int(733646840); /* `CARIAN */
    case PANGO_SCRIPT_LYCIAN: return Val_int(392438); /* `LYCIAN */
    case PANGO_SCRIPT_LYDIAN: return Val_int(67943444); /* `LYDIAN */
    case PANGO_SCRIPT_BATAK: return Val_int(706383515); /* `BATAK */
    case PANGO_SCRIPT_BRAHMI: return Val_int(284941827); /* `BRAHMI */
    case PANGO_SCRIPT_MANDAIC: return Val_int(74879664); /* `MANDAIC */
    case PANGO_SCRIPT_CHAKMA: return Val_int(552851107); /* `CHAKMA */
    case PANGO_SCRIPT_MEROITIC_CURSIVE: return Val_int(593766392); /* `MEROITIC_CURSIVE */
    case PANGO_SCRIPT_MEROITIC_HIEROGLYPHS: return Val_int(718800425); /* `MEROITIC_HIEROGLYPHS */
    case PANGO_SCRIPT_MIAO: return Val_int(529104693); /* `MIAO */
    case PANGO_SCRIPT_SHARADA: return Val_int(150462963); /* `SHARADA */
    case PANGO_SCRIPT_SORA_SOMPENG: return Val_int(333760044); /* `SORA_SOMPENG */
    case PANGO_SCRIPT_TAKRI: return Val_int(424908059); /* `TAKRI */
    case PANGO_SCRIPT_BASSA_VAH: return Val_int(734092100); /* `BASSA_VAH */
    case PANGO_SCRIPT_CAUCASIAN_ALBANIAN: return Val_int(717896744); /* `CAUCASIAN_ALBANIAN */
    case PANGO_SCRIPT_DUPLOYAN: return Val_int(606875281); /* `DUPLOYAN */
    case PANGO_SCRIPT_ELBASAN: return Val_int(321010976); /* `ELBASAN */
    case PANGO_SCRIPT_GRANTHA: return Val_int(657162361); /* `GRANTHA */
    case PANGO_SCRIPT_KHOJKI: return Val_int(483175593); /* `KHOJKI */
    case PANGO_SCRIPT_KHUDAWADI: return Val_int(426925336); /* `KHUDAWADI */
    case PANGO_SCRIPT_LINEAR_A: return Val_int(36541901); /* `LINEAR_A */
    case PANGO_SCRIPT_MAHAJANI: return Val_int(992083256); /* `MAHAJANI */
    case PANGO_SCRIPT_MANICHAEAN: return Val_int(818901423); /* `MANICHAEAN */
    case PANGO_SCRIPT_MENDE_KIKAKUI: return Val_int(332226262); /* `MENDE_KIKAKUI */
    case PANGO_SCRIPT_MODI: return Val_int(957906894); /* `MODI */
    case PANGO_SCRIPT_MRO: return Val_int(581710864); /* `MRO */
    case PANGO_SCRIPT_NABATAEAN: return Val_int(485640442); /* `NABATAEAN */
    case PANGO_SCRIPT_OLD_NORTH_ARABIAN: return Val_int(713049459); /* `OLD_NORTH_ARABIAN */
    case PANGO_SCRIPT_OLD_PERMIC: return Val_int(532505532); /* `OLD_PERMIC */
    case PANGO_SCRIPT_PAHAWH_HMONG: return Val_int(1001470075); /* `PAHAWH_HMONG */
    case PANGO_SCRIPT_PALMYRENE: return Val_int(938293716); /* `PALMYRENE */
    case PANGO_SCRIPT_PAU_CIN_HAU: return Val_int(123422782); /* `PAU_CIN_HAU */
    case PANGO_SCRIPT_PSALTER_PAHLAVI: return Val_int(864824028); /* `PSALTER_PAHLAVI */
    case PANGO_SCRIPT_SIDDHAM: return Val_int(674368960); /* `SIDDHAM */
    case PANGO_SCRIPT_TIRHUTA: return Val_int(205819143); /* `TIRHUTA */
    case PANGO_SCRIPT_WARANG_CITI: return Val_int(189262066); /* `WARANG_CITI */
    case PANGO_SCRIPT_AHOM: return Val_int(136499912); /* `AHOM */
    case PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS: return Val_int(623652297); /* `ANATOLIAN_HIEROGLYPHS */
    case PANGO_SCRIPT_HATRAN: return Val_int(391315220); /* `HATRAN */
    case PANGO_SCRIPT_MULTANI: return Val_int(478814089); /* `MULTANI */
    case PANGO_SCRIPT_OLD_HUNGARIAN: return Val_int(825238724); /* `OLD_HUNGARIAN */
    case PANGO_SCRIPT_SIGNWRITING: return Val_int(628627055); /* `SIGNWRITING */
    default: return Val_int(457631147); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoScript */
PangoScript PangoScript_val(value val) {
  int tag = Int_val(val);
  if (tag == 457631147) return PANGO_SCRIPT_INVALID_CODE; /* `INVALID_CODE */
  else if (tag == 888403474) return PANGO_SCRIPT_COMMON; /* `COMMON */
  else if (tag == 947069025) return PANGO_SCRIPT_INHERITED; /* `INHERITED */
  else if (tag == 1046854101) return PANGO_SCRIPT_ARABIC; /* `ARABIC */
  else if (tag == 204956222) return PANGO_SCRIPT_ARMENIAN; /* `ARMENIAN */
  else if (tag == 33720650) return PANGO_SCRIPT_BENGALI; /* `BENGALI */
  else if (tag == 905448207) return PANGO_SCRIPT_BOPOMOFO; /* `BOPOMOFO */
  else if (tag == 115415412) return PANGO_SCRIPT_CHEROKEE; /* `CHEROKEE */
  else if (tag == 89989651) return PANGO_SCRIPT_COPTIC; /* `COPTIC */
  else if (tag == 740988910) return PANGO_SCRIPT_CYRILLIC; /* `CYRILLIC */
  else if (tag == 317009713) return PANGO_SCRIPT_DESERET; /* `DESERET */
  else if (tag == 921122319) return PANGO_SCRIPT_DEVANAGARI; /* `DEVANAGARI */
  else if (tag == 832765559) return PANGO_SCRIPT_ETHIOPIC; /* `ETHIOPIC */
  else if (tag == 248643106) return PANGO_SCRIPT_GEORGIAN; /* `GEORGIAN */
  else if (tag == 696993988) return PANGO_SCRIPT_GOTHIC; /* `GOTHIC */
  else if (tag == 739185517) return PANGO_SCRIPT_GREEK; /* `GREEK */
  else if (tag == 366169248) return PANGO_SCRIPT_GUJARATI; /* `GUJARATI */
  else if (tag == 35038955) return PANGO_SCRIPT_GURMUKHI; /* `GURMUKHI */
  else if (tag == 554288721) return PANGO_SCRIPT_HAN; /* `HAN */
  else if (tag == 648535209) return PANGO_SCRIPT_HANGUL; /* `HANGUL */
  else if (tag == 990031594) return PANGO_SCRIPT_HEBREW; /* `HEBREW */
  else if (tag == 1033990551) return PANGO_SCRIPT_HIRAGANA; /* `HIRAGANA */
  else if (tag == 804223036) return PANGO_SCRIPT_KANNADA; /* `KANNADA */
  else if (tag == 993070887) return PANGO_SCRIPT_KATAKANA; /* `KATAKANA */
  else if (tag == 471120818) return PANGO_SCRIPT_KHMER; /* `KHMER */
  else if (tag == 957912931) return PANGO_SCRIPT_LAO; /* `LAO */
  else if (tag == 1005970602) return PANGO_SCRIPT_LATIN; /* `LATIN */
  else if (tag == 758277928) return PANGO_SCRIPT_MALAYALAM; /* `MALAYALAM */
  else if (tag == 550923525) return PANGO_SCRIPT_MONGOLIAN; /* `MONGOLIAN */
  else if (tag == 625288029) return PANGO_SCRIPT_MYANMAR; /* `MYANMAR */
  else if (tag == 828572809) return PANGO_SCRIPT_OGHAM; /* `OGHAM */
  else if (tag == 570308534) return PANGO_SCRIPT_OLD_ITALIC; /* `OLD_ITALIC */
  else if (tag == 594214862) return PANGO_SCRIPT_ORIYA; /* `ORIYA */
  else if (tag == 930650220) return PANGO_SCRIPT_RUNIC; /* `RUNIC */
  else if (tag == 539336143) return PANGO_SCRIPT_SINHALA; /* `SINHALA */
  else if (tag == 926724461) return PANGO_SCRIPT_SYRIAC; /* `SYRIAC */
  else if (tag == 651788888) return PANGO_SCRIPT_TAMIL; /* `TAMIL */
  else if (tag == 85301294) return PANGO_SCRIPT_TELUGU; /* `TELUGU */
  else if (tag == 128641928) return PANGO_SCRIPT_THAANA; /* `THAANA */
  else if (tag == 118915059) return PANGO_SCRIPT_THAI; /* `THAI */
  else if (tag == 785312355) return PANGO_SCRIPT_TIBETAN; /* `TIBETAN */
  else if (tag == 752023847) return PANGO_SCRIPT_CANADIAN_ABORIGINAL; /* `CANADIAN_ABORIGINAL */
  else if (tag == 654774522) return PANGO_SCRIPT_YI; /* `YI */
  else if (tag == 141909653) return PANGO_SCRIPT_TAGALOG; /* `TAGALOG */
  else if (tag == 341929430) return PANGO_SCRIPT_HANUNOO; /* `HANUNOO */
  else if (tag == 773451847) return PANGO_SCRIPT_BUHID; /* `BUHID */
  else if (tag == 1036292903) return PANGO_SCRIPT_TAGBANWA; /* `TAGBANWA */
  else if (tag == 675694331) return PANGO_SCRIPT_BRAILLE; /* `BRAILLE */
  else if (tag == 158148565) return PANGO_SCRIPT_CYPRIOT; /* `CYPRIOT */
  else if (tag == 769354317) return PANGO_SCRIPT_LIMBU; /* `LIMBU */
  else if (tag == 1037752390) return PANGO_SCRIPT_OSMANYA; /* `OSMANYA */
  else if (tag == 937925872) return PANGO_SCRIPT_SHAVIAN; /* `SHAVIAN */
  else if (tag == 215885707) return PANGO_SCRIPT_LINEAR_B; /* `LINEAR_B */
  else if (tag == 680043698) return PANGO_SCRIPT_TAI_LE; /* `TAI_LE */
  else if (tag == 222284778) return PANGO_SCRIPT_UGARITIC; /* `UGARITIC */
  else if (tag == 686931958) return PANGO_SCRIPT_NEW_TAI_LUE; /* `NEW_TAI_LUE */
  else if (tag == 522710951) return PANGO_SCRIPT_BUGINESE; /* `BUGINESE */
  else if (tag == 3658062) return PANGO_SCRIPT_GLAGOLITIC; /* `GLAGOLITIC */
  else if (tag == 339632113) return PANGO_SCRIPT_TIFINAGH; /* `TIFINAGH */
  else if (tag == 78369994) return PANGO_SCRIPT_SYLOTI_NAGRI; /* `SYLOTI_NAGRI */
  else if (tag == 884719065) return PANGO_SCRIPT_OLD_PERSIAN; /* `OLD_PERSIAN */
  else if (tag == 268026677) return PANGO_SCRIPT_KHAROSHTHI; /* `KHAROSHTHI */
  else if (tag == 140725159) return PANGO_SCRIPT_UNKNOWN; /* `UNKNOWN */
  else if (tag == 343177033) return PANGO_SCRIPT_BALINESE; /* `BALINESE */
  else if (tag == 637813617) return PANGO_SCRIPT_CUNEIFORM; /* `CUNEIFORM */
  else if (tag == 1027009176) return PANGO_SCRIPT_PHOENICIAN; /* `PHOENICIAN */
  else if (tag == 976815464) return PANGO_SCRIPT_PHAGS_PA; /* `PHAGS_PA */
  else if (tag == 1049114334) return PANGO_SCRIPT_NKO; /* `NKO */
  else if (tag == 575245500) return PANGO_SCRIPT_KAYAH_LI; /* `KAYAH_LI */
  else if (tag == 78559658) return PANGO_SCRIPT_LEPCHA; /* `LEPCHA */
  else if (tag == 726825295) return PANGO_SCRIPT_REJANG; /* `REJANG */
  else if (tag == 973580318) return PANGO_SCRIPT_SUNDANESE; /* `SUNDANESE */
  else if (tag == 689573803) return PANGO_SCRIPT_SAURASHTRA; /* `SAURASHTRA */
  else if (tag == 597624174) return PANGO_SCRIPT_CHAM; /* `CHAM */
  else if (tag == 700137543) return PANGO_SCRIPT_OL_CHIKI; /* `OL_CHIKI */
  else if (tag == 435942453) return PANGO_SCRIPT_VAI; /* `VAI */
  else if (tag == 733646840) return PANGO_SCRIPT_CARIAN; /* `CARIAN */
  else if (tag == 392438) return PANGO_SCRIPT_LYCIAN; /* `LYCIAN */
  else if (tag == 67943444) return PANGO_SCRIPT_LYDIAN; /* `LYDIAN */
  else if (tag == 706383515) return PANGO_SCRIPT_BATAK; /* `BATAK */
  else if (tag == 284941827) return PANGO_SCRIPT_BRAHMI; /* `BRAHMI */
  else if (tag == 74879664) return PANGO_SCRIPT_MANDAIC; /* `MANDAIC */
  else if (tag == 552851107) return PANGO_SCRIPT_CHAKMA; /* `CHAKMA */
  else if (tag == 593766392) return PANGO_SCRIPT_MEROITIC_CURSIVE; /* `MEROITIC_CURSIVE */
  else if (tag == 718800425) return PANGO_SCRIPT_MEROITIC_HIEROGLYPHS; /* `MEROITIC_HIEROGLYPHS */
  else if (tag == 529104693) return PANGO_SCRIPT_MIAO; /* `MIAO */
  else if (tag == 150462963) return PANGO_SCRIPT_SHARADA; /* `SHARADA */
  else if (tag == 333760044) return PANGO_SCRIPT_SORA_SOMPENG; /* `SORA_SOMPENG */
  else if (tag == 424908059) return PANGO_SCRIPT_TAKRI; /* `TAKRI */
  else if (tag == 734092100) return PANGO_SCRIPT_BASSA_VAH; /* `BASSA_VAH */
  else if (tag == 717896744) return PANGO_SCRIPT_CAUCASIAN_ALBANIAN; /* `CAUCASIAN_ALBANIAN */
  else if (tag == 606875281) return PANGO_SCRIPT_DUPLOYAN; /* `DUPLOYAN */
  else if (tag == 321010976) return PANGO_SCRIPT_ELBASAN; /* `ELBASAN */
  else if (tag == 657162361) return PANGO_SCRIPT_GRANTHA; /* `GRANTHA */
  else if (tag == 483175593) return PANGO_SCRIPT_KHOJKI; /* `KHOJKI */
  else if (tag == 426925336) return PANGO_SCRIPT_KHUDAWADI; /* `KHUDAWADI */
  else if (tag == 36541901) return PANGO_SCRIPT_LINEAR_A; /* `LINEAR_A */
  else if (tag == 992083256) return PANGO_SCRIPT_MAHAJANI; /* `MAHAJANI */
  else if (tag == 818901423) return PANGO_SCRIPT_MANICHAEAN; /* `MANICHAEAN */
  else if (tag == 332226262) return PANGO_SCRIPT_MENDE_KIKAKUI; /* `MENDE_KIKAKUI */
  else if (tag == 957906894) return PANGO_SCRIPT_MODI; /* `MODI */
  else if (tag == 581710864) return PANGO_SCRIPT_MRO; /* `MRO */
  else if (tag == 485640442) return PANGO_SCRIPT_NABATAEAN; /* `NABATAEAN */
  else if (tag == 713049459) return PANGO_SCRIPT_OLD_NORTH_ARABIAN; /* `OLD_NORTH_ARABIAN */
  else if (tag == 532505532) return PANGO_SCRIPT_OLD_PERMIC; /* `OLD_PERMIC */
  else if (tag == 1001470075) return PANGO_SCRIPT_PAHAWH_HMONG; /* `PAHAWH_HMONG */
  else if (tag == 938293716) return PANGO_SCRIPT_PALMYRENE; /* `PALMYRENE */
  else if (tag == 123422782) return PANGO_SCRIPT_PAU_CIN_HAU; /* `PAU_CIN_HAU */
  else if (tag == 864824028) return PANGO_SCRIPT_PSALTER_PAHLAVI; /* `PSALTER_PAHLAVI */
  else if (tag == 674368960) return PANGO_SCRIPT_SIDDHAM; /* `SIDDHAM */
  else if (tag == 205819143) return PANGO_SCRIPT_TIRHUTA; /* `TIRHUTA */
  else if (tag == 189262066) return PANGO_SCRIPT_WARANG_CITI; /* `WARANG_CITI */
  else if (tag == 136499912) return PANGO_SCRIPT_AHOM; /* `AHOM */
  else if (tag == 623652297) return PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS; /* `ANATOLIAN_HIEROGLYPHS */
  else if (tag == 391315220) return PANGO_SCRIPT_HATRAN; /* `HATRAN */
  else if (tag == 478814089) return PANGO_SCRIPT_MULTANI; /* `MULTANI */
  else if (tag == 825238724) return PANGO_SCRIPT_OLD_HUNGARIAN; /* `OLD_HUNGARIAN */
  else if (tag == 628627055) return PANGO_SCRIPT_SIGNWRITING; /* `SIGNWRITING */
  else return PANGO_SCRIPT_INVALID_CODE; /* fallback to first value */
}

/* Convert PangoStretch to OCaml value */
value Val_PangoStretch(PangoStretch val) {
  switch (val) {
    case PANGO_STRETCH_ULTRA_CONDENSED: return Val_int(846844939); /* `ULTRA_CONDENSED */
    case PANGO_STRETCH_EXTRA_CONDENSED: return Val_int(216867893); /* `EXTRA_CONDENSED */
    case PANGO_STRETCH_CONDENSED: return Val_int(743818866); /* `CONDENSED */
    case PANGO_STRETCH_SEMI_CONDENSED: return Val_int(394041153); /* `SEMI_CONDENSED */
    case PANGO_STRETCH_NORMAL: return Val_int(888717969); /* `NORMAL */
    case PANGO_STRETCH_SEMI_EXPANDED: return Val_int(683954301); /* `SEMI_EXPANDED */
    case PANGO_STRETCH_EXPANDED: return Val_int(865473550); /* `EXPANDED */
    case PANGO_STRETCH_EXTRA_EXPANDED: return Val_int(283640084); /* `EXTRA_EXPANDED */
    case PANGO_STRETCH_ULTRA_EXPANDED: return Val_int(12639491); /* `ULTRA_EXPANDED */
    default: return Val_int(846844939); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoStretch */
PangoStretch PangoStretch_val(value val) {
  int tag = Int_val(val);
  if (tag == 846844939) return PANGO_STRETCH_ULTRA_CONDENSED; /* `ULTRA_CONDENSED */
  else if (tag == 216867893) return PANGO_STRETCH_EXTRA_CONDENSED; /* `EXTRA_CONDENSED */
  else if (tag == 743818866) return PANGO_STRETCH_CONDENSED; /* `CONDENSED */
  else if (tag == 394041153) return PANGO_STRETCH_SEMI_CONDENSED; /* `SEMI_CONDENSED */
  else if (tag == 888717969) return PANGO_STRETCH_NORMAL; /* `NORMAL */
  else if (tag == 683954301) return PANGO_STRETCH_SEMI_EXPANDED; /* `SEMI_EXPANDED */
  else if (tag == 865473550) return PANGO_STRETCH_EXPANDED; /* `EXPANDED */
  else if (tag == 283640084) return PANGO_STRETCH_EXTRA_EXPANDED; /* `EXTRA_EXPANDED */
  else if (tag == 12639491) return PANGO_STRETCH_ULTRA_EXPANDED; /* `ULTRA_EXPANDED */
  else return PANGO_STRETCH_ULTRA_CONDENSED; /* fallback to first value */
}

/* Convert PangoStyle to OCaml value */
value Val_PangoStyle(PangoStyle val) {
  switch (val) {
    case PANGO_STYLE_NORMAL: return Val_int(888717969); /* `NORMAL */
    case PANGO_STYLE_OBLIQUE: return Val_int(596738269); /* `OBLIQUE */
    case PANGO_STYLE_ITALIC: return Val_int(1040487490); /* `ITALIC */
    default: return Val_int(888717969); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoStyle */
PangoStyle PangoStyle_val(value val) {
  int tag = Int_val(val);
  if (tag == 888717969) return PANGO_STYLE_NORMAL; /* `NORMAL */
  else if (tag == 596738269) return PANGO_STYLE_OBLIQUE; /* `OBLIQUE */
  else if (tag == 1040487490) return PANGO_STYLE_ITALIC; /* `ITALIC */
  else return PANGO_STYLE_NORMAL; /* fallback to first value */
}

/* Convert PangoTabAlign to OCaml value */
value Val_PangoTabAlign(PangoTabAlign val) {
  switch (val) {
    case PANGO_TAB_LEFT: return Val_int(28713888); /* `LEFT */
    case PANGO_TAB_RIGHT: return Val_int(961111566); /* `RIGHT */
    case PANGO_TAB_CENTER: return Val_int(428864253); /* `CENTER */
    case PANGO_TAB_DECIMAL: return Val_int(739193638); /* `DECIMAL */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoTabAlign */
PangoTabAlign PangoTabAlign_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return PANGO_TAB_LEFT; /* `LEFT */
  else if (tag == 961111566) return PANGO_TAB_RIGHT; /* `RIGHT */
  else if (tag == 428864253) return PANGO_TAB_CENTER; /* `CENTER */
  else if (tag == 739193638) return PANGO_TAB_DECIMAL; /* `DECIMAL */
  else return PANGO_TAB_LEFT; /* fallback to first value */
}

/* Convert PangoTextTransform to OCaml value */
value Val_PangoTextTransform(PangoTextTransform val) {
  switch (val) {
    case PANGO_TEXT_TRANSFORM_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_TEXT_TRANSFORM_LOWERCASE: return Val_int(700654046); /* `LOWERCASE */
    case PANGO_TEXT_TRANSFORM_UPPERCASE: return Val_int(279084478); /* `UPPERCASE */
    case PANGO_TEXT_TRANSFORM_CAPITALIZE: return Val_int(48317753); /* `CAPITALIZE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoTextTransform */
PangoTextTransform PangoTextTransform_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_TEXT_TRANSFORM_NONE; /* `NONE */
  else if (tag == 700654046) return PANGO_TEXT_TRANSFORM_LOWERCASE; /* `LOWERCASE */
  else if (tag == 279084478) return PANGO_TEXT_TRANSFORM_UPPERCASE; /* `UPPERCASE */
  else if (tag == 48317753) return PANGO_TEXT_TRANSFORM_CAPITALIZE; /* `CAPITALIZE */
  else return PANGO_TEXT_TRANSFORM_NONE; /* fallback to first value */
}

/* Convert PangoUnderline to OCaml value */
value Val_PangoUnderline(PangoUnderline val) {
  switch (val) {
    case PANGO_UNDERLINE_NONE: return Val_int(37469934); /* `NONE */
    case PANGO_UNDERLINE_SINGLE: return Val_int(155377302); /* `SINGLE */
    case PANGO_UNDERLINE_DOUBLE: return Val_int(686870806); /* `DOUBLE */
    case PANGO_UNDERLINE_LOW: return Val_int(1031179617); /* `LOW */
    case PANGO_UNDERLINE_ERROR: return Val_int(1064539868); /* `ERROR */
    case PANGO_UNDERLINE_SINGLE_LINE: return Val_int(150403675); /* `SINGLE_LINE */
    case PANGO_UNDERLINE_DOUBLE_LINE: return Val_int(787276425); /* `DOUBLE_LINE */
    case PANGO_UNDERLINE_ERROR_LINE: return Val_int(224919981); /* `ERROR_LINE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoUnderline */
PangoUnderline PangoUnderline_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return PANGO_UNDERLINE_NONE; /* `NONE */
  else if (tag == 155377302) return PANGO_UNDERLINE_SINGLE; /* `SINGLE */
  else if (tag == 686870806) return PANGO_UNDERLINE_DOUBLE; /* `DOUBLE */
  else if (tag == 1031179617) return PANGO_UNDERLINE_LOW; /* `LOW */
  else if (tag == 1064539868) return PANGO_UNDERLINE_ERROR; /* `ERROR */
  else if (tag == 150403675) return PANGO_UNDERLINE_SINGLE_LINE; /* `SINGLE_LINE */
  else if (tag == 787276425) return PANGO_UNDERLINE_DOUBLE_LINE; /* `DOUBLE_LINE */
  else if (tag == 224919981) return PANGO_UNDERLINE_ERROR_LINE; /* `ERROR_LINE */
  else return PANGO_UNDERLINE_NONE; /* fallback to first value */
}

/* Convert PangoVariant to OCaml value */
value Val_PangoVariant(PangoVariant val) {
  switch (val) {
    case PANGO_VARIANT_NORMAL: return Val_int(888717969); /* `NORMAL */
    case PANGO_VARIANT_SMALL_CAPS: return Val_int(777054865); /* `SMALL_CAPS */
    case PANGO_VARIANT_ALL_SMALL_CAPS: return Val_int(533922756); /* `ALL_SMALL_CAPS */
    case PANGO_VARIANT_PETITE_CAPS: return Val_int(803280932); /* `PETITE_CAPS */
    case PANGO_VARIANT_ALL_PETITE_CAPS: return Val_int(1048236749); /* `ALL_PETITE_CAPS */
    case PANGO_VARIANT_UNICASE: return Val_int(233508833); /* `UNICASE */
    case PANGO_VARIANT_TITLE_CAPS: return Val_int(755417452); /* `TITLE_CAPS */
    default: return Val_int(888717969); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoVariant */
PangoVariant PangoVariant_val(value val) {
  int tag = Int_val(val);
  if (tag == 888717969) return PANGO_VARIANT_NORMAL; /* `NORMAL */
  else if (tag == 777054865) return PANGO_VARIANT_SMALL_CAPS; /* `SMALL_CAPS */
  else if (tag == 533922756) return PANGO_VARIANT_ALL_SMALL_CAPS; /* `ALL_SMALL_CAPS */
  else if (tag == 803280932) return PANGO_VARIANT_PETITE_CAPS; /* `PETITE_CAPS */
  else if (tag == 1048236749) return PANGO_VARIANT_ALL_PETITE_CAPS; /* `ALL_PETITE_CAPS */
  else if (tag == 233508833) return PANGO_VARIANT_UNICASE; /* `UNICASE */
  else if (tag == 755417452) return PANGO_VARIANT_TITLE_CAPS; /* `TITLE_CAPS */
  else return PANGO_VARIANT_NORMAL; /* fallback to first value */
}

/* Convert PangoWeight to OCaml value */
value Val_PangoWeight(PangoWeight val) {
  switch (val) {
    case PANGO_WEIGHT_THIN: return Val_int(5612455); /* `THIN */
    case PANGO_WEIGHT_ULTRALIGHT: return Val_int(1067787242); /* `ULTRALIGHT */
    case PANGO_WEIGHT_LIGHT: return Val_int(116037439); /* `LIGHT */
    case PANGO_WEIGHT_SEMILIGHT: return Val_int(1037692095); /* `SEMILIGHT */
    case PANGO_WEIGHT_BOOK: return Val_int(378207078); /* `BOOK */
    case PANGO_WEIGHT_NORMAL: return Val_int(888717969); /* `NORMAL */
    case PANGO_WEIGHT_MEDIUM: return Val_int(57925782); /* `MEDIUM */
    case PANGO_WEIGHT_SEMIBOLD: return Val_int(813704200); /* `SEMIBOLD */
    case PANGO_WEIGHT_BOLD: return Val_int(488049550); /* `BOLD */
    case PANGO_WEIGHT_ULTRABOLD: return Val_int(330070144); /* `ULTRABOLD */
    case PANGO_WEIGHT_HEAVY: return Val_int(452308691); /* `HEAVY */
    case PANGO_WEIGHT_ULTRAHEAVY: return Val_int(481333793); /* `ULTRAHEAVY */
    default: return Val_int(5612455); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoWeight */
PangoWeight PangoWeight_val(value val) {
  int tag = Int_val(val);
  if (tag == 5612455) return PANGO_WEIGHT_THIN; /* `THIN */
  else if (tag == 1067787242) return PANGO_WEIGHT_ULTRALIGHT; /* `ULTRALIGHT */
  else if (tag == 116037439) return PANGO_WEIGHT_LIGHT; /* `LIGHT */
  else if (tag == 1037692095) return PANGO_WEIGHT_SEMILIGHT; /* `SEMILIGHT */
  else if (tag == 378207078) return PANGO_WEIGHT_BOOK; /* `BOOK */
  else if (tag == 888717969) return PANGO_WEIGHT_NORMAL; /* `NORMAL */
  else if (tag == 57925782) return PANGO_WEIGHT_MEDIUM; /* `MEDIUM */
  else if (tag == 813704200) return PANGO_WEIGHT_SEMIBOLD; /* `SEMIBOLD */
  else if (tag == 488049550) return PANGO_WEIGHT_BOLD; /* `BOLD */
  else if (tag == 330070144) return PANGO_WEIGHT_ULTRABOLD; /* `ULTRABOLD */
  else if (tag == 452308691) return PANGO_WEIGHT_HEAVY; /* `HEAVY */
  else if (tag == 481333793) return PANGO_WEIGHT_ULTRAHEAVY; /* `ULTRAHEAVY */
  else return PANGO_WEIGHT_THIN; /* fallback to first value */
}

/* Convert PangoWrapMode to OCaml value */
value Val_PangoWrapMode(PangoWrapMode val) {
  switch (val) {
    case PANGO_WRAP_WORD: return Val_int(777616121); /* `WORD */
    case PANGO_WRAP_CHAR: return Val_int(673743267); /* `CHAR */
    case PANGO_WRAP_WORD_CHAR: return Val_int(647176300); /* `WORD_CHAR */
    default: return Val_int(777616121); /* fallback to first variant */
  }
}

/* Convert OCaml value to PangoWrapMode */
PangoWrapMode PangoWrapMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 777616121) return PANGO_WRAP_WORD; /* `WORD */
  else if (tag == 673743267) return PANGO_WRAP_CHAR; /* `CHAR */
  else if (tag == 647176300) return PANGO_WRAP_WORD_CHAR; /* `WORD_CHAR */
  else return PANGO_WRAP_WORD; /* fallback to first value */
}

/* Convert PangoFontMask to OCaml flag list */
value Val_PangoFontMask(PangoFontMask flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_FONT_MASK_FAMILY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(690675795)); /* `FAMILY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(994234501)); /* `STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_VARIANT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(149033485)); /* `VARIANT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_WEIGHT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(444952276)); /* `WEIGHT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_STRETCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(776874522)); /* `STRETCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(583873574)); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_GRAVITY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(428947646)); /* `GRAVITY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_VARIATIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(54227459)); /* `VARIATIONS */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to PangoFontMask */
PangoFontMask PangoFontMask_val(value list) {
  PangoFontMask result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 690675795) result |= PANGO_FONT_MASK_FAMILY; /* `FAMILY */
    else if (tag == 994234501) result |= PANGO_FONT_MASK_STYLE; /* `STYLE */
    else if (tag == 149033485) result |= PANGO_FONT_MASK_VARIANT; /* `VARIANT */
    else if (tag == 444952276) result |= PANGO_FONT_MASK_WEIGHT; /* `WEIGHT */
    else if (tag == 776874522) result |= PANGO_FONT_MASK_STRETCH; /* `STRETCH */
    else if (tag == 583873574) result |= PANGO_FONT_MASK_SIZE; /* `SIZE */
    else if (tag == 428947646) result |= PANGO_FONT_MASK_GRAVITY; /* `GRAVITY */
    else if (tag == 54227459) result |= PANGO_FONT_MASK_VARIATIONS; /* `VARIATIONS */
    list = Field(list, 1);
  }
  return result;
}

/* Convert PangoLayoutDeserializeFlags to OCaml flag list */
value Val_PangoLayoutDeserializeFlags(PangoLayoutDeserializeFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_LAYOUT_DESERIALIZE_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1054500001)); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_DESERIALIZE_CONTEXT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(597651512)); /* `CONTEXT */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to PangoLayoutDeserializeFlags */
PangoLayoutDeserializeFlags PangoLayoutDeserializeFlags_val(value list) {
  PangoLayoutDeserializeFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 1054500001) result |= PANGO_LAYOUT_DESERIALIZE_DEFAULT; /* `DEFAULT */
    else if (tag == 597651512) result |= PANGO_LAYOUT_DESERIALIZE_CONTEXT; /* `CONTEXT */
    list = Field(list, 1);
  }
  return result;
}

/* Convert PangoLayoutSerializeFlags to OCaml flag list */
value Val_PangoLayoutSerializeFlags(PangoLayoutSerializeFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_LAYOUT_SERIALIZE_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1054500001)); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_SERIALIZE_CONTEXT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(597651512)); /* `CONTEXT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_SERIALIZE_OUTPUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(143153619)); /* `OUTPUT */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to PangoLayoutSerializeFlags */
PangoLayoutSerializeFlags PangoLayoutSerializeFlags_val(value list) {
  PangoLayoutSerializeFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 1054500001) result |= PANGO_LAYOUT_SERIALIZE_DEFAULT; /* `DEFAULT */
    else if (tag == 597651512) result |= PANGO_LAYOUT_SERIALIZE_CONTEXT; /* `CONTEXT */
    else if (tag == 143153619) result |= PANGO_LAYOUT_SERIALIZE_OUTPUT; /* `OUTPUT */
    list = Field(list, 1);
  }
  return result;
}

/* Convert PangoShapeFlags to OCaml flag list */
value Val_PangoShapeFlags(PangoShapeFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_SHAPE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHAPE_ROUND_POSITIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(96500266)); /* `ROUND_POSITIONS */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to PangoShapeFlags */
PangoShapeFlags PangoShapeFlags_val(value list) {
  PangoShapeFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= PANGO_SHAPE_NONE; /* `NONE */
    else if (tag == 96500266) result |= PANGO_SHAPE_ROUND_POSITIONS; /* `ROUND_POSITIONS */
    list = Field(list, 1);
  }
  return result;
}

/* Convert PangoShowFlags to OCaml flag list */
value Val_PangoShowFlags(PangoShowFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_SHOW_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_SPACES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(238941880)); /* `SPACES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_LINE_BREAKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(196220307)); /* `LINE_BREAKS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_IGNORABLES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(102603536)); /* `IGNORABLES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to PangoShowFlags */
PangoShowFlags PangoShowFlags_val(value list) {
  PangoShowFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= PANGO_SHOW_NONE; /* `NONE */
    else if (tag == 238941880) result |= PANGO_SHOW_SPACES; /* `SPACES */
    else if (tag == 196220307) result |= PANGO_SHOW_LINE_BREAKS; /* `LINE_BREAKS */
    else if (tag == 102603536) result |= PANGO_SHOW_IGNORABLES; /* `IGNORABLES */
    list = Field(list, 1);
  }
  return result;
}

