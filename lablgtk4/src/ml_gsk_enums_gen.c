/* GENERATED CODE - DO NOT EDIT */
/* Gsk enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <gsk/gsk.h>
/* Convert GskBlendMode to OCaml value */
value Val_GskBlendMode(GskBlendMode val) {
  switch (val) {
    case GSK_BLEND_MODE_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case GSK_BLEND_MODE_MULTIPLY: return caml_hash_variant("MULTIPLY"); /* `MULTIPLY */
    case GSK_BLEND_MODE_SCREEN: return caml_hash_variant("SCREEN"); /* `SCREEN */
    case GSK_BLEND_MODE_OVERLAY: return caml_hash_variant("OVERLAY"); /* `OVERLAY */
    case GSK_BLEND_MODE_DARKEN: return caml_hash_variant("DARKEN"); /* `DARKEN */
    case GSK_BLEND_MODE_LIGHTEN: return caml_hash_variant("LIGHTEN"); /* `LIGHTEN */
    case GSK_BLEND_MODE_COLOR_DODGE: return caml_hash_variant("COLOR_DODGE"); /* `COLOR_DODGE */
    case GSK_BLEND_MODE_COLOR_BURN: return caml_hash_variant("COLOR_BURN"); /* `COLOR_BURN */
    case GSK_BLEND_MODE_HARD_LIGHT: return caml_hash_variant("HARD_LIGHT"); /* `HARD_LIGHT */
    case GSK_BLEND_MODE_SOFT_LIGHT: return caml_hash_variant("SOFT_LIGHT"); /* `SOFT_LIGHT */
    case GSK_BLEND_MODE_DIFFERENCE: return caml_hash_variant("DIFFERENCE"); /* `DIFFERENCE */
    case GSK_BLEND_MODE_EXCLUSION: return caml_hash_variant("EXCLUSION"); /* `EXCLUSION */
    case GSK_BLEND_MODE_COLOR: return caml_hash_variant("COLOR"); /* `COLOR */
    case GSK_BLEND_MODE_HUE: return caml_hash_variant("HUE"); /* `HUE */
    case GSK_BLEND_MODE_SATURATION: return caml_hash_variant("SATURATION"); /* `SATURATION */
    case GSK_BLEND_MODE_LUMINOSITY: return caml_hash_variant("LUMINOSITY"); /* `LUMINOSITY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskBlendMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskBlendMode */
GskBlendMode GskBlendMode_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return GSK_BLEND_MODE_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("MULTIPLY")) return GSK_BLEND_MODE_MULTIPLY; /* `MULTIPLY */
  else if (val == caml_hash_variant("SCREEN")) return GSK_BLEND_MODE_SCREEN; /* `SCREEN */
  else if (val == caml_hash_variant("OVERLAY")) return GSK_BLEND_MODE_OVERLAY; /* `OVERLAY */
  else if (val == caml_hash_variant("DARKEN")) return GSK_BLEND_MODE_DARKEN; /* `DARKEN */
  else if (val == caml_hash_variant("LIGHTEN")) return GSK_BLEND_MODE_LIGHTEN; /* `LIGHTEN */
  else if (val == caml_hash_variant("COLOR_DODGE")) return GSK_BLEND_MODE_COLOR_DODGE; /* `COLOR_DODGE */
  else if (val == caml_hash_variant("COLOR_BURN")) return GSK_BLEND_MODE_COLOR_BURN; /* `COLOR_BURN */
  else if (val == caml_hash_variant("HARD_LIGHT")) return GSK_BLEND_MODE_HARD_LIGHT; /* `HARD_LIGHT */
  else if (val == caml_hash_variant("SOFT_LIGHT")) return GSK_BLEND_MODE_SOFT_LIGHT; /* `SOFT_LIGHT */
  else if (val == caml_hash_variant("DIFFERENCE")) return GSK_BLEND_MODE_DIFFERENCE; /* `DIFFERENCE */
  else if (val == caml_hash_variant("EXCLUSION")) return GSK_BLEND_MODE_EXCLUSION; /* `EXCLUSION */
  else if (val == caml_hash_variant("COLOR")) return GSK_BLEND_MODE_COLOR; /* `COLOR */
  else if (val == caml_hash_variant("HUE")) return GSK_BLEND_MODE_HUE; /* `HUE */
  else if (val == caml_hash_variant("SATURATION")) return GSK_BLEND_MODE_SATURATION; /* `SATURATION */
  else if (val == caml_hash_variant("LUMINOSITY")) return GSK_BLEND_MODE_LUMINOSITY; /* `LUMINOSITY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskBlendMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskCorner to OCaml value */
value Val_GskCorner(GskCorner val) {
  switch (val) {
    case GSK_CORNER_TOP_LEFT: return caml_hash_variant("TOP_LEFT"); /* `TOP_LEFT */
    case GSK_CORNER_TOP_RIGHT: return caml_hash_variant("TOP_RIGHT"); /* `TOP_RIGHT */
    case GSK_CORNER_BOTTOM_RIGHT: return caml_hash_variant("BOTTOM_RIGHT"); /* `BOTTOM_RIGHT */
    case GSK_CORNER_BOTTOM_LEFT: return caml_hash_variant("BOTTOM_LEFT"); /* `BOTTOM_LEFT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskCorner value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskCorner */
GskCorner GskCorner_val(value val) {
  if (val == caml_hash_variant("TOP_LEFT")) return GSK_CORNER_TOP_LEFT; /* `TOP_LEFT */
  else if (val == caml_hash_variant("TOP_RIGHT")) return GSK_CORNER_TOP_RIGHT; /* `TOP_RIGHT */
  else if (val == caml_hash_variant("BOTTOM_RIGHT")) return GSK_CORNER_BOTTOM_RIGHT; /* `BOTTOM_RIGHT */
  else if (val == caml_hash_variant("BOTTOM_LEFT")) return GSK_CORNER_BOTTOM_LEFT; /* `BOTTOM_LEFT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskCorner tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskFillRule to OCaml value */
value Val_GskFillRule(GskFillRule val) {
  switch (val) {
    case GSK_FILL_RULE_WINDING: return caml_hash_variant("WINDING"); /* `WINDING */
    case GSK_FILL_RULE_EVEN_ODD: return caml_hash_variant("EVEN_ODD"); /* `EVEN_ODD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskFillRule value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskFillRule */
GskFillRule GskFillRule_val(value val) {
  if (val == caml_hash_variant("WINDING")) return GSK_FILL_RULE_WINDING; /* `WINDING */
  else if (val == caml_hash_variant("EVEN_ODD")) return GSK_FILL_RULE_EVEN_ODD; /* `EVEN_ODD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskFillRule tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskGLUniformType to OCaml value */
value Val_GskGLUniformType(GskGLUniformType val) {
  switch (val) {
    case GSK_GL_UNIFORM_TYPE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GSK_GL_UNIFORM_TYPE_FLOAT: return caml_hash_variant("FLOAT"); /* `FLOAT */
    case GSK_GL_UNIFORM_TYPE_INT: return caml_hash_variant("INT"); /* `INT */
    case GSK_GL_UNIFORM_TYPE_UINT: return caml_hash_variant("UINT"); /* `UINT */
    case GSK_GL_UNIFORM_TYPE_BOOL: return caml_hash_variant("BOOL"); /* `BOOL */
    case GSK_GL_UNIFORM_TYPE_VEC2: return caml_hash_variant("VEC2"); /* `VEC2 */
    case GSK_GL_UNIFORM_TYPE_VEC3: return caml_hash_variant("VEC3"); /* `VEC3 */
    case GSK_GL_UNIFORM_TYPE_VEC4: return caml_hash_variant("VEC4"); /* `VEC4 */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskGLUniformType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskGLUniformType */
GskGLUniformType GskGLUniformType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GSK_GL_UNIFORM_TYPE_NONE; /* `NONE */
  else if (val == caml_hash_variant("FLOAT")) return GSK_GL_UNIFORM_TYPE_FLOAT; /* `FLOAT */
  else if (val == caml_hash_variant("INT")) return GSK_GL_UNIFORM_TYPE_INT; /* `INT */
  else if (val == caml_hash_variant("UINT")) return GSK_GL_UNIFORM_TYPE_UINT; /* `UINT */
  else if (val == caml_hash_variant("BOOL")) return GSK_GL_UNIFORM_TYPE_BOOL; /* `BOOL */
  else if (val == caml_hash_variant("VEC2")) return GSK_GL_UNIFORM_TYPE_VEC2; /* `VEC2 */
  else if (val == caml_hash_variant("VEC3")) return GSK_GL_UNIFORM_TYPE_VEC3; /* `VEC3 */
  else if (val == caml_hash_variant("VEC4")) return GSK_GL_UNIFORM_TYPE_VEC4; /* `VEC4 */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskGLUniformType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskLineCap to OCaml value */
value Val_GskLineCap(GskLineCap val) {
  switch (val) {
    case GSK_LINE_CAP_BUTT: return caml_hash_variant("BUTT"); /* `BUTT */
    case GSK_LINE_CAP_ROUND: return caml_hash_variant("ROUND"); /* `ROUND */
    case GSK_LINE_CAP_SQUARE: return caml_hash_variant("SQUARE"); /* `SQUARE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskLineCap value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskLineCap */
GskLineCap GskLineCap_val(value val) {
  if (val == caml_hash_variant("BUTT")) return GSK_LINE_CAP_BUTT; /* `BUTT */
  else if (val == caml_hash_variant("ROUND")) return GSK_LINE_CAP_ROUND; /* `ROUND */
  else if (val == caml_hash_variant("SQUARE")) return GSK_LINE_CAP_SQUARE; /* `SQUARE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskLineCap tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskLineJoin to OCaml value */
value Val_GskLineJoin(GskLineJoin val) {
  switch (val) {
    case GSK_LINE_JOIN_MITER: return caml_hash_variant("MITER"); /* `MITER */
    case GSK_LINE_JOIN_ROUND: return caml_hash_variant("ROUND"); /* `ROUND */
    case GSK_LINE_JOIN_BEVEL: return caml_hash_variant("BEVEL"); /* `BEVEL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskLineJoin value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskLineJoin */
GskLineJoin GskLineJoin_val(value val) {
  if (val == caml_hash_variant("MITER")) return GSK_LINE_JOIN_MITER; /* `MITER */
  else if (val == caml_hash_variant("ROUND")) return GSK_LINE_JOIN_ROUND; /* `ROUND */
  else if (val == caml_hash_variant("BEVEL")) return GSK_LINE_JOIN_BEVEL; /* `BEVEL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskLineJoin tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskMaskMode to OCaml value */
value Val_GskMaskMode(GskMaskMode val) {
  switch (val) {
    case GSK_MASK_MODE_ALPHA: return caml_hash_variant("ALPHA"); /* `ALPHA */
    case GSK_MASK_MODE_INVERTED_ALPHA: return caml_hash_variant("INVERTED_ALPHA"); /* `INVERTED_ALPHA */
    case GSK_MASK_MODE_LUMINANCE: return caml_hash_variant("LUMINANCE"); /* `LUMINANCE */
    case GSK_MASK_MODE_INVERTED_LUMINANCE: return caml_hash_variant("INVERTED_LUMINANCE"); /* `INVERTED_LUMINANCE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskMaskMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskMaskMode */
GskMaskMode GskMaskMode_val(value val) {
  if (val == caml_hash_variant("ALPHA")) return GSK_MASK_MODE_ALPHA; /* `ALPHA */
  else if (val == caml_hash_variant("INVERTED_ALPHA")) return GSK_MASK_MODE_INVERTED_ALPHA; /* `INVERTED_ALPHA */
  else if (val == caml_hash_variant("LUMINANCE")) return GSK_MASK_MODE_LUMINANCE; /* `LUMINANCE */
  else if (val == caml_hash_variant("INVERTED_LUMINANCE")) return GSK_MASK_MODE_INVERTED_LUMINANCE; /* `INVERTED_LUMINANCE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskMaskMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskPathDirection to OCaml value */
value Val_GskPathDirection(GskPathDirection val) {
  switch (val) {
    case GSK_PATH_FROM_START: return caml_hash_variant("FROM_START"); /* `FROM_START */
    case GSK_PATH_TO_START: return caml_hash_variant("TO_START"); /* `TO_START */
    case GSK_PATH_TO_END: return caml_hash_variant("TO_END"); /* `TO_END */
    case GSK_PATH_FROM_END: return caml_hash_variant("FROM_END"); /* `FROM_END */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskPathDirection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskPathDirection */
GskPathDirection GskPathDirection_val(value val) {
  if (val == caml_hash_variant("FROM_START")) return GSK_PATH_FROM_START; /* `FROM_START */
  else if (val == caml_hash_variant("TO_START")) return GSK_PATH_TO_START; /* `TO_START */
  else if (val == caml_hash_variant("TO_END")) return GSK_PATH_TO_END; /* `TO_END */
  else if (val == caml_hash_variant("FROM_END")) return GSK_PATH_FROM_END; /* `FROM_END */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskPathDirection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskPathOperation to OCaml value */
value Val_GskPathOperation(GskPathOperation val) {
  switch (val) {
    case GSK_PATH_MOVE: return caml_hash_variant("MOVE"); /* `MOVE */
    case GSK_PATH_CLOSE: return caml_hash_variant("CLOSE"); /* `CLOSE */
    case GSK_PATH_LINE: return caml_hash_variant("LINE"); /* `LINE */
    case GSK_PATH_QUAD: return caml_hash_variant("QUAD"); /* `QUAD */
    case GSK_PATH_CUBIC: return caml_hash_variant("CUBIC"); /* `CUBIC */
    case GSK_PATH_CONIC: return caml_hash_variant("CONIC"); /* `CONIC */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskPathOperation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskPathOperation */
GskPathOperation GskPathOperation_val(value val) {
  if (val == caml_hash_variant("MOVE")) return GSK_PATH_MOVE; /* `MOVE */
  else if (val == caml_hash_variant("CLOSE")) return GSK_PATH_CLOSE; /* `CLOSE */
  else if (val == caml_hash_variant("LINE")) return GSK_PATH_LINE; /* `LINE */
  else if (val == caml_hash_variant("QUAD")) return GSK_PATH_QUAD; /* `QUAD */
  else if (val == caml_hash_variant("CUBIC")) return GSK_PATH_CUBIC; /* `CUBIC */
  else if (val == caml_hash_variant("CONIC")) return GSK_PATH_CONIC; /* `CONIC */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskPathOperation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskRenderNodeType to OCaml value */
value Val_GskRenderNodeType(GskRenderNodeType val) {
  switch (val) {
    case GSK_NOT_A_RENDER_NODE: return caml_hash_variant("NOT_A_RENDER_NODE"); /* `NOT_A_RENDER_NODE */
    case GSK_CONTAINER_NODE: return caml_hash_variant("CONTAINER_NODE"); /* `CONTAINER_NODE */
    case GSK_CAIRO_NODE: return caml_hash_variant("CAIRO_NODE"); /* `CAIRO_NODE */
    case GSK_COLOR_NODE: return caml_hash_variant("COLOR_NODE"); /* `COLOR_NODE */
    case GSK_LINEAR_GRADIENT_NODE: return caml_hash_variant("LINEAR_GRADIENT_NODE"); /* `LINEAR_GRADIENT_NODE */
    case GSK_REPEATING_LINEAR_GRADIENT_NODE: return caml_hash_variant("REPEATING_LINEAR_GRADIENT_NODE"); /* `REPEATING_LINEAR_GRADIENT_NODE */
    case GSK_RADIAL_GRADIENT_NODE: return caml_hash_variant("RADIAL_GRADIENT_NODE"); /* `RADIAL_GRADIENT_NODE */
    case GSK_REPEATING_RADIAL_GRADIENT_NODE: return caml_hash_variant("REPEATING_RADIAL_GRADIENT_NODE"); /* `REPEATING_RADIAL_GRADIENT_NODE */
    case GSK_CONIC_GRADIENT_NODE: return caml_hash_variant("CONIC_GRADIENT_NODE"); /* `CONIC_GRADIENT_NODE */
    case GSK_BORDER_NODE: return caml_hash_variant("BORDER_NODE"); /* `BORDER_NODE */
    case GSK_TEXTURE_NODE: return caml_hash_variant("TEXTURE_NODE"); /* `TEXTURE_NODE */
    case GSK_INSET_SHADOW_NODE: return caml_hash_variant("INSET_SHADOW_NODE"); /* `INSET_SHADOW_NODE */
    case GSK_OUTSET_SHADOW_NODE: return caml_hash_variant("OUTSET_SHADOW_NODE"); /* `OUTSET_SHADOW_NODE */
    case GSK_TRANSFORM_NODE: return caml_hash_variant("TRANSFORM_NODE"); /* `TRANSFORM_NODE */
    case GSK_OPACITY_NODE: return caml_hash_variant("OPACITY_NODE"); /* `OPACITY_NODE */
    case GSK_COLOR_MATRIX_NODE: return caml_hash_variant("COLOR_MATRIX_NODE"); /* `COLOR_MATRIX_NODE */
    case GSK_REPEAT_NODE: return caml_hash_variant("REPEAT_NODE"); /* `REPEAT_NODE */
    case GSK_CLIP_NODE: return caml_hash_variant("CLIP_NODE"); /* `CLIP_NODE */
    case GSK_ROUNDED_CLIP_NODE: return caml_hash_variant("ROUNDED_CLIP_NODE"); /* `ROUNDED_CLIP_NODE */
    case GSK_SHADOW_NODE: return caml_hash_variant("SHADOW_NODE"); /* `SHADOW_NODE */
    case GSK_BLEND_NODE: return caml_hash_variant("BLEND_NODE"); /* `BLEND_NODE */
    case GSK_CROSS_FADE_NODE: return caml_hash_variant("CROSS_FADE_NODE"); /* `CROSS_FADE_NODE */
    case GSK_TEXT_NODE: return caml_hash_variant("TEXT_NODE"); /* `TEXT_NODE */
    case GSK_BLUR_NODE: return caml_hash_variant("BLUR_NODE"); /* `BLUR_NODE */
    case GSK_DEBUG_NODE: return caml_hash_variant("DEBUG_NODE"); /* `DEBUG_NODE */
    case GSK_GL_SHADER_NODE: return caml_hash_variant("GL_SHADER_NODE"); /* `GL_SHADER_NODE */
    case GSK_TEXTURE_SCALE_NODE: return caml_hash_variant("TEXTURE_SCALE_NODE"); /* `TEXTURE_SCALE_NODE */
    case GSK_MASK_NODE: return caml_hash_variant("MASK_NODE"); /* `MASK_NODE */
    case GSK_FILL_NODE: return caml_hash_variant("FILL_NODE"); /* `FILL_NODE */
    case GSK_STROKE_NODE: return caml_hash_variant("STROKE_NODE"); /* `STROKE_NODE */
    case GSK_SUBSURFACE_NODE: return caml_hash_variant("SUBSURFACE_NODE"); /* `SUBSURFACE_NODE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskRenderNodeType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskRenderNodeType */
GskRenderNodeType GskRenderNodeType_val(value val) {
  if (val == caml_hash_variant("NOT_A_RENDER_NODE")) return GSK_NOT_A_RENDER_NODE; /* `NOT_A_RENDER_NODE */
  else if (val == caml_hash_variant("CONTAINER_NODE")) return GSK_CONTAINER_NODE; /* `CONTAINER_NODE */
  else if (val == caml_hash_variant("CAIRO_NODE")) return GSK_CAIRO_NODE; /* `CAIRO_NODE */
  else if (val == caml_hash_variant("COLOR_NODE")) return GSK_COLOR_NODE; /* `COLOR_NODE */
  else if (val == caml_hash_variant("LINEAR_GRADIENT_NODE")) return GSK_LINEAR_GRADIENT_NODE; /* `LINEAR_GRADIENT_NODE */
  else if (val == caml_hash_variant("REPEATING_LINEAR_GRADIENT_NODE")) return GSK_REPEATING_LINEAR_GRADIENT_NODE; /* `REPEATING_LINEAR_GRADIENT_NODE */
  else if (val == caml_hash_variant("RADIAL_GRADIENT_NODE")) return GSK_RADIAL_GRADIENT_NODE; /* `RADIAL_GRADIENT_NODE */
  else if (val == caml_hash_variant("REPEATING_RADIAL_GRADIENT_NODE")) return GSK_REPEATING_RADIAL_GRADIENT_NODE; /* `REPEATING_RADIAL_GRADIENT_NODE */
  else if (val == caml_hash_variant("CONIC_GRADIENT_NODE")) return GSK_CONIC_GRADIENT_NODE; /* `CONIC_GRADIENT_NODE */
  else if (val == caml_hash_variant("BORDER_NODE")) return GSK_BORDER_NODE; /* `BORDER_NODE */
  else if (val == caml_hash_variant("TEXTURE_NODE")) return GSK_TEXTURE_NODE; /* `TEXTURE_NODE */
  else if (val == caml_hash_variant("INSET_SHADOW_NODE")) return GSK_INSET_SHADOW_NODE; /* `INSET_SHADOW_NODE */
  else if (val == caml_hash_variant("OUTSET_SHADOW_NODE")) return GSK_OUTSET_SHADOW_NODE; /* `OUTSET_SHADOW_NODE */
  else if (val == caml_hash_variant("TRANSFORM_NODE")) return GSK_TRANSFORM_NODE; /* `TRANSFORM_NODE */
  else if (val == caml_hash_variant("OPACITY_NODE")) return GSK_OPACITY_NODE; /* `OPACITY_NODE */
  else if (val == caml_hash_variant("COLOR_MATRIX_NODE")) return GSK_COLOR_MATRIX_NODE; /* `COLOR_MATRIX_NODE */
  else if (val == caml_hash_variant("REPEAT_NODE")) return GSK_REPEAT_NODE; /* `REPEAT_NODE */
  else if (val == caml_hash_variant("CLIP_NODE")) return GSK_CLIP_NODE; /* `CLIP_NODE */
  else if (val == caml_hash_variant("ROUNDED_CLIP_NODE")) return GSK_ROUNDED_CLIP_NODE; /* `ROUNDED_CLIP_NODE */
  else if (val == caml_hash_variant("SHADOW_NODE")) return GSK_SHADOW_NODE; /* `SHADOW_NODE */
  else if (val == caml_hash_variant("BLEND_NODE")) return GSK_BLEND_NODE; /* `BLEND_NODE */
  else if (val == caml_hash_variant("CROSS_FADE_NODE")) return GSK_CROSS_FADE_NODE; /* `CROSS_FADE_NODE */
  else if (val == caml_hash_variant("TEXT_NODE")) return GSK_TEXT_NODE; /* `TEXT_NODE */
  else if (val == caml_hash_variant("BLUR_NODE")) return GSK_BLUR_NODE; /* `BLUR_NODE */
  else if (val == caml_hash_variant("DEBUG_NODE")) return GSK_DEBUG_NODE; /* `DEBUG_NODE */
  else if (val == caml_hash_variant("GL_SHADER_NODE")) return GSK_GL_SHADER_NODE; /* `GL_SHADER_NODE */
  else if (val == caml_hash_variant("TEXTURE_SCALE_NODE")) return GSK_TEXTURE_SCALE_NODE; /* `TEXTURE_SCALE_NODE */
  else if (val == caml_hash_variant("MASK_NODE")) return GSK_MASK_NODE; /* `MASK_NODE */
  else if (val == caml_hash_variant("FILL_NODE")) return GSK_FILL_NODE; /* `FILL_NODE */
  else if (val == caml_hash_variant("STROKE_NODE")) return GSK_STROKE_NODE; /* `STROKE_NODE */
  else if (val == caml_hash_variant("SUBSURFACE_NODE")) return GSK_SUBSURFACE_NODE; /* `SUBSURFACE_NODE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskRenderNodeType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskScalingFilter to OCaml value */
value Val_GskScalingFilter(GskScalingFilter val) {
  switch (val) {
    case GSK_SCALING_FILTER_LINEAR: return caml_hash_variant("LINEAR"); /* `LINEAR */
    case GSK_SCALING_FILTER_NEAREST: return caml_hash_variant("NEAREST"); /* `NEAREST */
    case GSK_SCALING_FILTER_TRILINEAR: return caml_hash_variant("TRILINEAR"); /* `TRILINEAR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskScalingFilter value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskScalingFilter */
GskScalingFilter GskScalingFilter_val(value val) {
  if (val == caml_hash_variant("LINEAR")) return GSK_SCALING_FILTER_LINEAR; /* `LINEAR */
  else if (val == caml_hash_variant("NEAREST")) return GSK_SCALING_FILTER_NEAREST; /* `NEAREST */
  else if (val == caml_hash_variant("TRILINEAR")) return GSK_SCALING_FILTER_TRILINEAR; /* `TRILINEAR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskScalingFilter tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskSerializationError to OCaml value */
value Val_GskSerializationError(GskSerializationError val) {
  switch (val) {
    case GSK_SERIALIZATION_UNSUPPORTED_FORMAT: return caml_hash_variant("UNSUPPORTED_FORMAT"); /* `UNSUPPORTED_FORMAT */
    case GSK_SERIALIZATION_UNSUPPORTED_VERSION: return caml_hash_variant("UNSUPPORTED_VERSION"); /* `UNSUPPORTED_VERSION */
    case GSK_SERIALIZATION_INVALID_DATA: return caml_hash_variant("INVALID_DATA"); /* `INVALID_DATA */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskSerializationError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskSerializationError */
GskSerializationError GskSerializationError_val(value val) {
  if (val == caml_hash_variant("UNSUPPORTED_FORMAT")) return GSK_SERIALIZATION_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else if (val == caml_hash_variant("UNSUPPORTED_VERSION")) return GSK_SERIALIZATION_UNSUPPORTED_VERSION; /* `UNSUPPORTED_VERSION */
  else if (val == caml_hash_variant("INVALID_DATA")) return GSK_SERIALIZATION_INVALID_DATA; /* `INVALID_DATA */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskSerializationError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskTransformCategory to OCaml value */
value Val_GskTransformCategory(GskTransformCategory val) {
  switch (val) {
    case GSK_TRANSFORM_CATEGORY_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case GSK_TRANSFORM_CATEGORY_ANY: return caml_hash_variant("ANY"); /* `ANY */
    case GSK_TRANSFORM_CATEGORY_3D: return caml_hash_variant("V3D"); /* `V3D */
    case GSK_TRANSFORM_CATEGORY_2D: return caml_hash_variant("V2D"); /* `V2D */
    case GSK_TRANSFORM_CATEGORY_2D_AFFINE: return caml_hash_variant("V2D_AFFINE"); /* `V2D_AFFINE */
    case GSK_TRANSFORM_CATEGORY_2D_TRANSLATE: return caml_hash_variant("V2D_TRANSLATE"); /* `V2D_TRANSLATE */
    case GSK_TRANSFORM_CATEGORY_IDENTITY: return caml_hash_variant("IDENTITY"); /* `IDENTITY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GskTransformCategory value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GskTransformCategory */
GskTransformCategory GskTransformCategory_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return GSK_TRANSFORM_CATEGORY_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("ANY")) return GSK_TRANSFORM_CATEGORY_ANY; /* `ANY */
  else if (val == caml_hash_variant("V3D")) return GSK_TRANSFORM_CATEGORY_3D; /* `V3D */
  else if (val == caml_hash_variant("V2D")) return GSK_TRANSFORM_CATEGORY_2D; /* `V2D */
  else if (val == caml_hash_variant("V2D_AFFINE")) return GSK_TRANSFORM_CATEGORY_2D_AFFINE; /* `V2D_AFFINE */
  else if (val == caml_hash_variant("V2D_TRANSLATE")) return GSK_TRANSFORM_CATEGORY_2D_TRANSLATE; /* `V2D_TRANSLATE */
  else if (val == caml_hash_variant("IDENTITY")) return GSK_TRANSFORM_CATEGORY_IDENTITY; /* `IDENTITY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GskTransformCategory tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GskPathForeachFlags to OCaml flag list */
value Val_GskPathForeachFlags(GskPathForeachFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GSK_PATH_FOREACH_ALLOW_ONLY_LINES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ONLY_LINES"))); /* `ONLY_LINES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GSK_PATH_FOREACH_ALLOW_QUAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("QUAD"))); /* `QUAD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GSK_PATH_FOREACH_ALLOW_CUBIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CUBIC"))); /* `CUBIC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GSK_PATH_FOREACH_ALLOW_CONIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONIC"))); /* `CONIC */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GskPathForeachFlags */
GskPathForeachFlags GskPathForeachFlags_val(value list) {
  GskPathForeachFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("ONLY_LINES")) result |= GSK_PATH_FOREACH_ALLOW_ONLY_LINES; /* `ONLY_LINES */
    else if (tag == caml_hash_variant("QUAD")) result |= GSK_PATH_FOREACH_ALLOW_QUAD; /* `QUAD */
    else if (tag == caml_hash_variant("CUBIC")) result |= GSK_PATH_FOREACH_ALLOW_CUBIC; /* `CUBIC */
    else if (tag == caml_hash_variant("CONIC")) result |= GSK_PATH_FOREACH_ALLOW_CONIC; /* `CONIC */
    list = Field(list, 1);
  }
  return result;
}

