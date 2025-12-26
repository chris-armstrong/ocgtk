/* GENERATED CODE - DO NOT EDIT */
/* Pango enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <pango/pango.h>
/* Convert PangoAlignment to OCaml value */
value Val_PangoAlignment(PangoAlignment val) {
  switch (val) {
    case PANGO_ALIGN_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case PANGO_ALIGN_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case PANGO_ALIGN_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoAlignment value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoAlignment */
PangoAlignment PangoAlignment_val(value val) {
  if (val == caml_hash_variant("LEFT")) return PANGO_ALIGN_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("CENTER")) return PANGO_ALIGN_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("RIGHT")) return PANGO_ALIGN_RIGHT; /* `RIGHT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoAlignment tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoAttrType to OCaml value */
value Val_PangoAttrType(PangoAttrType val) {
  switch (val) {
    case PANGO_ATTR_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case PANGO_ATTR_LANGUAGE: return caml_hash_variant("LANGUAGE"); /* `LANGUAGE */
    case PANGO_ATTR_FAMILY: return caml_hash_variant("FAMILY"); /* `FAMILY */
    case PANGO_ATTR_STYLE: return caml_hash_variant("STYLE"); /* `STYLE */
    case PANGO_ATTR_WEIGHT: return caml_hash_variant("WEIGHT"); /* `WEIGHT */
    case PANGO_ATTR_VARIANT: return caml_hash_variant("VARIANT"); /* `VARIANT */
    case PANGO_ATTR_STRETCH: return caml_hash_variant("STRETCH"); /* `STRETCH */
    case PANGO_ATTR_SIZE: return caml_hash_variant("SIZE"); /* `SIZE */
    case PANGO_ATTR_FONT_DESC: return caml_hash_variant("FONT_DESC"); /* `FONT_DESC */
    case PANGO_ATTR_FOREGROUND: return caml_hash_variant("FOREGROUND"); /* `FOREGROUND */
    case PANGO_ATTR_BACKGROUND: return caml_hash_variant("BACKGROUND"); /* `BACKGROUND */
    case PANGO_ATTR_UNDERLINE: return caml_hash_variant("UNDERLINE"); /* `UNDERLINE */
    case PANGO_ATTR_STRIKETHROUGH: return caml_hash_variant("STRIKETHROUGH"); /* `STRIKETHROUGH */
    case PANGO_ATTR_RISE: return caml_hash_variant("RISE"); /* `RISE */
    case PANGO_ATTR_SHAPE: return caml_hash_variant("SHAPE"); /* `SHAPE */
    case PANGO_ATTR_SCALE: return caml_hash_variant("SCALE"); /* `SCALE */
    case PANGO_ATTR_FALLBACK: return caml_hash_variant("FALLBACK"); /* `FALLBACK */
    case PANGO_ATTR_LETTER_SPACING: return caml_hash_variant("LETTER_SPACING"); /* `LETTER_SPACING */
    case PANGO_ATTR_UNDERLINE_COLOR: return caml_hash_variant("UNDERLINE_COLOR"); /* `UNDERLINE_COLOR */
    case PANGO_ATTR_STRIKETHROUGH_COLOR: return caml_hash_variant("STRIKETHROUGH_COLOR"); /* `STRIKETHROUGH_COLOR */
    case PANGO_ATTR_ABSOLUTE_SIZE: return caml_hash_variant("ABSOLUTE_SIZE"); /* `ABSOLUTE_SIZE */
    case PANGO_ATTR_GRAVITY: return caml_hash_variant("GRAVITY"); /* `GRAVITY */
    case PANGO_ATTR_GRAVITY_HINT: return caml_hash_variant("GRAVITY_HINT"); /* `GRAVITY_HINT */
    case PANGO_ATTR_FONT_FEATURES: return caml_hash_variant("FONT_FEATURES"); /* `FONT_FEATURES */
    case PANGO_ATTR_FOREGROUND_ALPHA: return caml_hash_variant("FOREGROUND_ALPHA"); /* `FOREGROUND_ALPHA */
    case PANGO_ATTR_BACKGROUND_ALPHA: return caml_hash_variant("BACKGROUND_ALPHA"); /* `BACKGROUND_ALPHA */
    case PANGO_ATTR_ALLOW_BREAKS: return caml_hash_variant("ALLOW_BREAKS"); /* `ALLOW_BREAKS */
    case PANGO_ATTR_SHOW: return caml_hash_variant("SHOW"); /* `SHOW */
    case PANGO_ATTR_INSERT_HYPHENS: return caml_hash_variant("INSERT_HYPHENS"); /* `INSERT_HYPHENS */
    case PANGO_ATTR_OVERLINE: return caml_hash_variant("OVERLINE"); /* `OVERLINE */
    case PANGO_ATTR_OVERLINE_COLOR: return caml_hash_variant("OVERLINE_COLOR"); /* `OVERLINE_COLOR */
    case PANGO_ATTR_LINE_HEIGHT: return caml_hash_variant("LINE_HEIGHT"); /* `LINE_HEIGHT */
    case PANGO_ATTR_ABSOLUTE_LINE_HEIGHT: return caml_hash_variant("ABSOLUTE_LINE_HEIGHT"); /* `ABSOLUTE_LINE_HEIGHT */
    case PANGO_ATTR_TEXT_TRANSFORM: return caml_hash_variant("TEXT_TRANSFORM"); /* `TEXT_TRANSFORM */
    case PANGO_ATTR_WORD: return caml_hash_variant("WORD"); /* `WORD */
    case PANGO_ATTR_SENTENCE: return caml_hash_variant("SENTENCE"); /* `SENTENCE */
    case PANGO_ATTR_BASELINE_SHIFT: return caml_hash_variant("BASELINE_SHIFT"); /* `BASELINE_SHIFT */
    case PANGO_ATTR_FONT_SCALE: return caml_hash_variant("FONT_SCALE"); /* `FONT_SCALE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoAttrType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoAttrType */
PangoAttrType PangoAttrType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return PANGO_ATTR_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("LANGUAGE")) return PANGO_ATTR_LANGUAGE; /* `LANGUAGE */
  else if (val == caml_hash_variant("FAMILY")) return PANGO_ATTR_FAMILY; /* `FAMILY */
  else if (val == caml_hash_variant("STYLE")) return PANGO_ATTR_STYLE; /* `STYLE */
  else if (val == caml_hash_variant("WEIGHT")) return PANGO_ATTR_WEIGHT; /* `WEIGHT */
  else if (val == caml_hash_variant("VARIANT")) return PANGO_ATTR_VARIANT; /* `VARIANT */
  else if (val == caml_hash_variant("STRETCH")) return PANGO_ATTR_STRETCH; /* `STRETCH */
  else if (val == caml_hash_variant("SIZE")) return PANGO_ATTR_SIZE; /* `SIZE */
  else if (val == caml_hash_variant("FONT_DESC")) return PANGO_ATTR_FONT_DESC; /* `FONT_DESC */
  else if (val == caml_hash_variant("FOREGROUND")) return PANGO_ATTR_FOREGROUND; /* `FOREGROUND */
  else if (val == caml_hash_variant("BACKGROUND")) return PANGO_ATTR_BACKGROUND; /* `BACKGROUND */
  else if (val == caml_hash_variant("UNDERLINE")) return PANGO_ATTR_UNDERLINE; /* `UNDERLINE */
  else if (val == caml_hash_variant("STRIKETHROUGH")) return PANGO_ATTR_STRIKETHROUGH; /* `STRIKETHROUGH */
  else if (val == caml_hash_variant("RISE")) return PANGO_ATTR_RISE; /* `RISE */
  else if (val == caml_hash_variant("SHAPE")) return PANGO_ATTR_SHAPE; /* `SHAPE */
  else if (val == caml_hash_variant("SCALE")) return PANGO_ATTR_SCALE; /* `SCALE */
  else if (val == caml_hash_variant("FALLBACK")) return PANGO_ATTR_FALLBACK; /* `FALLBACK */
  else if (val == caml_hash_variant("LETTER_SPACING")) return PANGO_ATTR_LETTER_SPACING; /* `LETTER_SPACING */
  else if (val == caml_hash_variant("UNDERLINE_COLOR")) return PANGO_ATTR_UNDERLINE_COLOR; /* `UNDERLINE_COLOR */
  else if (val == caml_hash_variant("STRIKETHROUGH_COLOR")) return PANGO_ATTR_STRIKETHROUGH_COLOR; /* `STRIKETHROUGH_COLOR */
  else if (val == caml_hash_variant("ABSOLUTE_SIZE")) return PANGO_ATTR_ABSOLUTE_SIZE; /* `ABSOLUTE_SIZE */
  else if (val == caml_hash_variant("GRAVITY")) return PANGO_ATTR_GRAVITY; /* `GRAVITY */
  else if (val == caml_hash_variant("GRAVITY_HINT")) return PANGO_ATTR_GRAVITY_HINT; /* `GRAVITY_HINT */
  else if (val == caml_hash_variant("FONT_FEATURES")) return PANGO_ATTR_FONT_FEATURES; /* `FONT_FEATURES */
  else if (val == caml_hash_variant("FOREGROUND_ALPHA")) return PANGO_ATTR_FOREGROUND_ALPHA; /* `FOREGROUND_ALPHA */
  else if (val == caml_hash_variant("BACKGROUND_ALPHA")) return PANGO_ATTR_BACKGROUND_ALPHA; /* `BACKGROUND_ALPHA */
  else if (val == caml_hash_variant("ALLOW_BREAKS")) return PANGO_ATTR_ALLOW_BREAKS; /* `ALLOW_BREAKS */
  else if (val == caml_hash_variant("SHOW")) return PANGO_ATTR_SHOW; /* `SHOW */
  else if (val == caml_hash_variant("INSERT_HYPHENS")) return PANGO_ATTR_INSERT_HYPHENS; /* `INSERT_HYPHENS */
  else if (val == caml_hash_variant("OVERLINE")) return PANGO_ATTR_OVERLINE; /* `OVERLINE */
  else if (val == caml_hash_variant("OVERLINE_COLOR")) return PANGO_ATTR_OVERLINE_COLOR; /* `OVERLINE_COLOR */
  else if (val == caml_hash_variant("LINE_HEIGHT")) return PANGO_ATTR_LINE_HEIGHT; /* `LINE_HEIGHT */
  else if (val == caml_hash_variant("ABSOLUTE_LINE_HEIGHT")) return PANGO_ATTR_ABSOLUTE_LINE_HEIGHT; /* `ABSOLUTE_LINE_HEIGHT */
  else if (val == caml_hash_variant("TEXT_TRANSFORM")) return PANGO_ATTR_TEXT_TRANSFORM; /* `TEXT_TRANSFORM */
  else if (val == caml_hash_variant("WORD")) return PANGO_ATTR_WORD; /* `WORD */
  else if (val == caml_hash_variant("SENTENCE")) return PANGO_ATTR_SENTENCE; /* `SENTENCE */
  else if (val == caml_hash_variant("BASELINE_SHIFT")) return PANGO_ATTR_BASELINE_SHIFT; /* `BASELINE_SHIFT */
  else if (val == caml_hash_variant("FONT_SCALE")) return PANGO_ATTR_FONT_SCALE; /* `FONT_SCALE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoAttrType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoBaselineShift to OCaml value */
value Val_PangoBaselineShift(PangoBaselineShift val) {
  switch (val) {
    case PANGO_BASELINE_SHIFT_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_BASELINE_SHIFT_SUPERSCRIPT: return caml_hash_variant("SUPERSCRIPT"); /* `SUPERSCRIPT */
    case PANGO_BASELINE_SHIFT_SUBSCRIPT: return caml_hash_variant("SUBSCRIPT"); /* `SUBSCRIPT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoBaselineShift value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoBaselineShift */
PangoBaselineShift PangoBaselineShift_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_BASELINE_SHIFT_NONE; /* `NONE */
  else if (val == caml_hash_variant("SUPERSCRIPT")) return PANGO_BASELINE_SHIFT_SUPERSCRIPT; /* `SUPERSCRIPT */
  else if (val == caml_hash_variant("SUBSCRIPT")) return PANGO_BASELINE_SHIFT_SUBSCRIPT; /* `SUBSCRIPT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoBaselineShift tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoBidiType to OCaml value */
value Val_PangoBidiType(PangoBidiType val) {
  switch (val) {
    case PANGO_BIDI_TYPE_L: return caml_hash_variant("L"); /* `L */
    case PANGO_BIDI_TYPE_LRE: return caml_hash_variant("LRE"); /* `LRE */
    case PANGO_BIDI_TYPE_LRO: return caml_hash_variant("LRO"); /* `LRO */
    case PANGO_BIDI_TYPE_R: return caml_hash_variant("R"); /* `R */
    case PANGO_BIDI_TYPE_AL: return caml_hash_variant("AL"); /* `AL */
    case PANGO_BIDI_TYPE_RLE: return caml_hash_variant("RLE"); /* `RLE */
    case PANGO_BIDI_TYPE_RLO: return caml_hash_variant("RLO"); /* `RLO */
    case PANGO_BIDI_TYPE_PDF: return caml_hash_variant("PDF"); /* `PDF */
    case PANGO_BIDI_TYPE_EN: return caml_hash_variant("EN"); /* `EN */
    case PANGO_BIDI_TYPE_ES: return caml_hash_variant("ES"); /* `ES */
    case PANGO_BIDI_TYPE_ET: return caml_hash_variant("ET"); /* `ET */
    case PANGO_BIDI_TYPE_AN: return caml_hash_variant("AN"); /* `AN */
    case PANGO_BIDI_TYPE_CS: return caml_hash_variant("CS"); /* `CS */
    case PANGO_BIDI_TYPE_NSM: return caml_hash_variant("NSM"); /* `NSM */
    case PANGO_BIDI_TYPE_BN: return caml_hash_variant("BN"); /* `BN */
    case PANGO_BIDI_TYPE_B: return caml_hash_variant("B"); /* `B */
    case PANGO_BIDI_TYPE_S: return caml_hash_variant("S"); /* `S */
    case PANGO_BIDI_TYPE_WS: return caml_hash_variant("WS"); /* `WS */
    case PANGO_BIDI_TYPE_ON: return caml_hash_variant("ON"); /* `ON */
    case PANGO_BIDI_TYPE_LRI: return caml_hash_variant("LRI"); /* `LRI */
    case PANGO_BIDI_TYPE_RLI: return caml_hash_variant("RLI"); /* `RLI */
    case PANGO_BIDI_TYPE_FSI: return caml_hash_variant("FSI"); /* `FSI */
    case PANGO_BIDI_TYPE_PDI: return caml_hash_variant("PDI"); /* `PDI */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoBidiType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoBidiType */
PangoBidiType PangoBidiType_val(value val) {
  if (val == caml_hash_variant("L")) return PANGO_BIDI_TYPE_L; /* `L */
  else if (val == caml_hash_variant("LRE")) return PANGO_BIDI_TYPE_LRE; /* `LRE */
  else if (val == caml_hash_variant("LRO")) return PANGO_BIDI_TYPE_LRO; /* `LRO */
  else if (val == caml_hash_variant("R")) return PANGO_BIDI_TYPE_R; /* `R */
  else if (val == caml_hash_variant("AL")) return PANGO_BIDI_TYPE_AL; /* `AL */
  else if (val == caml_hash_variant("RLE")) return PANGO_BIDI_TYPE_RLE; /* `RLE */
  else if (val == caml_hash_variant("RLO")) return PANGO_BIDI_TYPE_RLO; /* `RLO */
  else if (val == caml_hash_variant("PDF")) return PANGO_BIDI_TYPE_PDF; /* `PDF */
  else if (val == caml_hash_variant("EN")) return PANGO_BIDI_TYPE_EN; /* `EN */
  else if (val == caml_hash_variant("ES")) return PANGO_BIDI_TYPE_ES; /* `ES */
  else if (val == caml_hash_variant("ET")) return PANGO_BIDI_TYPE_ET; /* `ET */
  else if (val == caml_hash_variant("AN")) return PANGO_BIDI_TYPE_AN; /* `AN */
  else if (val == caml_hash_variant("CS")) return PANGO_BIDI_TYPE_CS; /* `CS */
  else if (val == caml_hash_variant("NSM")) return PANGO_BIDI_TYPE_NSM; /* `NSM */
  else if (val == caml_hash_variant("BN")) return PANGO_BIDI_TYPE_BN; /* `BN */
  else if (val == caml_hash_variant("B")) return PANGO_BIDI_TYPE_B; /* `B */
  else if (val == caml_hash_variant("S")) return PANGO_BIDI_TYPE_S; /* `S */
  else if (val == caml_hash_variant("WS")) return PANGO_BIDI_TYPE_WS; /* `WS */
  else if (val == caml_hash_variant("ON")) return PANGO_BIDI_TYPE_ON; /* `ON */
  else if (val == caml_hash_variant("LRI")) return PANGO_BIDI_TYPE_LRI; /* `LRI */
  else if (val == caml_hash_variant("RLI")) return PANGO_BIDI_TYPE_RLI; /* `RLI */
  else if (val == caml_hash_variant("FSI")) return PANGO_BIDI_TYPE_FSI; /* `FSI */
  else if (val == caml_hash_variant("PDI")) return PANGO_BIDI_TYPE_PDI; /* `PDI */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoBidiType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoCoverageLevel to OCaml value */
value Val_PangoCoverageLevel(PangoCoverageLevel val) {
  switch (val) {
    case PANGO_COVERAGE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_COVERAGE_FALLBACK: return caml_hash_variant("FALLBACK"); /* `FALLBACK */
    case PANGO_COVERAGE_APPROXIMATE: return caml_hash_variant("APPROXIMATE"); /* `APPROXIMATE */
    case PANGO_COVERAGE_EXACT: return caml_hash_variant("EXACT"); /* `EXACT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoCoverageLevel value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoCoverageLevel */
PangoCoverageLevel PangoCoverageLevel_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_COVERAGE_NONE; /* `NONE */
  else if (val == caml_hash_variant("FALLBACK")) return PANGO_COVERAGE_FALLBACK; /* `FALLBACK */
  else if (val == caml_hash_variant("APPROXIMATE")) return PANGO_COVERAGE_APPROXIMATE; /* `APPROXIMATE */
  else if (val == caml_hash_variant("EXACT")) return PANGO_COVERAGE_EXACT; /* `EXACT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoCoverageLevel tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoDirection to OCaml value */
value Val_PangoDirection(PangoDirection val) {
  switch (val) {
    case PANGO_DIRECTION_LTR: return caml_hash_variant("LTR"); /* `LTR */
    case PANGO_DIRECTION_RTL: return caml_hash_variant("RTL"); /* `RTL */
    case PANGO_DIRECTION_TTB_LTR: return caml_hash_variant("TTB_LTR"); /* `TTB_LTR */
    case PANGO_DIRECTION_TTB_RTL: return caml_hash_variant("TTB_RTL"); /* `TTB_RTL */
    case PANGO_DIRECTION_WEAK_LTR: return caml_hash_variant("WEAK_LTR"); /* `WEAK_LTR */
    case PANGO_DIRECTION_WEAK_RTL: return caml_hash_variant("WEAK_RTL"); /* `WEAK_RTL */
    case PANGO_DIRECTION_NEUTRAL: return caml_hash_variant("NEUTRAL"); /* `NEUTRAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoDirection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoDirection */
PangoDirection PangoDirection_val(value val) {
  if (val == caml_hash_variant("LTR")) return PANGO_DIRECTION_LTR; /* `LTR */
  else if (val == caml_hash_variant("RTL")) return PANGO_DIRECTION_RTL; /* `RTL */
  else if (val == caml_hash_variant("TTB_LTR")) return PANGO_DIRECTION_TTB_LTR; /* `TTB_LTR */
  else if (val == caml_hash_variant("TTB_RTL")) return PANGO_DIRECTION_TTB_RTL; /* `TTB_RTL */
  else if (val == caml_hash_variant("WEAK_LTR")) return PANGO_DIRECTION_WEAK_LTR; /* `WEAK_LTR */
  else if (val == caml_hash_variant("WEAK_RTL")) return PANGO_DIRECTION_WEAK_RTL; /* `WEAK_RTL */
  else if (val == caml_hash_variant("NEUTRAL")) return PANGO_DIRECTION_NEUTRAL; /* `NEUTRAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoDirection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoEllipsizeMode to OCaml value */
value Val_PangoEllipsizeMode(PangoEllipsizeMode val) {
  switch (val) {
    case PANGO_ELLIPSIZE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_ELLIPSIZE_START: return caml_hash_variant("START"); /* `START */
    case PANGO_ELLIPSIZE_MIDDLE: return caml_hash_variant("MIDDLE"); /* `MIDDLE */
    case PANGO_ELLIPSIZE_END: return caml_hash_variant("END"); /* `END */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoEllipsizeMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoEllipsizeMode */
PangoEllipsizeMode PangoEllipsizeMode_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_ELLIPSIZE_NONE; /* `NONE */
  else if (val == caml_hash_variant("START")) return PANGO_ELLIPSIZE_START; /* `START */
  else if (val == caml_hash_variant("MIDDLE")) return PANGO_ELLIPSIZE_MIDDLE; /* `MIDDLE */
  else if (val == caml_hash_variant("END")) return PANGO_ELLIPSIZE_END; /* `END */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoEllipsizeMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoFontScale to OCaml value */
value Val_PangoFontScale(PangoFontScale val) {
  switch (val) {
    case PANGO_FONT_SCALE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_FONT_SCALE_SUPERSCRIPT: return caml_hash_variant("SUPERSCRIPT"); /* `SUPERSCRIPT */
    case PANGO_FONT_SCALE_SUBSCRIPT: return caml_hash_variant("SUBSCRIPT"); /* `SUBSCRIPT */
    case PANGO_FONT_SCALE_SMALL_CAPS: return caml_hash_variant("SMALL_CAPS"); /* `SMALL_CAPS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoFontScale value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoFontScale */
PangoFontScale PangoFontScale_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_FONT_SCALE_NONE; /* `NONE */
  else if (val == caml_hash_variant("SUPERSCRIPT")) return PANGO_FONT_SCALE_SUPERSCRIPT; /* `SUPERSCRIPT */
  else if (val == caml_hash_variant("SUBSCRIPT")) return PANGO_FONT_SCALE_SUBSCRIPT; /* `SUBSCRIPT */
  else if (val == caml_hash_variant("SMALL_CAPS")) return PANGO_FONT_SCALE_SMALL_CAPS; /* `SMALL_CAPS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoFontScale tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoGravity to OCaml value */
value Val_PangoGravity(PangoGravity val) {
  switch (val) {
    case PANGO_GRAVITY_SOUTH: return caml_hash_variant("SOUTH"); /* `SOUTH */
    case PANGO_GRAVITY_EAST: return caml_hash_variant("EAST"); /* `EAST */
    case PANGO_GRAVITY_NORTH: return caml_hash_variant("NORTH"); /* `NORTH */
    case PANGO_GRAVITY_WEST: return caml_hash_variant("WEST"); /* `WEST */
    case PANGO_GRAVITY_AUTO: return caml_hash_variant("AUTO"); /* `AUTO */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoGravity value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoGravity */
PangoGravity PangoGravity_val(value val) {
  if (val == caml_hash_variant("SOUTH")) return PANGO_GRAVITY_SOUTH; /* `SOUTH */
  else if (val == caml_hash_variant("EAST")) return PANGO_GRAVITY_EAST; /* `EAST */
  else if (val == caml_hash_variant("NORTH")) return PANGO_GRAVITY_NORTH; /* `NORTH */
  else if (val == caml_hash_variant("WEST")) return PANGO_GRAVITY_WEST; /* `WEST */
  else if (val == caml_hash_variant("AUTO")) return PANGO_GRAVITY_AUTO; /* `AUTO */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoGravity tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoGravityHint to OCaml value */
value Val_PangoGravityHint(PangoGravityHint val) {
  switch (val) {
    case PANGO_GRAVITY_HINT_NATURAL: return caml_hash_variant("NATURAL"); /* `NATURAL */
    case PANGO_GRAVITY_HINT_STRONG: return caml_hash_variant("STRONG"); /* `STRONG */
    case PANGO_GRAVITY_HINT_LINE: return caml_hash_variant("LINE"); /* `LINE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoGravityHint value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoGravityHint */
PangoGravityHint PangoGravityHint_val(value val) {
  if (val == caml_hash_variant("NATURAL")) return PANGO_GRAVITY_HINT_NATURAL; /* `NATURAL */
  else if (val == caml_hash_variant("STRONG")) return PANGO_GRAVITY_HINT_STRONG; /* `STRONG */
  else if (val == caml_hash_variant("LINE")) return PANGO_GRAVITY_HINT_LINE; /* `LINE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoGravityHint tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoLayoutDeserializeError to OCaml value */
value Val_PangoLayoutDeserializeError(PangoLayoutDeserializeError val) {
  switch (val) {
    case PANGO_LAYOUT_DESERIALIZE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE: return caml_hash_variant("INVALID_VALUE"); /* `INVALID_VALUE */
    case PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE: return caml_hash_variant("MISSING_VALUE"); /* `MISSING_VALUE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoLayoutDeserializeError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoLayoutDeserializeError */
PangoLayoutDeserializeError PangoLayoutDeserializeError_val(value val) {
  if (val == caml_hash_variant("INVALID")) return PANGO_LAYOUT_DESERIALIZE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("INVALID_VALUE")) return PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE; /* `INVALID_VALUE */
  else if (val == caml_hash_variant("MISSING_VALUE")) return PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE; /* `MISSING_VALUE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoLayoutDeserializeError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoOverline to OCaml value */
value Val_PangoOverline(PangoOverline val) {
  switch (val) {
    case PANGO_OVERLINE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_OVERLINE_SINGLE: return caml_hash_variant("SINGLE"); /* `SINGLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoOverline value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoOverline */
PangoOverline PangoOverline_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_OVERLINE_NONE; /* `NONE */
  else if (val == caml_hash_variant("SINGLE")) return PANGO_OVERLINE_SINGLE; /* `SINGLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoOverline tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoRenderPart to OCaml value */
value Val_PangoRenderPart(PangoRenderPart val) {
  switch (val) {
    case PANGO_RENDER_PART_FOREGROUND: return caml_hash_variant("FOREGROUND"); /* `FOREGROUND */
    case PANGO_RENDER_PART_BACKGROUND: return caml_hash_variant("BACKGROUND"); /* `BACKGROUND */
    case PANGO_RENDER_PART_UNDERLINE: return caml_hash_variant("UNDERLINE"); /* `UNDERLINE */
    case PANGO_RENDER_PART_STRIKETHROUGH: return caml_hash_variant("STRIKETHROUGH"); /* `STRIKETHROUGH */
    case PANGO_RENDER_PART_OVERLINE: return caml_hash_variant("OVERLINE"); /* `OVERLINE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoRenderPart value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoRenderPart */
PangoRenderPart PangoRenderPart_val(value val) {
  if (val == caml_hash_variant("FOREGROUND")) return PANGO_RENDER_PART_FOREGROUND; /* `FOREGROUND */
  else if (val == caml_hash_variant("BACKGROUND")) return PANGO_RENDER_PART_BACKGROUND; /* `BACKGROUND */
  else if (val == caml_hash_variant("UNDERLINE")) return PANGO_RENDER_PART_UNDERLINE; /* `UNDERLINE */
  else if (val == caml_hash_variant("STRIKETHROUGH")) return PANGO_RENDER_PART_STRIKETHROUGH; /* `STRIKETHROUGH */
  else if (val == caml_hash_variant("OVERLINE")) return PANGO_RENDER_PART_OVERLINE; /* `OVERLINE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoRenderPart tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoScript to OCaml value */
value Val_PangoScript(PangoScript val) {
  switch (val) {
    case PANGO_SCRIPT_INVALID_CODE: return caml_hash_variant("INVALID_CODE"); /* `INVALID_CODE */
    case PANGO_SCRIPT_COMMON: return caml_hash_variant("COMMON"); /* `COMMON */
    case PANGO_SCRIPT_INHERITED: return caml_hash_variant("INHERITED"); /* `INHERITED */
    case PANGO_SCRIPT_ARABIC: return caml_hash_variant("ARABIC"); /* `ARABIC */
    case PANGO_SCRIPT_ARMENIAN: return caml_hash_variant("ARMENIAN"); /* `ARMENIAN */
    case PANGO_SCRIPT_BENGALI: return caml_hash_variant("BENGALI"); /* `BENGALI */
    case PANGO_SCRIPT_BOPOMOFO: return caml_hash_variant("BOPOMOFO"); /* `BOPOMOFO */
    case PANGO_SCRIPT_CHEROKEE: return caml_hash_variant("CHEROKEE"); /* `CHEROKEE */
    case PANGO_SCRIPT_COPTIC: return caml_hash_variant("COPTIC"); /* `COPTIC */
    case PANGO_SCRIPT_CYRILLIC: return caml_hash_variant("CYRILLIC"); /* `CYRILLIC */
    case PANGO_SCRIPT_DESERET: return caml_hash_variant("DESERET"); /* `DESERET */
    case PANGO_SCRIPT_DEVANAGARI: return caml_hash_variant("DEVANAGARI"); /* `DEVANAGARI */
    case PANGO_SCRIPT_ETHIOPIC: return caml_hash_variant("ETHIOPIC"); /* `ETHIOPIC */
    case PANGO_SCRIPT_GEORGIAN: return caml_hash_variant("GEORGIAN"); /* `GEORGIAN */
    case PANGO_SCRIPT_GOTHIC: return caml_hash_variant("GOTHIC"); /* `GOTHIC */
    case PANGO_SCRIPT_GREEK: return caml_hash_variant("GREEK"); /* `GREEK */
    case PANGO_SCRIPT_GUJARATI: return caml_hash_variant("GUJARATI"); /* `GUJARATI */
    case PANGO_SCRIPT_GURMUKHI: return caml_hash_variant("GURMUKHI"); /* `GURMUKHI */
    case PANGO_SCRIPT_HAN: return caml_hash_variant("HAN"); /* `HAN */
    case PANGO_SCRIPT_HANGUL: return caml_hash_variant("HANGUL"); /* `HANGUL */
    case PANGO_SCRIPT_HEBREW: return caml_hash_variant("HEBREW"); /* `HEBREW */
    case PANGO_SCRIPT_HIRAGANA: return caml_hash_variant("HIRAGANA"); /* `HIRAGANA */
    case PANGO_SCRIPT_KANNADA: return caml_hash_variant("KANNADA"); /* `KANNADA */
    case PANGO_SCRIPT_KATAKANA: return caml_hash_variant("KATAKANA"); /* `KATAKANA */
    case PANGO_SCRIPT_KHMER: return caml_hash_variant("KHMER"); /* `KHMER */
    case PANGO_SCRIPT_LAO: return caml_hash_variant("LAO"); /* `LAO */
    case PANGO_SCRIPT_LATIN: return caml_hash_variant("LATIN"); /* `LATIN */
    case PANGO_SCRIPT_MALAYALAM: return caml_hash_variant("MALAYALAM"); /* `MALAYALAM */
    case PANGO_SCRIPT_MONGOLIAN: return caml_hash_variant("MONGOLIAN"); /* `MONGOLIAN */
    case PANGO_SCRIPT_MYANMAR: return caml_hash_variant("MYANMAR"); /* `MYANMAR */
    case PANGO_SCRIPT_OGHAM: return caml_hash_variant("OGHAM"); /* `OGHAM */
    case PANGO_SCRIPT_OLD_ITALIC: return caml_hash_variant("OLD_ITALIC"); /* `OLD_ITALIC */
    case PANGO_SCRIPT_ORIYA: return caml_hash_variant("ORIYA"); /* `ORIYA */
    case PANGO_SCRIPT_RUNIC: return caml_hash_variant("RUNIC"); /* `RUNIC */
    case PANGO_SCRIPT_SINHALA: return caml_hash_variant("SINHALA"); /* `SINHALA */
    case PANGO_SCRIPT_SYRIAC: return caml_hash_variant("SYRIAC"); /* `SYRIAC */
    case PANGO_SCRIPT_TAMIL: return caml_hash_variant("TAMIL"); /* `TAMIL */
    case PANGO_SCRIPT_TELUGU: return caml_hash_variant("TELUGU"); /* `TELUGU */
    case PANGO_SCRIPT_THAANA: return caml_hash_variant("THAANA"); /* `THAANA */
    case PANGO_SCRIPT_THAI: return caml_hash_variant("THAI"); /* `THAI */
    case PANGO_SCRIPT_TIBETAN: return caml_hash_variant("TIBETAN"); /* `TIBETAN */
    case PANGO_SCRIPT_CANADIAN_ABORIGINAL: return caml_hash_variant("CANADIAN_ABORIGINAL"); /* `CANADIAN_ABORIGINAL */
    case PANGO_SCRIPT_YI: return caml_hash_variant("YI"); /* `YI */
    case PANGO_SCRIPT_TAGALOG: return caml_hash_variant("TAGALOG"); /* `TAGALOG */
    case PANGO_SCRIPT_HANUNOO: return caml_hash_variant("HANUNOO"); /* `HANUNOO */
    case PANGO_SCRIPT_BUHID: return caml_hash_variant("BUHID"); /* `BUHID */
    case PANGO_SCRIPT_TAGBANWA: return caml_hash_variant("TAGBANWA"); /* `TAGBANWA */
    case PANGO_SCRIPT_BRAILLE: return caml_hash_variant("BRAILLE"); /* `BRAILLE */
    case PANGO_SCRIPT_CYPRIOT: return caml_hash_variant("CYPRIOT"); /* `CYPRIOT */
    case PANGO_SCRIPT_LIMBU: return caml_hash_variant("LIMBU"); /* `LIMBU */
    case PANGO_SCRIPT_OSMANYA: return caml_hash_variant("OSMANYA"); /* `OSMANYA */
    case PANGO_SCRIPT_SHAVIAN: return caml_hash_variant("SHAVIAN"); /* `SHAVIAN */
    case PANGO_SCRIPT_LINEAR_B: return caml_hash_variant("LINEAR_B"); /* `LINEAR_B */
    case PANGO_SCRIPT_TAI_LE: return caml_hash_variant("TAI_LE"); /* `TAI_LE */
    case PANGO_SCRIPT_UGARITIC: return caml_hash_variant("UGARITIC"); /* `UGARITIC */
    case PANGO_SCRIPT_NEW_TAI_LUE: return caml_hash_variant("NEW_TAI_LUE"); /* `NEW_TAI_LUE */
    case PANGO_SCRIPT_BUGINESE: return caml_hash_variant("BUGINESE"); /* `BUGINESE */
    case PANGO_SCRIPT_GLAGOLITIC: return caml_hash_variant("GLAGOLITIC"); /* `GLAGOLITIC */
    case PANGO_SCRIPT_TIFINAGH: return caml_hash_variant("TIFINAGH"); /* `TIFINAGH */
    case PANGO_SCRIPT_SYLOTI_NAGRI: return caml_hash_variant("SYLOTI_NAGRI"); /* `SYLOTI_NAGRI */
    case PANGO_SCRIPT_OLD_PERSIAN: return caml_hash_variant("OLD_PERSIAN"); /* `OLD_PERSIAN */
    case PANGO_SCRIPT_KHAROSHTHI: return caml_hash_variant("KHAROSHTHI"); /* `KHAROSHTHI */
    case PANGO_SCRIPT_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case PANGO_SCRIPT_BALINESE: return caml_hash_variant("BALINESE"); /* `BALINESE */
    case PANGO_SCRIPT_CUNEIFORM: return caml_hash_variant("CUNEIFORM"); /* `CUNEIFORM */
    case PANGO_SCRIPT_PHOENICIAN: return caml_hash_variant("PHOENICIAN"); /* `PHOENICIAN */
    case PANGO_SCRIPT_PHAGS_PA: return caml_hash_variant("PHAGS_PA"); /* `PHAGS_PA */
    case PANGO_SCRIPT_NKO: return caml_hash_variant("NKO"); /* `NKO */
    case PANGO_SCRIPT_KAYAH_LI: return caml_hash_variant("KAYAH_LI"); /* `KAYAH_LI */
    case PANGO_SCRIPT_LEPCHA: return caml_hash_variant("LEPCHA"); /* `LEPCHA */
    case PANGO_SCRIPT_REJANG: return caml_hash_variant("REJANG"); /* `REJANG */
    case PANGO_SCRIPT_SUNDANESE: return caml_hash_variant("SUNDANESE"); /* `SUNDANESE */
    case PANGO_SCRIPT_SAURASHTRA: return caml_hash_variant("SAURASHTRA"); /* `SAURASHTRA */
    case PANGO_SCRIPT_CHAM: return caml_hash_variant("CHAM"); /* `CHAM */
    case PANGO_SCRIPT_OL_CHIKI: return caml_hash_variant("OL_CHIKI"); /* `OL_CHIKI */
    case PANGO_SCRIPT_VAI: return caml_hash_variant("VAI"); /* `VAI */
    case PANGO_SCRIPT_CARIAN: return caml_hash_variant("CARIAN"); /* `CARIAN */
    case PANGO_SCRIPT_LYCIAN: return caml_hash_variant("LYCIAN"); /* `LYCIAN */
    case PANGO_SCRIPT_LYDIAN: return caml_hash_variant("LYDIAN"); /* `LYDIAN */
    case PANGO_SCRIPT_BATAK: return caml_hash_variant("BATAK"); /* `BATAK */
    case PANGO_SCRIPT_BRAHMI: return caml_hash_variant("BRAHMI"); /* `BRAHMI */
    case PANGO_SCRIPT_MANDAIC: return caml_hash_variant("MANDAIC"); /* `MANDAIC */
    case PANGO_SCRIPT_CHAKMA: return caml_hash_variant("CHAKMA"); /* `CHAKMA */
    case PANGO_SCRIPT_MEROITIC_CURSIVE: return caml_hash_variant("MEROITIC_CURSIVE"); /* `MEROITIC_CURSIVE */
    case PANGO_SCRIPT_MEROITIC_HIEROGLYPHS: return caml_hash_variant("MEROITIC_HIEROGLYPHS"); /* `MEROITIC_HIEROGLYPHS */
    case PANGO_SCRIPT_MIAO: return caml_hash_variant("MIAO"); /* `MIAO */
    case PANGO_SCRIPT_SHARADA: return caml_hash_variant("SHARADA"); /* `SHARADA */
    case PANGO_SCRIPT_SORA_SOMPENG: return caml_hash_variant("SORA_SOMPENG"); /* `SORA_SOMPENG */
    case PANGO_SCRIPT_TAKRI: return caml_hash_variant("TAKRI"); /* `TAKRI */
    case PANGO_SCRIPT_BASSA_VAH: return caml_hash_variant("BASSA_VAH"); /* `BASSA_VAH */
    case PANGO_SCRIPT_CAUCASIAN_ALBANIAN: return caml_hash_variant("CAUCASIAN_ALBANIAN"); /* `CAUCASIAN_ALBANIAN */
    case PANGO_SCRIPT_DUPLOYAN: return caml_hash_variant("DUPLOYAN"); /* `DUPLOYAN */
    case PANGO_SCRIPT_ELBASAN: return caml_hash_variant("ELBASAN"); /* `ELBASAN */
    case PANGO_SCRIPT_GRANTHA: return caml_hash_variant("GRANTHA"); /* `GRANTHA */
    case PANGO_SCRIPT_KHOJKI: return caml_hash_variant("KHOJKI"); /* `KHOJKI */
    case PANGO_SCRIPT_KHUDAWADI: return caml_hash_variant("KHUDAWADI"); /* `KHUDAWADI */
    case PANGO_SCRIPT_LINEAR_A: return caml_hash_variant("LINEAR_A"); /* `LINEAR_A */
    case PANGO_SCRIPT_MAHAJANI: return caml_hash_variant("MAHAJANI"); /* `MAHAJANI */
    case PANGO_SCRIPT_MANICHAEAN: return caml_hash_variant("MANICHAEAN"); /* `MANICHAEAN */
    case PANGO_SCRIPT_MENDE_KIKAKUI: return caml_hash_variant("MENDE_KIKAKUI"); /* `MENDE_KIKAKUI */
    case PANGO_SCRIPT_MODI: return caml_hash_variant("MODI"); /* `MODI */
    case PANGO_SCRIPT_MRO: return caml_hash_variant("MRO"); /* `MRO */
    case PANGO_SCRIPT_NABATAEAN: return caml_hash_variant("NABATAEAN"); /* `NABATAEAN */
    case PANGO_SCRIPT_OLD_NORTH_ARABIAN: return caml_hash_variant("OLD_NORTH_ARABIAN"); /* `OLD_NORTH_ARABIAN */
    case PANGO_SCRIPT_OLD_PERMIC: return caml_hash_variant("OLD_PERMIC"); /* `OLD_PERMIC */
    case PANGO_SCRIPT_PAHAWH_HMONG: return caml_hash_variant("PAHAWH_HMONG"); /* `PAHAWH_HMONG */
    case PANGO_SCRIPT_PALMYRENE: return caml_hash_variant("PALMYRENE"); /* `PALMYRENE */
    case PANGO_SCRIPT_PAU_CIN_HAU: return caml_hash_variant("PAU_CIN_HAU"); /* `PAU_CIN_HAU */
    case PANGO_SCRIPT_PSALTER_PAHLAVI: return caml_hash_variant("PSALTER_PAHLAVI"); /* `PSALTER_PAHLAVI */
    case PANGO_SCRIPT_SIDDHAM: return caml_hash_variant("SIDDHAM"); /* `SIDDHAM */
    case PANGO_SCRIPT_TIRHUTA: return caml_hash_variant("TIRHUTA"); /* `TIRHUTA */
    case PANGO_SCRIPT_WARANG_CITI: return caml_hash_variant("WARANG_CITI"); /* `WARANG_CITI */
    case PANGO_SCRIPT_AHOM: return caml_hash_variant("AHOM"); /* `AHOM */
    case PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS: return caml_hash_variant("ANATOLIAN_HIEROGLYPHS"); /* `ANATOLIAN_HIEROGLYPHS */
    case PANGO_SCRIPT_HATRAN: return caml_hash_variant("HATRAN"); /* `HATRAN */
    case PANGO_SCRIPT_MULTANI: return caml_hash_variant("MULTANI"); /* `MULTANI */
    case PANGO_SCRIPT_OLD_HUNGARIAN: return caml_hash_variant("OLD_HUNGARIAN"); /* `OLD_HUNGARIAN */
    case PANGO_SCRIPT_SIGNWRITING: return caml_hash_variant("SIGNWRITING"); /* `SIGNWRITING */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoScript value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoScript */
PangoScript PangoScript_val(value val) {
  if (val == caml_hash_variant("INVALID_CODE")) return PANGO_SCRIPT_INVALID_CODE; /* `INVALID_CODE */
  else if (val == caml_hash_variant("COMMON")) return PANGO_SCRIPT_COMMON; /* `COMMON */
  else if (val == caml_hash_variant("INHERITED")) return PANGO_SCRIPT_INHERITED; /* `INHERITED */
  else if (val == caml_hash_variant("ARABIC")) return PANGO_SCRIPT_ARABIC; /* `ARABIC */
  else if (val == caml_hash_variant("ARMENIAN")) return PANGO_SCRIPT_ARMENIAN; /* `ARMENIAN */
  else if (val == caml_hash_variant("BENGALI")) return PANGO_SCRIPT_BENGALI; /* `BENGALI */
  else if (val == caml_hash_variant("BOPOMOFO")) return PANGO_SCRIPT_BOPOMOFO; /* `BOPOMOFO */
  else if (val == caml_hash_variant("CHEROKEE")) return PANGO_SCRIPT_CHEROKEE; /* `CHEROKEE */
  else if (val == caml_hash_variant("COPTIC")) return PANGO_SCRIPT_COPTIC; /* `COPTIC */
  else if (val == caml_hash_variant("CYRILLIC")) return PANGO_SCRIPT_CYRILLIC; /* `CYRILLIC */
  else if (val == caml_hash_variant("DESERET")) return PANGO_SCRIPT_DESERET; /* `DESERET */
  else if (val == caml_hash_variant("DEVANAGARI")) return PANGO_SCRIPT_DEVANAGARI; /* `DEVANAGARI */
  else if (val == caml_hash_variant("ETHIOPIC")) return PANGO_SCRIPT_ETHIOPIC; /* `ETHIOPIC */
  else if (val == caml_hash_variant("GEORGIAN")) return PANGO_SCRIPT_GEORGIAN; /* `GEORGIAN */
  else if (val == caml_hash_variant("GOTHIC")) return PANGO_SCRIPT_GOTHIC; /* `GOTHIC */
  else if (val == caml_hash_variant("GREEK")) return PANGO_SCRIPT_GREEK; /* `GREEK */
  else if (val == caml_hash_variant("GUJARATI")) return PANGO_SCRIPT_GUJARATI; /* `GUJARATI */
  else if (val == caml_hash_variant("GURMUKHI")) return PANGO_SCRIPT_GURMUKHI; /* `GURMUKHI */
  else if (val == caml_hash_variant("HAN")) return PANGO_SCRIPT_HAN; /* `HAN */
  else if (val == caml_hash_variant("HANGUL")) return PANGO_SCRIPT_HANGUL; /* `HANGUL */
  else if (val == caml_hash_variant("HEBREW")) return PANGO_SCRIPT_HEBREW; /* `HEBREW */
  else if (val == caml_hash_variant("HIRAGANA")) return PANGO_SCRIPT_HIRAGANA; /* `HIRAGANA */
  else if (val == caml_hash_variant("KANNADA")) return PANGO_SCRIPT_KANNADA; /* `KANNADA */
  else if (val == caml_hash_variant("KATAKANA")) return PANGO_SCRIPT_KATAKANA; /* `KATAKANA */
  else if (val == caml_hash_variant("KHMER")) return PANGO_SCRIPT_KHMER; /* `KHMER */
  else if (val == caml_hash_variant("LAO")) return PANGO_SCRIPT_LAO; /* `LAO */
  else if (val == caml_hash_variant("LATIN")) return PANGO_SCRIPT_LATIN; /* `LATIN */
  else if (val == caml_hash_variant("MALAYALAM")) return PANGO_SCRIPT_MALAYALAM; /* `MALAYALAM */
  else if (val == caml_hash_variant("MONGOLIAN")) return PANGO_SCRIPT_MONGOLIAN; /* `MONGOLIAN */
  else if (val == caml_hash_variant("MYANMAR")) return PANGO_SCRIPT_MYANMAR; /* `MYANMAR */
  else if (val == caml_hash_variant("OGHAM")) return PANGO_SCRIPT_OGHAM; /* `OGHAM */
  else if (val == caml_hash_variant("OLD_ITALIC")) return PANGO_SCRIPT_OLD_ITALIC; /* `OLD_ITALIC */
  else if (val == caml_hash_variant("ORIYA")) return PANGO_SCRIPT_ORIYA; /* `ORIYA */
  else if (val == caml_hash_variant("RUNIC")) return PANGO_SCRIPT_RUNIC; /* `RUNIC */
  else if (val == caml_hash_variant("SINHALA")) return PANGO_SCRIPT_SINHALA; /* `SINHALA */
  else if (val == caml_hash_variant("SYRIAC")) return PANGO_SCRIPT_SYRIAC; /* `SYRIAC */
  else if (val == caml_hash_variant("TAMIL")) return PANGO_SCRIPT_TAMIL; /* `TAMIL */
  else if (val == caml_hash_variant("TELUGU")) return PANGO_SCRIPT_TELUGU; /* `TELUGU */
  else if (val == caml_hash_variant("THAANA")) return PANGO_SCRIPT_THAANA; /* `THAANA */
  else if (val == caml_hash_variant("THAI")) return PANGO_SCRIPT_THAI; /* `THAI */
  else if (val == caml_hash_variant("TIBETAN")) return PANGO_SCRIPT_TIBETAN; /* `TIBETAN */
  else if (val == caml_hash_variant("CANADIAN_ABORIGINAL")) return PANGO_SCRIPT_CANADIAN_ABORIGINAL; /* `CANADIAN_ABORIGINAL */
  else if (val == caml_hash_variant("YI")) return PANGO_SCRIPT_YI; /* `YI */
  else if (val == caml_hash_variant("TAGALOG")) return PANGO_SCRIPT_TAGALOG; /* `TAGALOG */
  else if (val == caml_hash_variant("HANUNOO")) return PANGO_SCRIPT_HANUNOO; /* `HANUNOO */
  else if (val == caml_hash_variant("BUHID")) return PANGO_SCRIPT_BUHID; /* `BUHID */
  else if (val == caml_hash_variant("TAGBANWA")) return PANGO_SCRIPT_TAGBANWA; /* `TAGBANWA */
  else if (val == caml_hash_variant("BRAILLE")) return PANGO_SCRIPT_BRAILLE; /* `BRAILLE */
  else if (val == caml_hash_variant("CYPRIOT")) return PANGO_SCRIPT_CYPRIOT; /* `CYPRIOT */
  else if (val == caml_hash_variant("LIMBU")) return PANGO_SCRIPT_LIMBU; /* `LIMBU */
  else if (val == caml_hash_variant("OSMANYA")) return PANGO_SCRIPT_OSMANYA; /* `OSMANYA */
  else if (val == caml_hash_variant("SHAVIAN")) return PANGO_SCRIPT_SHAVIAN; /* `SHAVIAN */
  else if (val == caml_hash_variant("LINEAR_B")) return PANGO_SCRIPT_LINEAR_B; /* `LINEAR_B */
  else if (val == caml_hash_variant("TAI_LE")) return PANGO_SCRIPT_TAI_LE; /* `TAI_LE */
  else if (val == caml_hash_variant("UGARITIC")) return PANGO_SCRIPT_UGARITIC; /* `UGARITIC */
  else if (val == caml_hash_variant("NEW_TAI_LUE")) return PANGO_SCRIPT_NEW_TAI_LUE; /* `NEW_TAI_LUE */
  else if (val == caml_hash_variant("BUGINESE")) return PANGO_SCRIPT_BUGINESE; /* `BUGINESE */
  else if (val == caml_hash_variant("GLAGOLITIC")) return PANGO_SCRIPT_GLAGOLITIC; /* `GLAGOLITIC */
  else if (val == caml_hash_variant("TIFINAGH")) return PANGO_SCRIPT_TIFINAGH; /* `TIFINAGH */
  else if (val == caml_hash_variant("SYLOTI_NAGRI")) return PANGO_SCRIPT_SYLOTI_NAGRI; /* `SYLOTI_NAGRI */
  else if (val == caml_hash_variant("OLD_PERSIAN")) return PANGO_SCRIPT_OLD_PERSIAN; /* `OLD_PERSIAN */
  else if (val == caml_hash_variant("KHAROSHTHI")) return PANGO_SCRIPT_KHAROSHTHI; /* `KHAROSHTHI */
  else if (val == caml_hash_variant("UNKNOWN")) return PANGO_SCRIPT_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("BALINESE")) return PANGO_SCRIPT_BALINESE; /* `BALINESE */
  else if (val == caml_hash_variant("CUNEIFORM")) return PANGO_SCRIPT_CUNEIFORM; /* `CUNEIFORM */
  else if (val == caml_hash_variant("PHOENICIAN")) return PANGO_SCRIPT_PHOENICIAN; /* `PHOENICIAN */
  else if (val == caml_hash_variant("PHAGS_PA")) return PANGO_SCRIPT_PHAGS_PA; /* `PHAGS_PA */
  else if (val == caml_hash_variant("NKO")) return PANGO_SCRIPT_NKO; /* `NKO */
  else if (val == caml_hash_variant("KAYAH_LI")) return PANGO_SCRIPT_KAYAH_LI; /* `KAYAH_LI */
  else if (val == caml_hash_variant("LEPCHA")) return PANGO_SCRIPT_LEPCHA; /* `LEPCHA */
  else if (val == caml_hash_variant("REJANG")) return PANGO_SCRIPT_REJANG; /* `REJANG */
  else if (val == caml_hash_variant("SUNDANESE")) return PANGO_SCRIPT_SUNDANESE; /* `SUNDANESE */
  else if (val == caml_hash_variant("SAURASHTRA")) return PANGO_SCRIPT_SAURASHTRA; /* `SAURASHTRA */
  else if (val == caml_hash_variant("CHAM")) return PANGO_SCRIPT_CHAM; /* `CHAM */
  else if (val == caml_hash_variant("OL_CHIKI")) return PANGO_SCRIPT_OL_CHIKI; /* `OL_CHIKI */
  else if (val == caml_hash_variant("VAI")) return PANGO_SCRIPT_VAI; /* `VAI */
  else if (val == caml_hash_variant("CARIAN")) return PANGO_SCRIPT_CARIAN; /* `CARIAN */
  else if (val == caml_hash_variant("LYCIAN")) return PANGO_SCRIPT_LYCIAN; /* `LYCIAN */
  else if (val == caml_hash_variant("LYDIAN")) return PANGO_SCRIPT_LYDIAN; /* `LYDIAN */
  else if (val == caml_hash_variant("BATAK")) return PANGO_SCRIPT_BATAK; /* `BATAK */
  else if (val == caml_hash_variant("BRAHMI")) return PANGO_SCRIPT_BRAHMI; /* `BRAHMI */
  else if (val == caml_hash_variant("MANDAIC")) return PANGO_SCRIPT_MANDAIC; /* `MANDAIC */
  else if (val == caml_hash_variant("CHAKMA")) return PANGO_SCRIPT_CHAKMA; /* `CHAKMA */
  else if (val == caml_hash_variant("MEROITIC_CURSIVE")) return PANGO_SCRIPT_MEROITIC_CURSIVE; /* `MEROITIC_CURSIVE */
  else if (val == caml_hash_variant("MEROITIC_HIEROGLYPHS")) return PANGO_SCRIPT_MEROITIC_HIEROGLYPHS; /* `MEROITIC_HIEROGLYPHS */
  else if (val == caml_hash_variant("MIAO")) return PANGO_SCRIPT_MIAO; /* `MIAO */
  else if (val == caml_hash_variant("SHARADA")) return PANGO_SCRIPT_SHARADA; /* `SHARADA */
  else if (val == caml_hash_variant("SORA_SOMPENG")) return PANGO_SCRIPT_SORA_SOMPENG; /* `SORA_SOMPENG */
  else if (val == caml_hash_variant("TAKRI")) return PANGO_SCRIPT_TAKRI; /* `TAKRI */
  else if (val == caml_hash_variant("BASSA_VAH")) return PANGO_SCRIPT_BASSA_VAH; /* `BASSA_VAH */
  else if (val == caml_hash_variant("CAUCASIAN_ALBANIAN")) return PANGO_SCRIPT_CAUCASIAN_ALBANIAN; /* `CAUCASIAN_ALBANIAN */
  else if (val == caml_hash_variant("DUPLOYAN")) return PANGO_SCRIPT_DUPLOYAN; /* `DUPLOYAN */
  else if (val == caml_hash_variant("ELBASAN")) return PANGO_SCRIPT_ELBASAN; /* `ELBASAN */
  else if (val == caml_hash_variant("GRANTHA")) return PANGO_SCRIPT_GRANTHA; /* `GRANTHA */
  else if (val == caml_hash_variant("KHOJKI")) return PANGO_SCRIPT_KHOJKI; /* `KHOJKI */
  else if (val == caml_hash_variant("KHUDAWADI")) return PANGO_SCRIPT_KHUDAWADI; /* `KHUDAWADI */
  else if (val == caml_hash_variant("LINEAR_A")) return PANGO_SCRIPT_LINEAR_A; /* `LINEAR_A */
  else if (val == caml_hash_variant("MAHAJANI")) return PANGO_SCRIPT_MAHAJANI; /* `MAHAJANI */
  else if (val == caml_hash_variant("MANICHAEAN")) return PANGO_SCRIPT_MANICHAEAN; /* `MANICHAEAN */
  else if (val == caml_hash_variant("MENDE_KIKAKUI")) return PANGO_SCRIPT_MENDE_KIKAKUI; /* `MENDE_KIKAKUI */
  else if (val == caml_hash_variant("MODI")) return PANGO_SCRIPT_MODI; /* `MODI */
  else if (val == caml_hash_variant("MRO")) return PANGO_SCRIPT_MRO; /* `MRO */
  else if (val == caml_hash_variant("NABATAEAN")) return PANGO_SCRIPT_NABATAEAN; /* `NABATAEAN */
  else if (val == caml_hash_variant("OLD_NORTH_ARABIAN")) return PANGO_SCRIPT_OLD_NORTH_ARABIAN; /* `OLD_NORTH_ARABIAN */
  else if (val == caml_hash_variant("OLD_PERMIC")) return PANGO_SCRIPT_OLD_PERMIC; /* `OLD_PERMIC */
  else if (val == caml_hash_variant("PAHAWH_HMONG")) return PANGO_SCRIPT_PAHAWH_HMONG; /* `PAHAWH_HMONG */
  else if (val == caml_hash_variant("PALMYRENE")) return PANGO_SCRIPT_PALMYRENE; /* `PALMYRENE */
  else if (val == caml_hash_variant("PAU_CIN_HAU")) return PANGO_SCRIPT_PAU_CIN_HAU; /* `PAU_CIN_HAU */
  else if (val == caml_hash_variant("PSALTER_PAHLAVI")) return PANGO_SCRIPT_PSALTER_PAHLAVI; /* `PSALTER_PAHLAVI */
  else if (val == caml_hash_variant("SIDDHAM")) return PANGO_SCRIPT_SIDDHAM; /* `SIDDHAM */
  else if (val == caml_hash_variant("TIRHUTA")) return PANGO_SCRIPT_TIRHUTA; /* `TIRHUTA */
  else if (val == caml_hash_variant("WARANG_CITI")) return PANGO_SCRIPT_WARANG_CITI; /* `WARANG_CITI */
  else if (val == caml_hash_variant("AHOM")) return PANGO_SCRIPT_AHOM; /* `AHOM */
  else if (val == caml_hash_variant("ANATOLIAN_HIEROGLYPHS")) return PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS; /* `ANATOLIAN_HIEROGLYPHS */
  else if (val == caml_hash_variant("HATRAN")) return PANGO_SCRIPT_HATRAN; /* `HATRAN */
  else if (val == caml_hash_variant("MULTANI")) return PANGO_SCRIPT_MULTANI; /* `MULTANI */
  else if (val == caml_hash_variant("OLD_HUNGARIAN")) return PANGO_SCRIPT_OLD_HUNGARIAN; /* `OLD_HUNGARIAN */
  else if (val == caml_hash_variant("SIGNWRITING")) return PANGO_SCRIPT_SIGNWRITING; /* `SIGNWRITING */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoScript tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoStretch to OCaml value */
value Val_PangoStretch(PangoStretch val) {
  switch (val) {
    case PANGO_STRETCH_ULTRA_CONDENSED: return caml_hash_variant("ULTRA_CONDENSED"); /* `ULTRA_CONDENSED */
    case PANGO_STRETCH_EXTRA_CONDENSED: return caml_hash_variant("EXTRA_CONDENSED"); /* `EXTRA_CONDENSED */
    case PANGO_STRETCH_CONDENSED: return caml_hash_variant("CONDENSED"); /* `CONDENSED */
    case PANGO_STRETCH_SEMI_CONDENSED: return caml_hash_variant("SEMI_CONDENSED"); /* `SEMI_CONDENSED */
    case PANGO_STRETCH_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case PANGO_STRETCH_SEMI_EXPANDED: return caml_hash_variant("SEMI_EXPANDED"); /* `SEMI_EXPANDED */
    case PANGO_STRETCH_EXPANDED: return caml_hash_variant("EXPANDED"); /* `EXPANDED */
    case PANGO_STRETCH_EXTRA_EXPANDED: return caml_hash_variant("EXTRA_EXPANDED"); /* `EXTRA_EXPANDED */
    case PANGO_STRETCH_ULTRA_EXPANDED: return caml_hash_variant("ULTRA_EXPANDED"); /* `ULTRA_EXPANDED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoStretch value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoStretch */
PangoStretch PangoStretch_val(value val) {
  if (val == caml_hash_variant("ULTRA_CONDENSED")) return PANGO_STRETCH_ULTRA_CONDENSED; /* `ULTRA_CONDENSED */
  else if (val == caml_hash_variant("EXTRA_CONDENSED")) return PANGO_STRETCH_EXTRA_CONDENSED; /* `EXTRA_CONDENSED */
  else if (val == caml_hash_variant("CONDENSED")) return PANGO_STRETCH_CONDENSED; /* `CONDENSED */
  else if (val == caml_hash_variant("SEMI_CONDENSED")) return PANGO_STRETCH_SEMI_CONDENSED; /* `SEMI_CONDENSED */
  else if (val == caml_hash_variant("NORMAL")) return PANGO_STRETCH_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("SEMI_EXPANDED")) return PANGO_STRETCH_SEMI_EXPANDED; /* `SEMI_EXPANDED */
  else if (val == caml_hash_variant("EXPANDED")) return PANGO_STRETCH_EXPANDED; /* `EXPANDED */
  else if (val == caml_hash_variant("EXTRA_EXPANDED")) return PANGO_STRETCH_EXTRA_EXPANDED; /* `EXTRA_EXPANDED */
  else if (val == caml_hash_variant("ULTRA_EXPANDED")) return PANGO_STRETCH_ULTRA_EXPANDED; /* `ULTRA_EXPANDED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoStretch tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoStyle to OCaml value */
value Val_PangoStyle(PangoStyle val) {
  switch (val) {
    case PANGO_STYLE_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case PANGO_STYLE_OBLIQUE: return caml_hash_variant("OBLIQUE"); /* `OBLIQUE */
    case PANGO_STYLE_ITALIC: return caml_hash_variant("ITALIC"); /* `ITALIC */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoStyle value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoStyle */
PangoStyle PangoStyle_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return PANGO_STYLE_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("OBLIQUE")) return PANGO_STYLE_OBLIQUE; /* `OBLIQUE */
  else if (val == caml_hash_variant("ITALIC")) return PANGO_STYLE_ITALIC; /* `ITALIC */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoStyle tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoTabAlign to OCaml value */
value Val_PangoTabAlign(PangoTabAlign val) {
  switch (val) {
    case PANGO_TAB_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case PANGO_TAB_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case PANGO_TAB_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case PANGO_TAB_DECIMAL: return caml_hash_variant("DECIMAL"); /* `DECIMAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoTabAlign value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoTabAlign */
PangoTabAlign PangoTabAlign_val(value val) {
  if (val == caml_hash_variant("LEFT")) return PANGO_TAB_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return PANGO_TAB_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("CENTER")) return PANGO_TAB_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("DECIMAL")) return PANGO_TAB_DECIMAL; /* `DECIMAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoTabAlign tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoTextTransform to OCaml value */
value Val_PangoTextTransform(PangoTextTransform val) {
  switch (val) {
    case PANGO_TEXT_TRANSFORM_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_TEXT_TRANSFORM_LOWERCASE: return caml_hash_variant("LOWERCASE"); /* `LOWERCASE */
    case PANGO_TEXT_TRANSFORM_UPPERCASE: return caml_hash_variant("UPPERCASE"); /* `UPPERCASE */
    case PANGO_TEXT_TRANSFORM_CAPITALIZE: return caml_hash_variant("CAPITALIZE"); /* `CAPITALIZE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoTextTransform value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoTextTransform */
PangoTextTransform PangoTextTransform_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_TEXT_TRANSFORM_NONE; /* `NONE */
  else if (val == caml_hash_variant("LOWERCASE")) return PANGO_TEXT_TRANSFORM_LOWERCASE; /* `LOWERCASE */
  else if (val == caml_hash_variant("UPPERCASE")) return PANGO_TEXT_TRANSFORM_UPPERCASE; /* `UPPERCASE */
  else if (val == caml_hash_variant("CAPITALIZE")) return PANGO_TEXT_TRANSFORM_CAPITALIZE; /* `CAPITALIZE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoTextTransform tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoUnderline to OCaml value */
value Val_PangoUnderline(PangoUnderline val) {
  switch (val) {
    case PANGO_UNDERLINE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case PANGO_UNDERLINE_SINGLE: return caml_hash_variant("SINGLE"); /* `SINGLE */
    case PANGO_UNDERLINE_DOUBLE: return caml_hash_variant("DOUBLE"); /* `DOUBLE */
    case PANGO_UNDERLINE_LOW: return caml_hash_variant("LOW"); /* `LOW */
    case PANGO_UNDERLINE_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case PANGO_UNDERLINE_SINGLE_LINE: return caml_hash_variant("SINGLE_LINE"); /* `SINGLE_LINE */
    case PANGO_UNDERLINE_DOUBLE_LINE: return caml_hash_variant("DOUBLE_LINE"); /* `DOUBLE_LINE */
    case PANGO_UNDERLINE_ERROR_LINE: return caml_hash_variant("ERROR_LINE"); /* `ERROR_LINE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoUnderline value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoUnderline */
PangoUnderline PangoUnderline_val(value val) {
  if (val == caml_hash_variant("NONE")) return PANGO_UNDERLINE_NONE; /* `NONE */
  else if (val == caml_hash_variant("SINGLE")) return PANGO_UNDERLINE_SINGLE; /* `SINGLE */
  else if (val == caml_hash_variant("DOUBLE")) return PANGO_UNDERLINE_DOUBLE; /* `DOUBLE */
  else if (val == caml_hash_variant("LOW")) return PANGO_UNDERLINE_LOW; /* `LOW */
  else if (val == caml_hash_variant("ERROR")) return PANGO_UNDERLINE_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("SINGLE_LINE")) return PANGO_UNDERLINE_SINGLE_LINE; /* `SINGLE_LINE */
  else if (val == caml_hash_variant("DOUBLE_LINE")) return PANGO_UNDERLINE_DOUBLE_LINE; /* `DOUBLE_LINE */
  else if (val == caml_hash_variant("ERROR_LINE")) return PANGO_UNDERLINE_ERROR_LINE; /* `ERROR_LINE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoUnderline tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoVariant to OCaml value */
value Val_PangoVariant(PangoVariant val) {
  switch (val) {
    case PANGO_VARIANT_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case PANGO_VARIANT_SMALL_CAPS: return caml_hash_variant("SMALL_CAPS"); /* `SMALL_CAPS */
    case PANGO_VARIANT_ALL_SMALL_CAPS: return caml_hash_variant("ALL_SMALL_CAPS"); /* `ALL_SMALL_CAPS */
    case PANGO_VARIANT_PETITE_CAPS: return caml_hash_variant("PETITE_CAPS"); /* `PETITE_CAPS */
    case PANGO_VARIANT_ALL_PETITE_CAPS: return caml_hash_variant("ALL_PETITE_CAPS"); /* `ALL_PETITE_CAPS */
    case PANGO_VARIANT_UNICASE: return caml_hash_variant("UNICASE"); /* `UNICASE */
    case PANGO_VARIANT_TITLE_CAPS: return caml_hash_variant("TITLE_CAPS"); /* `TITLE_CAPS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoVariant value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoVariant */
PangoVariant PangoVariant_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return PANGO_VARIANT_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("SMALL_CAPS")) return PANGO_VARIANT_SMALL_CAPS; /* `SMALL_CAPS */
  else if (val == caml_hash_variant("ALL_SMALL_CAPS")) return PANGO_VARIANT_ALL_SMALL_CAPS; /* `ALL_SMALL_CAPS */
  else if (val == caml_hash_variant("PETITE_CAPS")) return PANGO_VARIANT_PETITE_CAPS; /* `PETITE_CAPS */
  else if (val == caml_hash_variant("ALL_PETITE_CAPS")) return PANGO_VARIANT_ALL_PETITE_CAPS; /* `ALL_PETITE_CAPS */
  else if (val == caml_hash_variant("UNICASE")) return PANGO_VARIANT_UNICASE; /* `UNICASE */
  else if (val == caml_hash_variant("TITLE_CAPS")) return PANGO_VARIANT_TITLE_CAPS; /* `TITLE_CAPS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoVariant tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoWeight to OCaml value */
value Val_PangoWeight(PangoWeight val) {
  switch (val) {
    case PANGO_WEIGHT_THIN: return caml_hash_variant("THIN"); /* `THIN */
    case PANGO_WEIGHT_ULTRALIGHT: return caml_hash_variant("ULTRALIGHT"); /* `ULTRALIGHT */
    case PANGO_WEIGHT_LIGHT: return caml_hash_variant("LIGHT"); /* `LIGHT */
    case PANGO_WEIGHT_SEMILIGHT: return caml_hash_variant("SEMILIGHT"); /* `SEMILIGHT */
    case PANGO_WEIGHT_BOOK: return caml_hash_variant("BOOK"); /* `BOOK */
    case PANGO_WEIGHT_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case PANGO_WEIGHT_MEDIUM: return caml_hash_variant("MEDIUM"); /* `MEDIUM */
    case PANGO_WEIGHT_SEMIBOLD: return caml_hash_variant("SEMIBOLD"); /* `SEMIBOLD */
    case PANGO_WEIGHT_BOLD: return caml_hash_variant("BOLD"); /* `BOLD */
    case PANGO_WEIGHT_ULTRABOLD: return caml_hash_variant("ULTRABOLD"); /* `ULTRABOLD */
    case PANGO_WEIGHT_HEAVY: return caml_hash_variant("HEAVY"); /* `HEAVY */
    case PANGO_WEIGHT_ULTRAHEAVY: return caml_hash_variant("ULTRAHEAVY"); /* `ULTRAHEAVY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoWeight value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoWeight */
PangoWeight PangoWeight_val(value val) {
  if (val == caml_hash_variant("THIN")) return PANGO_WEIGHT_THIN; /* `THIN */
  else if (val == caml_hash_variant("ULTRALIGHT")) return PANGO_WEIGHT_ULTRALIGHT; /* `ULTRALIGHT */
  else if (val == caml_hash_variant("LIGHT")) return PANGO_WEIGHT_LIGHT; /* `LIGHT */
  else if (val == caml_hash_variant("SEMILIGHT")) return PANGO_WEIGHT_SEMILIGHT; /* `SEMILIGHT */
  else if (val == caml_hash_variant("BOOK")) return PANGO_WEIGHT_BOOK; /* `BOOK */
  else if (val == caml_hash_variant("NORMAL")) return PANGO_WEIGHT_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("MEDIUM")) return PANGO_WEIGHT_MEDIUM; /* `MEDIUM */
  else if (val == caml_hash_variant("SEMIBOLD")) return PANGO_WEIGHT_SEMIBOLD; /* `SEMIBOLD */
  else if (val == caml_hash_variant("BOLD")) return PANGO_WEIGHT_BOLD; /* `BOLD */
  else if (val == caml_hash_variant("ULTRABOLD")) return PANGO_WEIGHT_ULTRABOLD; /* `ULTRABOLD */
  else if (val == caml_hash_variant("HEAVY")) return PANGO_WEIGHT_HEAVY; /* `HEAVY */
  else if (val == caml_hash_variant("ULTRAHEAVY")) return PANGO_WEIGHT_ULTRAHEAVY; /* `ULTRAHEAVY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoWeight tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoWrapMode to OCaml value */
value Val_PangoWrapMode(PangoWrapMode val) {
  switch (val) {
    case PANGO_WRAP_WORD: return caml_hash_variant("WORD"); /* `WORD */
    case PANGO_WRAP_CHAR: return caml_hash_variant("CHAR"); /* `CHAR */
    case PANGO_WRAP_WORD_CHAR: return caml_hash_variant("WORD_CHAR"); /* `WORD_CHAR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown PangoWrapMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to PangoWrapMode */
PangoWrapMode PangoWrapMode_val(value val) {
  if (val == caml_hash_variant("WORD")) return PANGO_WRAP_WORD; /* `WORD */
  else if (val == caml_hash_variant("CHAR")) return PANGO_WRAP_CHAR; /* `CHAR */
  else if (val == caml_hash_variant("WORD_CHAR")) return PANGO_WRAP_WORD_CHAR; /* `WORD_CHAR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown PangoWrapMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert PangoFontMask to OCaml flag list */
value Val_PangoFontMask(PangoFontMask flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & PANGO_FONT_MASK_FAMILY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FAMILY"))); /* `FAMILY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STYLE"))); /* `STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_VARIANT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VARIANT"))); /* `VARIANT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_WEIGHT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WEIGHT"))); /* `WEIGHT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_STRETCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STRETCH"))); /* `STRETCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SIZE"))); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_GRAVITY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GRAVITY"))); /* `GRAVITY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_FONT_MASK_VARIATIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VARIATIONS"))); /* `VARIATIONS */
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
    if (tag == caml_hash_variant("FAMILY")) result |= PANGO_FONT_MASK_FAMILY; /* `FAMILY */
    else if (tag == caml_hash_variant("STYLE")) result |= PANGO_FONT_MASK_STYLE; /* `STYLE */
    else if (tag == caml_hash_variant("VARIANT")) result |= PANGO_FONT_MASK_VARIANT; /* `VARIANT */
    else if (tag == caml_hash_variant("WEIGHT")) result |= PANGO_FONT_MASK_WEIGHT; /* `WEIGHT */
    else if (tag == caml_hash_variant("STRETCH")) result |= PANGO_FONT_MASK_STRETCH; /* `STRETCH */
    else if (tag == caml_hash_variant("SIZE")) result |= PANGO_FONT_MASK_SIZE; /* `SIZE */
    else if (tag == caml_hash_variant("GRAVITY")) result |= PANGO_FONT_MASK_GRAVITY; /* `GRAVITY */
    else if (tag == caml_hash_variant("VARIATIONS")) result |= PANGO_FONT_MASK_VARIATIONS; /* `VARIATIONS */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_DESERIALIZE_CONTEXT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONTEXT"))); /* `CONTEXT */
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
    if (tag == caml_hash_variant("DEFAULT")) result |= PANGO_LAYOUT_DESERIALIZE_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("CONTEXT")) result |= PANGO_LAYOUT_DESERIALIZE_CONTEXT; /* `CONTEXT */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_SERIALIZE_CONTEXT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONTEXT"))); /* `CONTEXT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_LAYOUT_SERIALIZE_OUTPUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("OUTPUT"))); /* `OUTPUT */
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
    if (tag == caml_hash_variant("DEFAULT")) result |= PANGO_LAYOUT_SERIALIZE_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("CONTEXT")) result |= PANGO_LAYOUT_SERIALIZE_CONTEXT; /* `CONTEXT */
    else if (tag == caml_hash_variant("OUTPUT")) result |= PANGO_LAYOUT_SERIALIZE_OUTPUT; /* `OUTPUT */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHAPE_ROUND_POSITIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ROUND_POSITIONS"))); /* `ROUND_POSITIONS */
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
    if (tag == caml_hash_variant("NONE")) result |= PANGO_SHAPE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("ROUND_POSITIONS")) result |= PANGO_SHAPE_ROUND_POSITIONS; /* `ROUND_POSITIONS */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_SPACES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SPACES"))); /* `SPACES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_LINE_BREAKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LINE_BREAKS"))); /* `LINE_BREAKS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & PANGO_SHOW_IGNORABLES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IGNORABLES"))); /* `IGNORABLES */
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
    if (tag == caml_hash_variant("NONE")) result |= PANGO_SHOW_NONE; /* `NONE */
    else if (tag == caml_hash_variant("SPACES")) result |= PANGO_SHOW_SPACES; /* `SPACES */
    else if (tag == caml_hash_variant("LINE_BREAKS")) result |= PANGO_SHOW_LINE_BREAKS; /* `LINE_BREAKS */
    else if (tag == caml_hash_variant("IGNORABLES")) result |= PANGO_SHOW_IGNORABLES; /* `IGNORABLES */
    list = Field(list, 1);
  }
  return result;
}

