/* GENERATED CODE - DO NOT EDIT */
/* cairo enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <cairo-gobject.h>
/* Convert cairo_status_t to OCaml value */
value Val_cairoStatus(cairo_status_t val) {
  switch (val) {
    case CAIRO_STATUS_SUCCESS: return caml_hash_variant("SUCCESS"); /* `SUCCESS */
    case CAIRO_STATUS_NO_MEMORY: return caml_hash_variant("NO_MEMORY"); /* `NO_MEMORY */
    case CAIRO_STATUS_INVALID_RESTORE: return caml_hash_variant("INVALID_RESTORE"); /* `INVALID_RESTORE */
    case CAIRO_STATUS_INVALID_POP_GROUP: return caml_hash_variant("INVALID_POP_GROUP"); /* `INVALID_POP_GROUP */
    case CAIRO_STATUS_NO_CURRENT_POINT: return caml_hash_variant("NO_CURRENT_POINT"); /* `NO_CURRENT_POINT */
    case CAIRO_STATUS_INVALID_MATRIX: return caml_hash_variant("INVALID_MATRIX"); /* `INVALID_MATRIX */
    case CAIRO_STATUS_INVALID_STATUS: return caml_hash_variant("INVALID_STATUS"); /* `INVALID_STATUS */
    case CAIRO_STATUS_NULL_POINTER: return caml_hash_variant("NULL_POINTER"); /* `NULL_POINTER */
    case CAIRO_STATUS_INVALID_STRING: return caml_hash_variant("INVALID_STRING"); /* `INVALID_STRING */
    case CAIRO_STATUS_INVALID_PATH_DATA: return caml_hash_variant("INVALID_PATH_DATA"); /* `INVALID_PATH_DATA */
    case CAIRO_STATUS_READ_ERROR: return caml_hash_variant("READ_ERROR"); /* `READ_ERROR */
    case CAIRO_STATUS_WRITE_ERROR: return caml_hash_variant("WRITE_ERROR"); /* `WRITE_ERROR */
    case CAIRO_STATUS_SURFACE_FINISHED: return caml_hash_variant("SURFACE_FINISHED"); /* `SURFACE_FINISHED */
    case CAIRO_STATUS_SURFACE_TYPE_MISMATCH: return caml_hash_variant("SURFACE_TYPE_MISMATCH"); /* `SURFACE_TYPE_MISMATCH */
    case CAIRO_STATUS_PATTERN_TYPE_MISMATCH: return caml_hash_variant("PATTERN_TYPE_MISMATCH"); /* `PATTERN_TYPE_MISMATCH */
    case CAIRO_STATUS_INVALID_CONTENT: return caml_hash_variant("INVALID_CONTENT"); /* `INVALID_CONTENT */
    case CAIRO_STATUS_INVALID_FORMAT: return caml_hash_variant("INVALID_FORMAT"); /* `INVALID_FORMAT */
    case CAIRO_STATUS_INVALID_VISUAL: return caml_hash_variant("INVALID_VISUAL"); /* `INVALID_VISUAL */
    case CAIRO_STATUS_FILE_NOT_FOUND: return caml_hash_variant("FILE_NOT_FOUND"); /* `FILE_NOT_FOUND */
    case CAIRO_STATUS_INVALID_DASH: return caml_hash_variant("INVALID_DASH"); /* `INVALID_DASH */
    case CAIRO_STATUS_INVALID_DSC_COMMENT: return caml_hash_variant("INVALID_DSC_COMMENT"); /* `INVALID_DSC_COMMENT */
    case CAIRO_STATUS_INVALID_INDEX: return caml_hash_variant("INVALID_INDEX"); /* `INVALID_INDEX */
    case CAIRO_STATUS_CLIP_NOT_REPRESENTABLE: return caml_hash_variant("CLIP_NOT_REPRESENTABLE"); /* `CLIP_NOT_REPRESENTABLE */
    case CAIRO_STATUS_TEMP_FILE_ERROR: return caml_hash_variant("TEMP_FILE_ERROR"); /* `TEMP_FILE_ERROR */
    case CAIRO_STATUS_INVALID_STRIDE: return caml_hash_variant("INVALID_STRIDE"); /* `INVALID_STRIDE */
    case CAIRO_STATUS_FONT_TYPE_MISMATCH: return caml_hash_variant("FONT_TYPE_MISMATCH"); /* `FONT_TYPE_MISMATCH */
    case CAIRO_STATUS_USER_FONT_IMMUTABLE: return caml_hash_variant("USER_FONT_IMMUTABLE"); /* `USER_FONT_IMMUTABLE */
    case CAIRO_STATUS_USER_FONT_ERROR: return caml_hash_variant("USER_FONT_ERROR"); /* `USER_FONT_ERROR */
    case CAIRO_STATUS_NEGATIVE_COUNT: return caml_hash_variant("NEGATIVE_COUNT"); /* `NEGATIVE_COUNT */
    case CAIRO_STATUS_INVALID_CLUSTERS: return caml_hash_variant("INVALID_CLUSTERS"); /* `INVALID_CLUSTERS */
    case CAIRO_STATUS_INVALID_SLANT: return caml_hash_variant("INVALID_SLANT"); /* `INVALID_SLANT */
    case CAIRO_STATUS_INVALID_WEIGHT: return caml_hash_variant("INVALID_WEIGHT"); /* `INVALID_WEIGHT */
    case CAIRO_STATUS_INVALID_SIZE: return caml_hash_variant("INVALID_SIZE"); /* `INVALID_SIZE */
    case CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED: return caml_hash_variant("USER_FONT_NOT_IMPLEMENTED"); /* `USER_FONT_NOT_IMPLEMENTED */
    case CAIRO_STATUS_DEVICE_TYPE_MISMATCH: return caml_hash_variant("DEVICE_TYPE_MISMATCH"); /* `DEVICE_TYPE_MISMATCH */
    case CAIRO_STATUS_DEVICE_ERROR: return caml_hash_variant("DEVICE_ERROR"); /* `DEVICE_ERROR */
    case CAIRO_STATUS_INVALID_MESH_CONSTRUCTION: return caml_hash_variant("INVALID_MESH_CONSTRUCTION"); /* `INVALID_MESH_CONSTRUCTION */
    case CAIRO_STATUS_DEVICE_FINISHED: return caml_hash_variant("DEVICE_FINISHED"); /* `DEVICE_FINISHED */
    case CAIRO_STATUS_JBIG2_GLOBAL_MISSING: return caml_hash_variant("JBIG2_GLOBAL_MISSING"); /* `JBIG2_GLOBAL_MISSING */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_status_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_status_t */
cairo_status_t cairoStatus_val(value val) {
  if (val == caml_hash_variant("SUCCESS")) return CAIRO_STATUS_SUCCESS; /* `SUCCESS */
  else if (val == caml_hash_variant("NO_MEMORY")) return CAIRO_STATUS_NO_MEMORY; /* `NO_MEMORY */
  else if (val == caml_hash_variant("INVALID_RESTORE")) return CAIRO_STATUS_INVALID_RESTORE; /* `INVALID_RESTORE */
  else if (val == caml_hash_variant("INVALID_POP_GROUP")) return CAIRO_STATUS_INVALID_POP_GROUP; /* `INVALID_POP_GROUP */
  else if (val == caml_hash_variant("NO_CURRENT_POINT")) return CAIRO_STATUS_NO_CURRENT_POINT; /* `NO_CURRENT_POINT */
  else if (val == caml_hash_variant("INVALID_MATRIX")) return CAIRO_STATUS_INVALID_MATRIX; /* `INVALID_MATRIX */
  else if (val == caml_hash_variant("INVALID_STATUS")) return CAIRO_STATUS_INVALID_STATUS; /* `INVALID_STATUS */
  else if (val == caml_hash_variant("NULL_POINTER")) return CAIRO_STATUS_NULL_POINTER; /* `NULL_POINTER */
  else if (val == caml_hash_variant("INVALID_STRING")) return CAIRO_STATUS_INVALID_STRING; /* `INVALID_STRING */
  else if (val == caml_hash_variant("INVALID_PATH_DATA")) return CAIRO_STATUS_INVALID_PATH_DATA; /* `INVALID_PATH_DATA */
  else if (val == caml_hash_variant("READ_ERROR")) return CAIRO_STATUS_READ_ERROR; /* `READ_ERROR */
  else if (val == caml_hash_variant("WRITE_ERROR")) return CAIRO_STATUS_WRITE_ERROR; /* `WRITE_ERROR */
  else if (val == caml_hash_variant("SURFACE_FINISHED")) return CAIRO_STATUS_SURFACE_FINISHED; /* `SURFACE_FINISHED */
  else if (val == caml_hash_variant("SURFACE_TYPE_MISMATCH")) return CAIRO_STATUS_SURFACE_TYPE_MISMATCH; /* `SURFACE_TYPE_MISMATCH */
  else if (val == caml_hash_variant("PATTERN_TYPE_MISMATCH")) return CAIRO_STATUS_PATTERN_TYPE_MISMATCH; /* `PATTERN_TYPE_MISMATCH */
  else if (val == caml_hash_variant("INVALID_CONTENT")) return CAIRO_STATUS_INVALID_CONTENT; /* `INVALID_CONTENT */
  else if (val == caml_hash_variant("INVALID_FORMAT")) return CAIRO_STATUS_INVALID_FORMAT; /* `INVALID_FORMAT */
  else if (val == caml_hash_variant("INVALID_VISUAL")) return CAIRO_STATUS_INVALID_VISUAL; /* `INVALID_VISUAL */
  else if (val == caml_hash_variant("FILE_NOT_FOUND")) return CAIRO_STATUS_FILE_NOT_FOUND; /* `FILE_NOT_FOUND */
  else if (val == caml_hash_variant("INVALID_DASH")) return CAIRO_STATUS_INVALID_DASH; /* `INVALID_DASH */
  else if (val == caml_hash_variant("INVALID_DSC_COMMENT")) return CAIRO_STATUS_INVALID_DSC_COMMENT; /* `INVALID_DSC_COMMENT */
  else if (val == caml_hash_variant("INVALID_INDEX")) return CAIRO_STATUS_INVALID_INDEX; /* `INVALID_INDEX */
  else if (val == caml_hash_variant("CLIP_NOT_REPRESENTABLE")) return CAIRO_STATUS_CLIP_NOT_REPRESENTABLE; /* `CLIP_NOT_REPRESENTABLE */
  else if (val == caml_hash_variant("TEMP_FILE_ERROR")) return CAIRO_STATUS_TEMP_FILE_ERROR; /* `TEMP_FILE_ERROR */
  else if (val == caml_hash_variant("INVALID_STRIDE")) return CAIRO_STATUS_INVALID_STRIDE; /* `INVALID_STRIDE */
  else if (val == caml_hash_variant("FONT_TYPE_MISMATCH")) return CAIRO_STATUS_FONT_TYPE_MISMATCH; /* `FONT_TYPE_MISMATCH */
  else if (val == caml_hash_variant("USER_FONT_IMMUTABLE")) return CAIRO_STATUS_USER_FONT_IMMUTABLE; /* `USER_FONT_IMMUTABLE */
  else if (val == caml_hash_variant("USER_FONT_ERROR")) return CAIRO_STATUS_USER_FONT_ERROR; /* `USER_FONT_ERROR */
  else if (val == caml_hash_variant("NEGATIVE_COUNT")) return CAIRO_STATUS_NEGATIVE_COUNT; /* `NEGATIVE_COUNT */
  else if (val == caml_hash_variant("INVALID_CLUSTERS")) return CAIRO_STATUS_INVALID_CLUSTERS; /* `INVALID_CLUSTERS */
  else if (val == caml_hash_variant("INVALID_SLANT")) return CAIRO_STATUS_INVALID_SLANT; /* `INVALID_SLANT */
  else if (val == caml_hash_variant("INVALID_WEIGHT")) return CAIRO_STATUS_INVALID_WEIGHT; /* `INVALID_WEIGHT */
  else if (val == caml_hash_variant("INVALID_SIZE")) return CAIRO_STATUS_INVALID_SIZE; /* `INVALID_SIZE */
  else if (val == caml_hash_variant("USER_FONT_NOT_IMPLEMENTED")) return CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED; /* `USER_FONT_NOT_IMPLEMENTED */
  else if (val == caml_hash_variant("DEVICE_TYPE_MISMATCH")) return CAIRO_STATUS_DEVICE_TYPE_MISMATCH; /* `DEVICE_TYPE_MISMATCH */
  else if (val == caml_hash_variant("DEVICE_ERROR")) return CAIRO_STATUS_DEVICE_ERROR; /* `DEVICE_ERROR */
  else if (val == caml_hash_variant("INVALID_MESH_CONSTRUCTION")) return CAIRO_STATUS_INVALID_MESH_CONSTRUCTION; /* `INVALID_MESH_CONSTRUCTION */
  else if (val == caml_hash_variant("DEVICE_FINISHED")) return CAIRO_STATUS_DEVICE_FINISHED; /* `DEVICE_FINISHED */
  else if (val == caml_hash_variant("JBIG2_GLOBAL_MISSING")) return CAIRO_STATUS_JBIG2_GLOBAL_MISSING; /* `JBIG2_GLOBAL_MISSING */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_status_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_content_t to OCaml value */
value Val_cairoContent(cairo_content_t val) {
  switch (val) {
    case CAIRO_CONTENT_COLOR: return caml_hash_variant("COLOR"); /* `COLOR */
    case CAIRO_CONTENT_ALPHA: return caml_hash_variant("ALPHA"); /* `ALPHA */
    case CAIRO_CONTENT_COLOR_ALPHA: return caml_hash_variant("COLOR_ALPHA"); /* `COLOR_ALPHA */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_content_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_content_t */
cairo_content_t cairoContent_val(value val) {
  if (val == caml_hash_variant("COLOR")) return CAIRO_CONTENT_COLOR; /* `COLOR */
  else if (val == caml_hash_variant("ALPHA")) return CAIRO_CONTENT_ALPHA; /* `ALPHA */
  else if (val == caml_hash_variant("COLOR_ALPHA")) return CAIRO_CONTENT_COLOR_ALPHA; /* `COLOR_ALPHA */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_content_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_operator_t to OCaml value */
value Val_cairoOperator(cairo_operator_t val) {
  switch (val) {
    case CAIRO_OPERATOR_CLEAR: return caml_hash_variant("CLEAR"); /* `CLEAR */
    case CAIRO_OPERATOR_SOURCE: return caml_hash_variant("SOURCE"); /* `SOURCE */
    case CAIRO_OPERATOR_OVER: return caml_hash_variant("OVER"); /* `OVER */
    case CAIRO_OPERATOR_IN: return caml_hash_variant("IN"); /* `IN */
    case CAIRO_OPERATOR_OUT: return caml_hash_variant("OUT"); /* `OUT */
    case CAIRO_OPERATOR_ATOP: return caml_hash_variant("ATOP"); /* `ATOP */
    case CAIRO_OPERATOR_DEST: return caml_hash_variant("DEST"); /* `DEST */
    case CAIRO_OPERATOR_DEST_OVER: return caml_hash_variant("DEST_OVER"); /* `DEST_OVER */
    case CAIRO_OPERATOR_DEST_IN: return caml_hash_variant("DEST_IN"); /* `DEST_IN */
    case CAIRO_OPERATOR_DEST_OUT: return caml_hash_variant("DEST_OUT"); /* `DEST_OUT */
    case CAIRO_OPERATOR_DEST_ATOP: return caml_hash_variant("DEST_ATOP"); /* `DEST_ATOP */
    case CAIRO_OPERATOR_XOR: return caml_hash_variant("XOR"); /* `XOR */
    case CAIRO_OPERATOR_ADD: return caml_hash_variant("ADD"); /* `ADD */
    case CAIRO_OPERATOR_SATURATE: return caml_hash_variant("SATURATE"); /* `SATURATE */
    case CAIRO_OPERATOR_MULTIPLY: return caml_hash_variant("MULTIPLY"); /* `MULTIPLY */
    case CAIRO_OPERATOR_SCREEN: return caml_hash_variant("SCREEN"); /* `SCREEN */
    case CAIRO_OPERATOR_OVERLAY: return caml_hash_variant("OVERLAY"); /* `OVERLAY */
    case CAIRO_OPERATOR_DARKEN: return caml_hash_variant("DARKEN"); /* `DARKEN */
    case CAIRO_OPERATOR_LIGHTEN: return caml_hash_variant("LIGHTEN"); /* `LIGHTEN */
    case CAIRO_OPERATOR_COLOR_DODGE: return caml_hash_variant("COLOR_DODGE"); /* `COLOR_DODGE */
    case CAIRO_OPERATOR_COLOR_BURN: return caml_hash_variant("COLOR_BURN"); /* `COLOR_BURN */
    case CAIRO_OPERATOR_HARD_LIGHT: return caml_hash_variant("HARD_LIGHT"); /* `HARD_LIGHT */
    case CAIRO_OPERATOR_SOFT_LIGHT: return caml_hash_variant("SOFT_LIGHT"); /* `SOFT_LIGHT */
    case CAIRO_OPERATOR_DIFFERENCE: return caml_hash_variant("DIFFERENCE"); /* `DIFFERENCE */
    case CAIRO_OPERATOR_EXCLUSION: return caml_hash_variant("EXCLUSION"); /* `EXCLUSION */
    case CAIRO_OPERATOR_HSL_HUE: return caml_hash_variant("HSL_HUE"); /* `HSL_HUE */
    case CAIRO_OPERATOR_HSL_SATURATION: return caml_hash_variant("HSL_SATURATION"); /* `HSL_SATURATION */
    case CAIRO_OPERATOR_HSL_COLOR: return caml_hash_variant("HSL_COLOR"); /* `HSL_COLOR */
    case CAIRO_OPERATOR_HSL_LUMINOSITY: return caml_hash_variant("HSL_LUMINOSITY"); /* `HSL_LUMINOSITY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_operator_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_operator_t */
cairo_operator_t cairoOperator_val(value val) {
  if (val == caml_hash_variant("CLEAR")) return CAIRO_OPERATOR_CLEAR; /* `CLEAR */
  else if (val == caml_hash_variant("SOURCE")) return CAIRO_OPERATOR_SOURCE; /* `SOURCE */
  else if (val == caml_hash_variant("OVER")) return CAIRO_OPERATOR_OVER; /* `OVER */
  else if (val == caml_hash_variant("IN")) return CAIRO_OPERATOR_IN; /* `IN */
  else if (val == caml_hash_variant("OUT")) return CAIRO_OPERATOR_OUT; /* `OUT */
  else if (val == caml_hash_variant("ATOP")) return CAIRO_OPERATOR_ATOP; /* `ATOP */
  else if (val == caml_hash_variant("DEST")) return CAIRO_OPERATOR_DEST; /* `DEST */
  else if (val == caml_hash_variant("DEST_OVER")) return CAIRO_OPERATOR_DEST_OVER; /* `DEST_OVER */
  else if (val == caml_hash_variant("DEST_IN")) return CAIRO_OPERATOR_DEST_IN; /* `DEST_IN */
  else if (val == caml_hash_variant("DEST_OUT")) return CAIRO_OPERATOR_DEST_OUT; /* `DEST_OUT */
  else if (val == caml_hash_variant("DEST_ATOP")) return CAIRO_OPERATOR_DEST_ATOP; /* `DEST_ATOP */
  else if (val == caml_hash_variant("XOR")) return CAIRO_OPERATOR_XOR; /* `XOR */
  else if (val == caml_hash_variant("ADD")) return CAIRO_OPERATOR_ADD; /* `ADD */
  else if (val == caml_hash_variant("SATURATE")) return CAIRO_OPERATOR_SATURATE; /* `SATURATE */
  else if (val == caml_hash_variant("MULTIPLY")) return CAIRO_OPERATOR_MULTIPLY; /* `MULTIPLY */
  else if (val == caml_hash_variant("SCREEN")) return CAIRO_OPERATOR_SCREEN; /* `SCREEN */
  else if (val == caml_hash_variant("OVERLAY")) return CAIRO_OPERATOR_OVERLAY; /* `OVERLAY */
  else if (val == caml_hash_variant("DARKEN")) return CAIRO_OPERATOR_DARKEN; /* `DARKEN */
  else if (val == caml_hash_variant("LIGHTEN")) return CAIRO_OPERATOR_LIGHTEN; /* `LIGHTEN */
  else if (val == caml_hash_variant("COLOR_DODGE")) return CAIRO_OPERATOR_COLOR_DODGE; /* `COLOR_DODGE */
  else if (val == caml_hash_variant("COLOR_BURN")) return CAIRO_OPERATOR_COLOR_BURN; /* `COLOR_BURN */
  else if (val == caml_hash_variant("HARD_LIGHT")) return CAIRO_OPERATOR_HARD_LIGHT; /* `HARD_LIGHT */
  else if (val == caml_hash_variant("SOFT_LIGHT")) return CAIRO_OPERATOR_SOFT_LIGHT; /* `SOFT_LIGHT */
  else if (val == caml_hash_variant("DIFFERENCE")) return CAIRO_OPERATOR_DIFFERENCE; /* `DIFFERENCE */
  else if (val == caml_hash_variant("EXCLUSION")) return CAIRO_OPERATOR_EXCLUSION; /* `EXCLUSION */
  else if (val == caml_hash_variant("HSL_HUE")) return CAIRO_OPERATOR_HSL_HUE; /* `HSL_HUE */
  else if (val == caml_hash_variant("HSL_SATURATION")) return CAIRO_OPERATOR_HSL_SATURATION; /* `HSL_SATURATION */
  else if (val == caml_hash_variant("HSL_COLOR")) return CAIRO_OPERATOR_HSL_COLOR; /* `HSL_COLOR */
  else if (val == caml_hash_variant("HSL_LUMINOSITY")) return CAIRO_OPERATOR_HSL_LUMINOSITY; /* `HSL_LUMINOSITY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_operator_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_antialias_t to OCaml value */
value Val_cairoAntialias(cairo_antialias_t val) {
  switch (val) {
    case CAIRO_ANTIALIAS_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case CAIRO_ANTIALIAS_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case CAIRO_ANTIALIAS_GRAY: return caml_hash_variant("GRAY"); /* `GRAY */
    case CAIRO_ANTIALIAS_SUBPIXEL: return caml_hash_variant("SUBPIXEL"); /* `SUBPIXEL */
    case CAIRO_ANTIALIAS_FAST: return caml_hash_variant("FAST"); /* `FAST */
    case CAIRO_ANTIALIAS_GOOD: return caml_hash_variant("GOOD"); /* `GOOD */
    case CAIRO_ANTIALIAS_BEST: return caml_hash_variant("BEST"); /* `BEST */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_antialias_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_antialias_t */
cairo_antialias_t cairoAntialias_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return CAIRO_ANTIALIAS_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("NONE")) return CAIRO_ANTIALIAS_NONE; /* `NONE */
  else if (val == caml_hash_variant("GRAY")) return CAIRO_ANTIALIAS_GRAY; /* `GRAY */
  else if (val == caml_hash_variant("SUBPIXEL")) return CAIRO_ANTIALIAS_SUBPIXEL; /* `SUBPIXEL */
  else if (val == caml_hash_variant("FAST")) return CAIRO_ANTIALIAS_FAST; /* `FAST */
  else if (val == caml_hash_variant("GOOD")) return CAIRO_ANTIALIAS_GOOD; /* `GOOD */
  else if (val == caml_hash_variant("BEST")) return CAIRO_ANTIALIAS_BEST; /* `BEST */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_antialias_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_fill_rule_t to OCaml value */
value Val_cairoFillRule(cairo_fill_rule_t val) {
  switch (val) {
    case CAIRO_FILL_RULE_WINDING: return caml_hash_variant("WINDING"); /* `WINDING */
    case CAIRO_FILL_RULE_EVEN_ODD: return caml_hash_variant("EVEN_ODD"); /* `EVEN_ODD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_fill_rule_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_fill_rule_t */
cairo_fill_rule_t cairoFillRule_val(value val) {
  if (val == caml_hash_variant("WINDING")) return CAIRO_FILL_RULE_WINDING; /* `WINDING */
  else if (val == caml_hash_variant("EVEN_ODD")) return CAIRO_FILL_RULE_EVEN_ODD; /* `EVEN_ODD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_fill_rule_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_line_cap_t to OCaml value */
value Val_cairoLineCap(cairo_line_cap_t val) {
  switch (val) {
    case CAIRO_LINE_CAP_BUTT: return caml_hash_variant("BUTT"); /* `BUTT */
    case CAIRO_LINE_CAP_ROUND: return caml_hash_variant("ROUND"); /* `ROUND */
    case CAIRO_LINE_CAP_SQUARE: return caml_hash_variant("SQUARE"); /* `SQUARE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_line_cap_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_line_cap_t */
cairo_line_cap_t cairoLineCap_val(value val) {
  if (val == caml_hash_variant("BUTT")) return CAIRO_LINE_CAP_BUTT; /* `BUTT */
  else if (val == caml_hash_variant("ROUND")) return CAIRO_LINE_CAP_ROUND; /* `ROUND */
  else if (val == caml_hash_variant("SQUARE")) return CAIRO_LINE_CAP_SQUARE; /* `SQUARE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_line_cap_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_line_join_t to OCaml value */
value Val_cairoLineJoin(cairo_line_join_t val) {
  switch (val) {
    case CAIRO_LINE_JOIN_MITER: return caml_hash_variant("MITER"); /* `MITER */
    case CAIRO_LINE_JOIN_ROUND: return caml_hash_variant("ROUND"); /* `ROUND */
    case CAIRO_LINE_JOIN_BEVEL: return caml_hash_variant("BEVEL"); /* `BEVEL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_line_join_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_line_join_t */
cairo_line_join_t cairoLineJoin_val(value val) {
  if (val == caml_hash_variant("MITER")) return CAIRO_LINE_JOIN_MITER; /* `MITER */
  else if (val == caml_hash_variant("ROUND")) return CAIRO_LINE_JOIN_ROUND; /* `ROUND */
  else if (val == caml_hash_variant("BEVEL")) return CAIRO_LINE_JOIN_BEVEL; /* `BEVEL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_line_join_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_text_cluster_flags_t to OCaml value */
value Val_cairoTextClusterFlags(cairo_text_cluster_flags_t val) {
  switch (val) {
    case CAIRO_TEXT_CLUSTER_FLAG_BACKWARD: return caml_hash_variant("BACKWARD"); /* `BACKWARD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_text_cluster_flags_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_text_cluster_flags_t */
cairo_text_cluster_flags_t cairoTextClusterFlags_val(value val) {
  if (val == caml_hash_variant("BACKWARD")) return CAIRO_TEXT_CLUSTER_FLAG_BACKWARD; /* `BACKWARD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_text_cluster_flags_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_font_slant_t to OCaml value */
value Val_cairoFontSlant(cairo_font_slant_t val) {
  switch (val) {
    case CAIRO_FONT_SLANT_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case CAIRO_FONT_SLANT_ITALIC: return caml_hash_variant("ITALIC"); /* `ITALIC */
    case CAIRO_FONT_SLANT_OBLIQUE: return caml_hash_variant("OBLIQUE"); /* `OBLIQUE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_font_slant_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_font_slant_t */
cairo_font_slant_t cairoFontSlant_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return CAIRO_FONT_SLANT_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("ITALIC")) return CAIRO_FONT_SLANT_ITALIC; /* `ITALIC */
  else if (val == caml_hash_variant("OBLIQUE")) return CAIRO_FONT_SLANT_OBLIQUE; /* `OBLIQUE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_font_slant_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_font_weight_t to OCaml value */
value Val_cairoFontWeight(cairo_font_weight_t val) {
  switch (val) {
    case CAIRO_FONT_WEIGHT_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case CAIRO_FONT_WEIGHT_BOLD: return caml_hash_variant("BOLD"); /* `BOLD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_font_weight_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_font_weight_t */
cairo_font_weight_t cairoFontWeight_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return CAIRO_FONT_WEIGHT_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("BOLD")) return CAIRO_FONT_WEIGHT_BOLD; /* `BOLD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_font_weight_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_subpixel_order_t to OCaml value */
value Val_cairoSubpixelOrder(cairo_subpixel_order_t val) {
  switch (val) {
    case CAIRO_SUBPIXEL_ORDER_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case CAIRO_SUBPIXEL_ORDER_RGB: return caml_hash_variant("RGB"); /* `RGB */
    case CAIRO_SUBPIXEL_ORDER_BGR: return caml_hash_variant("BGR"); /* `BGR */
    case CAIRO_SUBPIXEL_ORDER_VRGB: return caml_hash_variant("VRGB"); /* `VRGB */
    case CAIRO_SUBPIXEL_ORDER_VBGR: return caml_hash_variant("VBGR"); /* `VBGR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_subpixel_order_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_subpixel_order_t */
cairo_subpixel_order_t cairoSubpixelOrder_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return CAIRO_SUBPIXEL_ORDER_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("RGB")) return CAIRO_SUBPIXEL_ORDER_RGB; /* `RGB */
  else if (val == caml_hash_variant("BGR")) return CAIRO_SUBPIXEL_ORDER_BGR; /* `BGR */
  else if (val == caml_hash_variant("VRGB")) return CAIRO_SUBPIXEL_ORDER_VRGB; /* `VRGB */
  else if (val == caml_hash_variant("VBGR")) return CAIRO_SUBPIXEL_ORDER_VBGR; /* `VBGR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_subpixel_order_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_hint_style_t to OCaml value */
value Val_cairoHintStyle(cairo_hint_style_t val) {
  switch (val) {
    case CAIRO_HINT_STYLE_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case CAIRO_HINT_STYLE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case CAIRO_HINT_STYLE_SLIGHT: return caml_hash_variant("SLIGHT"); /* `SLIGHT */
    case CAIRO_HINT_STYLE_MEDIUM: return caml_hash_variant("MEDIUM"); /* `MEDIUM */
    case CAIRO_HINT_STYLE_FULL: return caml_hash_variant("FULL"); /* `FULL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_hint_style_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_hint_style_t */
cairo_hint_style_t cairoHintStyle_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return CAIRO_HINT_STYLE_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("NONE")) return CAIRO_HINT_STYLE_NONE; /* `NONE */
  else if (val == caml_hash_variant("SLIGHT")) return CAIRO_HINT_STYLE_SLIGHT; /* `SLIGHT */
  else if (val == caml_hash_variant("MEDIUM")) return CAIRO_HINT_STYLE_MEDIUM; /* `MEDIUM */
  else if (val == caml_hash_variant("FULL")) return CAIRO_HINT_STYLE_FULL; /* `FULL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_hint_style_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_hint_metrics_t to OCaml value */
value Val_cairoHintMetrics(cairo_hint_metrics_t val) {
  switch (val) {
    case CAIRO_HINT_METRICS_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case CAIRO_HINT_METRICS_OFF: return caml_hash_variant("OFF"); /* `OFF */
    case CAIRO_HINT_METRICS_ON: return caml_hash_variant("ON"); /* `ON */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_hint_metrics_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_hint_metrics_t */
cairo_hint_metrics_t cairoHintMetrics_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return CAIRO_HINT_METRICS_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("OFF")) return CAIRO_HINT_METRICS_OFF; /* `OFF */
  else if (val == caml_hash_variant("ON")) return CAIRO_HINT_METRICS_ON; /* `ON */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_hint_metrics_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_font_type_t to OCaml value */
value Val_cairoFontType(cairo_font_type_t val) {
  switch (val) {
    case CAIRO_FONT_TYPE_TOY: return caml_hash_variant("TOY"); /* `TOY */
    case CAIRO_FONT_TYPE_FT: return caml_hash_variant("FT"); /* `FT */
    case CAIRO_FONT_TYPE_WIN32: return caml_hash_variant("WIN32"); /* `WIN32 */
    case CAIRO_FONT_TYPE_QUARTZ: return caml_hash_variant("QUARTZ"); /* `QUARTZ */
    case CAIRO_FONT_TYPE_USER: return caml_hash_variant("USER"); /* `USER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_font_type_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_font_type_t */
cairo_font_type_t cairoFontType_val(value val) {
  if (val == caml_hash_variant("TOY")) return CAIRO_FONT_TYPE_TOY; /* `TOY */
  else if (val == caml_hash_variant("FT")) return CAIRO_FONT_TYPE_FT; /* `FT */
  else if (val == caml_hash_variant("WIN32")) return CAIRO_FONT_TYPE_WIN32; /* `WIN32 */
  else if (val == caml_hash_variant("QUARTZ")) return CAIRO_FONT_TYPE_QUARTZ; /* `QUARTZ */
  else if (val == caml_hash_variant("USER")) return CAIRO_FONT_TYPE_USER; /* `USER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_font_type_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_path_data_type_t to OCaml value */
value Val_cairoPathDataType(cairo_path_data_type_t val) {
  switch (val) {
    case CAIRO_PATH_MOVE_TO: return caml_hash_variant("MOVE_TO"); /* `MOVE_TO */
    case CAIRO_PATH_LINE_TO: return caml_hash_variant("LINE_TO"); /* `LINE_TO */
    case CAIRO_PATH_CURVE_TO: return caml_hash_variant("CURVE_TO"); /* `CURVE_TO */
    case CAIRO_PATH_CLOSE_PATH: return caml_hash_variant("CLOSE_PATH"); /* `CLOSE_PATH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_path_data_type_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_path_data_type_t */
cairo_path_data_type_t cairoPathDataType_val(value val) {
  if (val == caml_hash_variant("MOVE_TO")) return CAIRO_PATH_MOVE_TO; /* `MOVE_TO */
  else if (val == caml_hash_variant("LINE_TO")) return CAIRO_PATH_LINE_TO; /* `LINE_TO */
  else if (val == caml_hash_variant("CURVE_TO")) return CAIRO_PATH_CURVE_TO; /* `CURVE_TO */
  else if (val == caml_hash_variant("CLOSE_PATH")) return CAIRO_PATH_CLOSE_PATH; /* `CLOSE_PATH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_path_data_type_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_device_type_t to OCaml value */
value Val_cairoDeviceType(cairo_device_type_t val) {
  switch (val) {
    case CAIRO_DEVICE_TYPE_DRM: return caml_hash_variant("DRM"); /* `DRM */
    case CAIRO_DEVICE_TYPE_GL: return caml_hash_variant("GL"); /* `GL */
    case CAIRO_DEVICE_TYPE_SCRIPT: return caml_hash_variant("SCRIPT"); /* `SCRIPT */
    case CAIRO_DEVICE_TYPE_XCB: return caml_hash_variant("XCB"); /* `XCB */
    case CAIRO_DEVICE_TYPE_XLIB: return caml_hash_variant("XLIB"); /* `XLIB */
    case CAIRO_DEVICE_TYPE_XML: return caml_hash_variant("XML"); /* `XML */
    case CAIRO_DEVICE_TYPE_COGL: return caml_hash_variant("COGL"); /* `COGL */
    case CAIRO_DEVICE_TYPE_WIN32: return caml_hash_variant("WIN32"); /* `WIN32 */
    case CAIRO_DEVICE_TYPE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_device_type_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_device_type_t */
cairo_device_type_t cairoDeviceType_val(value val) {
  if (val == caml_hash_variant("DRM")) return CAIRO_DEVICE_TYPE_DRM; /* `DRM */
  else if (val == caml_hash_variant("GL")) return CAIRO_DEVICE_TYPE_GL; /* `GL */
  else if (val == caml_hash_variant("SCRIPT")) return CAIRO_DEVICE_TYPE_SCRIPT; /* `SCRIPT */
  else if (val == caml_hash_variant("XCB")) return CAIRO_DEVICE_TYPE_XCB; /* `XCB */
  else if (val == caml_hash_variant("XLIB")) return CAIRO_DEVICE_TYPE_XLIB; /* `XLIB */
  else if (val == caml_hash_variant("XML")) return CAIRO_DEVICE_TYPE_XML; /* `XML */
  else if (val == caml_hash_variant("COGL")) return CAIRO_DEVICE_TYPE_COGL; /* `COGL */
  else if (val == caml_hash_variant("WIN32")) return CAIRO_DEVICE_TYPE_WIN32; /* `WIN32 */
  else if (val == caml_hash_variant("INVALID")) return CAIRO_DEVICE_TYPE_INVALID; /* `INVALID */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_device_type_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_surface_type_t to OCaml value */
value Val_cairoSurfaceType(cairo_surface_type_t val) {
  switch (val) {
    case CAIRO_SURFACE_TYPE_IMAGE: return caml_hash_variant("IMAGE"); /* `IMAGE */
    case CAIRO_SURFACE_TYPE_PDF: return caml_hash_variant("PDF"); /* `PDF */
    case CAIRO_SURFACE_TYPE_PS: return caml_hash_variant("PS"); /* `PS */
    case CAIRO_SURFACE_TYPE_XLIB: return caml_hash_variant("XLIB"); /* `XLIB */
    case CAIRO_SURFACE_TYPE_XCB: return caml_hash_variant("XCB"); /* `XCB */
    case CAIRO_SURFACE_TYPE_GLITZ: return caml_hash_variant("GLITZ"); /* `GLITZ */
    case CAIRO_SURFACE_TYPE_QUARTZ: return caml_hash_variant("QUARTZ"); /* `QUARTZ */
    case CAIRO_SURFACE_TYPE_WIN32: return caml_hash_variant("WIN32"); /* `WIN32 */
    case CAIRO_SURFACE_TYPE_BEOS: return caml_hash_variant("BEOS"); /* `BEOS */
    case CAIRO_SURFACE_TYPE_DIRECTFB: return caml_hash_variant("DIRECTFB"); /* `DIRECTFB */
    case CAIRO_SURFACE_TYPE_SVG: return caml_hash_variant("SVG"); /* `SVG */
    case CAIRO_SURFACE_TYPE_OS2: return caml_hash_variant("OS2"); /* `OS2 */
    case CAIRO_SURFACE_TYPE_WIN32_PRINTING: return caml_hash_variant("WIN32_PRINTING"); /* `WIN32_PRINTING */
    case CAIRO_SURFACE_TYPE_QUARTZ_IMAGE: return caml_hash_variant("QUARTZ_IMAGE"); /* `QUARTZ_IMAGE */
    case CAIRO_SURFACE_TYPE_SCRIPT: return caml_hash_variant("SCRIPT"); /* `SCRIPT */
    case CAIRO_SURFACE_TYPE_QT: return caml_hash_variant("QT"); /* `QT */
    case CAIRO_SURFACE_TYPE_RECORDING: return caml_hash_variant("RECORDING"); /* `RECORDING */
    case CAIRO_SURFACE_TYPE_VG: return caml_hash_variant("VG"); /* `VG */
    case CAIRO_SURFACE_TYPE_GL: return caml_hash_variant("GL"); /* `GL */
    case CAIRO_SURFACE_TYPE_DRM: return caml_hash_variant("DRM"); /* `DRM */
    case CAIRO_SURFACE_TYPE_TEE: return caml_hash_variant("TEE"); /* `TEE */
    case CAIRO_SURFACE_TYPE_XML: return caml_hash_variant("XML"); /* `XML */
    case CAIRO_SURFACE_TYPE_SKIA: return caml_hash_variant("SKIA"); /* `SKIA */
    case CAIRO_SURFACE_TYPE_SUBSURFACE: return caml_hash_variant("SUBSURFACE"); /* `SUBSURFACE */
    case CAIRO_SURFACE_TYPE_COGL: return caml_hash_variant("COGL"); /* `COGL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_surface_type_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_surface_type_t */
cairo_surface_type_t cairoSurfaceType_val(value val) {
  if (val == caml_hash_variant("IMAGE")) return CAIRO_SURFACE_TYPE_IMAGE; /* `IMAGE */
  else if (val == caml_hash_variant("PDF")) return CAIRO_SURFACE_TYPE_PDF; /* `PDF */
  else if (val == caml_hash_variant("PS")) return CAIRO_SURFACE_TYPE_PS; /* `PS */
  else if (val == caml_hash_variant("XLIB")) return CAIRO_SURFACE_TYPE_XLIB; /* `XLIB */
  else if (val == caml_hash_variant("XCB")) return CAIRO_SURFACE_TYPE_XCB; /* `XCB */
  else if (val == caml_hash_variant("GLITZ")) return CAIRO_SURFACE_TYPE_GLITZ; /* `GLITZ */
  else if (val == caml_hash_variant("QUARTZ")) return CAIRO_SURFACE_TYPE_QUARTZ; /* `QUARTZ */
  else if (val == caml_hash_variant("WIN32")) return CAIRO_SURFACE_TYPE_WIN32; /* `WIN32 */
  else if (val == caml_hash_variant("BEOS")) return CAIRO_SURFACE_TYPE_BEOS; /* `BEOS */
  else if (val == caml_hash_variant("DIRECTFB")) return CAIRO_SURFACE_TYPE_DIRECTFB; /* `DIRECTFB */
  else if (val == caml_hash_variant("SVG")) return CAIRO_SURFACE_TYPE_SVG; /* `SVG */
  else if (val == caml_hash_variant("OS2")) return CAIRO_SURFACE_TYPE_OS2; /* `OS2 */
  else if (val == caml_hash_variant("WIN32_PRINTING")) return CAIRO_SURFACE_TYPE_WIN32_PRINTING; /* `WIN32_PRINTING */
  else if (val == caml_hash_variant("QUARTZ_IMAGE")) return CAIRO_SURFACE_TYPE_QUARTZ_IMAGE; /* `QUARTZ_IMAGE */
  else if (val == caml_hash_variant("SCRIPT")) return CAIRO_SURFACE_TYPE_SCRIPT; /* `SCRIPT */
  else if (val == caml_hash_variant("QT")) return CAIRO_SURFACE_TYPE_QT; /* `QT */
  else if (val == caml_hash_variant("RECORDING")) return CAIRO_SURFACE_TYPE_RECORDING; /* `RECORDING */
  else if (val == caml_hash_variant("VG")) return CAIRO_SURFACE_TYPE_VG; /* `VG */
  else if (val == caml_hash_variant("GL")) return CAIRO_SURFACE_TYPE_GL; /* `GL */
  else if (val == caml_hash_variant("DRM")) return CAIRO_SURFACE_TYPE_DRM; /* `DRM */
  else if (val == caml_hash_variant("TEE")) return CAIRO_SURFACE_TYPE_TEE; /* `TEE */
  else if (val == caml_hash_variant("XML")) return CAIRO_SURFACE_TYPE_XML; /* `XML */
  else if (val == caml_hash_variant("SKIA")) return CAIRO_SURFACE_TYPE_SKIA; /* `SKIA */
  else if (val == caml_hash_variant("SUBSURFACE")) return CAIRO_SURFACE_TYPE_SUBSURFACE; /* `SUBSURFACE */
  else if (val == caml_hash_variant("COGL")) return CAIRO_SURFACE_TYPE_COGL; /* `COGL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_surface_type_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_format_t to OCaml value */
value Val_cairoFormat(cairo_format_t val) {
  switch (val) {
    case CAIRO_FORMAT_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case CAIRO_FORMAT_ARGB32: return caml_hash_variant("ARGB32"); /* `ARGB32 */
    case CAIRO_FORMAT_RGB24: return caml_hash_variant("RGB24"); /* `RGB24 */
    case CAIRO_FORMAT_A8: return caml_hash_variant("A8"); /* `A8 */
    case CAIRO_FORMAT_A1: return caml_hash_variant("A1"); /* `A1 */
    case CAIRO_FORMAT_RGB16_565: return caml_hash_variant("RGB16_565"); /* `RGB16_565 */
    case CAIRO_FORMAT_RGB30: return caml_hash_variant("RGB30"); /* `RGB30 */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_format_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_format_t */
cairo_format_t cairoFormat_val(value val) {
  if (val == caml_hash_variant("INVALID")) return CAIRO_FORMAT_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("ARGB32")) return CAIRO_FORMAT_ARGB32; /* `ARGB32 */
  else if (val == caml_hash_variant("RGB24")) return CAIRO_FORMAT_RGB24; /* `RGB24 */
  else if (val == caml_hash_variant("A8")) return CAIRO_FORMAT_A8; /* `A8 */
  else if (val == caml_hash_variant("A1")) return CAIRO_FORMAT_A1; /* `A1 */
  else if (val == caml_hash_variant("RGB16_565")) return CAIRO_FORMAT_RGB16_565; /* `RGB16_565 */
  else if (val == caml_hash_variant("RGB30")) return CAIRO_FORMAT_RGB30; /* `RGB30 */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_format_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_pattern_type_t to OCaml value */
value Val_cairoPatternType(cairo_pattern_type_t val) {
  switch (val) {
    case CAIRO_PATTERN_TYPE_SOLID: return caml_hash_variant("SOLID"); /* `SOLID */
    case CAIRO_PATTERN_TYPE_SURFACE: return caml_hash_variant("SURFACE"); /* `SURFACE */
    case CAIRO_PATTERN_TYPE_LINEAR: return caml_hash_variant("LINEAR"); /* `LINEAR */
    case CAIRO_PATTERN_TYPE_RADIAL: return caml_hash_variant("RADIAL"); /* `RADIAL */
    case CAIRO_PATTERN_TYPE_MESH: return caml_hash_variant("MESH"); /* `MESH */
    case CAIRO_PATTERN_TYPE_RASTER_SOURCE: return caml_hash_variant("RASTER_SOURCE"); /* `RASTER_SOURCE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_pattern_type_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_pattern_type_t */
cairo_pattern_type_t cairoPatternType_val(value val) {
  if (val == caml_hash_variant("SOLID")) return CAIRO_PATTERN_TYPE_SOLID; /* `SOLID */
  else if (val == caml_hash_variant("SURFACE")) return CAIRO_PATTERN_TYPE_SURFACE; /* `SURFACE */
  else if (val == caml_hash_variant("LINEAR")) return CAIRO_PATTERN_TYPE_LINEAR; /* `LINEAR */
  else if (val == caml_hash_variant("RADIAL")) return CAIRO_PATTERN_TYPE_RADIAL; /* `RADIAL */
  else if (val == caml_hash_variant("MESH")) return CAIRO_PATTERN_TYPE_MESH; /* `MESH */
  else if (val == caml_hash_variant("RASTER_SOURCE")) return CAIRO_PATTERN_TYPE_RASTER_SOURCE; /* `RASTER_SOURCE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_pattern_type_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_extend_t to OCaml value */
value Val_cairoExtend(cairo_extend_t val) {
  switch (val) {
    case CAIRO_EXTEND_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case CAIRO_EXTEND_REPEAT: return caml_hash_variant("REPEAT"); /* `REPEAT */
    case CAIRO_EXTEND_REFLECT: return caml_hash_variant("REFLECT"); /* `REFLECT */
    case CAIRO_EXTEND_PAD: return caml_hash_variant("PAD"); /* `PAD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_extend_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_extend_t */
cairo_extend_t cairoExtend_val(value val) {
  if (val == caml_hash_variant("NONE")) return CAIRO_EXTEND_NONE; /* `NONE */
  else if (val == caml_hash_variant("REPEAT")) return CAIRO_EXTEND_REPEAT; /* `REPEAT */
  else if (val == caml_hash_variant("REFLECT")) return CAIRO_EXTEND_REFLECT; /* `REFLECT */
  else if (val == caml_hash_variant("PAD")) return CAIRO_EXTEND_PAD; /* `PAD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_extend_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_filter_t to OCaml value */
value Val_cairoFilter(cairo_filter_t val) {
  switch (val) {
    case CAIRO_FILTER_FAST: return caml_hash_variant("FAST"); /* `FAST */
    case CAIRO_FILTER_GOOD: return caml_hash_variant("GOOD"); /* `GOOD */
    case CAIRO_FILTER_BEST: return caml_hash_variant("BEST"); /* `BEST */
    case CAIRO_FILTER_NEAREST: return caml_hash_variant("NEAREST"); /* `NEAREST */
    case CAIRO_FILTER_BILINEAR: return caml_hash_variant("BILINEAR"); /* `BILINEAR */
    case CAIRO_FILTER_GAUSSIAN: return caml_hash_variant("GAUSSIAN"); /* `GAUSSIAN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_filter_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_filter_t */
cairo_filter_t cairoFilter_val(value val) {
  if (val == caml_hash_variant("FAST")) return CAIRO_FILTER_FAST; /* `FAST */
  else if (val == caml_hash_variant("GOOD")) return CAIRO_FILTER_GOOD; /* `GOOD */
  else if (val == caml_hash_variant("BEST")) return CAIRO_FILTER_BEST; /* `BEST */
  else if (val == caml_hash_variant("NEAREST")) return CAIRO_FILTER_NEAREST; /* `NEAREST */
  else if (val == caml_hash_variant("BILINEAR")) return CAIRO_FILTER_BILINEAR; /* `BILINEAR */
  else if (val == caml_hash_variant("GAUSSIAN")) return CAIRO_FILTER_GAUSSIAN; /* `GAUSSIAN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_filter_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert cairo_region_overlap_t to OCaml value */
value Val_cairoRegionOverlap(cairo_region_overlap_t val) {
  switch (val) {
    case CAIRO_REGION_OVERLAP_IN: return caml_hash_variant("IN"); /* `IN */
    case CAIRO_REGION_OVERLAP_OUT: return caml_hash_variant("OUT"); /* `OUT */
    case CAIRO_REGION_OVERLAP_PART: return caml_hash_variant("PART"); /* `PART */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown cairo_region_overlap_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to cairo_region_overlap_t */
cairo_region_overlap_t cairoRegionOverlap_val(value val) {
  if (val == caml_hash_variant("IN")) return CAIRO_REGION_OVERLAP_IN; /* `IN */
  else if (val == caml_hash_variant("OUT")) return CAIRO_REGION_OVERLAP_OUT; /* `OUT */
  else if (val == caml_hash_variant("PART")) return CAIRO_REGION_OVERLAP_PART; /* `PART */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown cairo_region_overlap_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

