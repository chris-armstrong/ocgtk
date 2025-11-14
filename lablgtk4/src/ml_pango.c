/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

/* Pango bindings for GTK4 - Phase 2.5 */

#include <stdio.h>
#include <pango/pango.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include "wrappers.h"
#include "ml_glib.h"
#include "ml_gobject.h"
#include "ml_pango.h"
#include "pango_tags.h"


/* ========================================================================= */
/* Module Initialization */
/* ========================================================================= */

CAMLprim value ml_pango_init(value unit)
{
  /* Since these are declared const, must force gcc to call them! */
  GType t = pango_font_description_get_type();
  return Val_GType(t);
}

/* ========================================================================= */
/* PangoFontDescription - Custom Block */
/* ========================================================================= */

static void ml_finalize_font_description(value val)
{
  PangoFontDescription *desc = PangoFontDescription_val(val);
  if (desc) {
    pango_font_description_free(desc);
  }
}

static struct custom_operations font_description_ops = {
  "org.lablgtk.pango_font_description",
  ml_finalize_font_description,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default,
  custom_fixed_length_default
};

value Val_PangoFontDescription_new(PangoFontDescription *desc)
{
  if (!desc) caml_failwith("Val_PangoFontDescription_new: NULL pointer");

  value val = caml_alloc_custom(&font_description_ops, sizeof(PangoFontDescription*), 0, 1);
  PangoFontDescription_val(val) = desc;
  return val;
}

value Val_PangoFontDescription(PangoFontDescription *desc)
{
  if (!desc) caml_failwith("Val_PangoFontDescription: NULL pointer");
  return Val_PangoFontDescription_new(pango_font_description_copy(desc));
}

ML_1(pango_font_description_from_string, String_val, Val_PangoFontDescription_new)
ML_1(pango_font_description_copy, PangoFontDescription_val, Val_PangoFontDescription_new)
ML_1(pango_font_description_to_string, PangoFontDescription_val, copy_string_g_free)
ML_2(pango_font_description_set_family, PangoFontDescription_val, String_val, Unit)
ML_1(pango_font_description_get_family, PangoFontDescription_val, caml_copy_string)
ML_2(pango_font_description_set_style, PangoFontDescription_val, Pango_style_val, Unit)
ML_1(pango_font_description_get_style, PangoFontDescription_val, Val_pango_style)
ML_2(pango_font_description_set_variant, PangoFontDescription_val, Pango_variant_val, Unit)
ML_1(pango_font_description_get_variant, PangoFontDescription_val, Val_pango_variant)
ML_2(pango_font_description_set_weight, PangoFontDescription_val, Int_val, Unit)
ML_1(pango_font_description_get_weight, PangoFontDescription_val, Val_int)
ML_2(pango_font_description_set_stretch, PangoFontDescription_val, Pango_stretch_val, Unit)
ML_1(pango_font_description_get_stretch, PangoFontDescription_val, Val_pango_stretch)
ML_2(pango_font_description_set_size, PangoFontDescription_val, Int_val, Unit)
ML_1(pango_font_description_get_size, PangoFontDescription_val, Val_int)
ML_2(pango_font_description_set_absolute_size, PangoFontDescription_val, Double_val, Unit)
ML_1(pango_font_description_get_size_is_absolute, PangoFontDescription_val, Val_bool)

/* ========================================================================= */
/* PangoFontMetrics - Custom Block */
/* ========================================================================= */

static void ml_finalize_font_metrics(value val)
{
  PangoFontMetrics *metrics = PangoFontMetrics_val(val);
  if (metrics) {
    pango_font_metrics_unref(metrics);
  }
}

static struct custom_operations font_metrics_ops = {
  "org.lablgtk.pango_font_metrics",
  ml_finalize_font_metrics,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default,
  custom_fixed_length_default
};

value Val_PangoFontMetrics_new(PangoFontMetrics *metrics)
{
  if (!metrics) caml_failwith("Val_PangoFontMetrics_new: NULL pointer");

  value val = caml_alloc_custom(&font_metrics_ops, sizeof(PangoFontMetrics*), 0, 1);
  PangoFontMetrics_val(val) = metrics;
  return val;
}

ML_1(pango_font_metrics_get_ascent, PangoFontMetrics_val, Val_int)
ML_1(pango_font_metrics_get_descent, PangoFontMetrics_val, Val_int)
ML_1(pango_font_metrics_get_approximate_char_width, PangoFontMetrics_val, Val_int)
ML_1(pango_font_metrics_get_approximate_digit_width, PangoFontMetrics_val, Val_int)

/* ========================================================================= */
/* PangoFont - GObject */
/* ========================================================================= */

ML_2(pango_font_get_metrics, PangoFont_val, PangoLanguage_val, Val_PangoFontMetrics_new)

/* ========================================================================= */
/* PangoFontMap - GObject */
/* ========================================================================= */

CAMLprim value ml_pango_font_map_load_font(value map_val, value context_val, value desc_val)
{
  PangoFontMap *map = PangoFontMap_val(map_val);
  PangoContext *context = PangoContext_val(context_val);
  PangoFontDescription *desc = PangoFontDescription_val(desc_val);

  PangoFont *font = pango_font_map_load_font(map, context, desc);
  if (!font) caml_failwith("pango_font_map_load_font failed");

  return Val_PangoFont((gpointer)font);
}

/* ========================================================================= */
/* Enums */
/* ========================================================================= */

CAMLprim value ml_PANGO_SCALE(value unit)
{
  return Val_int(PANGO_SCALE);
}

/* This one uses the generated MLTAG but not the conversion functions because
   we have defined float values */
CAMLprim value ml_Pango_scale_val(value val)
{
  double r;
  if (Is_block(val)) return Field(val,1); /* `CUSTOM */
  switch((long)val)
    {
    case (long)MLTAG_XX_SMALL: r = PANGO_SCALE_XX_SMALL; break;
    case (long)MLTAG_X_SMALL:  r = PANGO_SCALE_X_SMALL; break;
    case (long)MLTAG_SMALL:    r = PANGO_SCALE_SMALL; break;
    case (long)MLTAG_MEDIUM:   r = PANGO_SCALE_MEDIUM; break;
    case (long)MLTAG_LARGE:    r = PANGO_SCALE_LARGE; break;
    case (long)MLTAG_X_LARGE:  r = PANGO_SCALE_X_LARGE; break;
    case (long)MLTAG_XX_LARGE: r = PANGO_SCALE_XX_LARGE; break;
    default: printf("Bug in ml_PangoScale_val. Please report");
      r=1;
      break;
    }
  return caml_copy_double(r);
}

/* ========================================================================= */
/* PangoLanguage */
/* ========================================================================= */

ML_1(pango_language_from_string, String_val, Val_PangoLanguage)
ML_1(pango_language_to_string, PangoLanguage_val, caml_copy_string)
ML_2(pango_language_matches, PangoLanguage_val, String_val, Val_bool)

/* ========================================================================= */
/* PangoContext - GObject */
/* ========================================================================= */

ML_1(pango_context_get_font_description, PangoContext_val, Val_PangoFontDescription)
ML_2(pango_context_set_font_description, PangoContext_val, PangoFontDescription_val, Unit)
ML_1(pango_context_get_language, PangoContext_val, Val_PangoLanguage)
ML_2(pango_context_set_language, PangoContext_val, PangoLanguage_val, Unit)
ML_2(pango_context_load_font, PangoContext_val, PangoFontDescription_val, Val_PangoFont)
CAMLprim value ml_pango_context_load_fontset(value context_val, value desc_val, value lang_val)
{
  PangoContext *context = PangoContext_val(context_val);
  PangoFontDescription *desc = PangoFontDescription_val(desc_val);
  PangoLanguage *lang = PangoLanguage_val(lang_val);

  PangoFontset *fontset = pango_context_load_fontset(context, desc, lang);
  /* Note: PangoFontset is a GObject, cast to PangoFont for simplicity */
  return Val_PangoFont((gpointer)fontset);
}

CAMLprim value ml_pango_context_get_metrics(value context_val, value desc_val, value lang_opt_val)
{
  PangoContext *context = PangoContext_val(context_val);
  PangoFontDescription *desc = PangoFontDescription_val(desc_val);
  PangoLanguage *lang = (lang_opt_val == Val_none) ? NULL : PangoLanguage_val(Some_val(lang_opt_val));

  PangoFontMetrics *metrics = pango_context_get_metrics(context, desc, lang);
  if (!metrics) caml_failwith("pango_context_get_metrics failed");

  return Val_PangoFontMetrics_new(metrics);
}

/* ========================================================================= */
/* PangoLayout - GObject */
/* ========================================================================= */

ML_1(pango_layout_new, PangoContext_val, Val_PangoLayout)
ML_1(pango_layout_copy, PangoLayout_val, Val_PangoLayout)
ML_1(pango_layout_get_context, PangoLayout_val, Val_PangoContext)

CAMLprim value ml_pango_layout_set_text(value layout_val, value text_val)
{
  PangoLayout *layout = PangoLayout_val(layout_val);
  const char *text = String_val(text_val);
  int len = caml_string_length(text_val);
  pango_layout_set_text(layout, text, len);
  return Val_unit;
}

ML_1(pango_layout_get_text, PangoLayout_val, caml_copy_string)

CAMLprim value ml_pango_layout_set_markup(value layout_val, value markup_val)
{
  PangoLayout *layout = PangoLayout_val(layout_val);
  const char *markup = String_val(markup_val);
  int len = caml_string_length(markup_val);
  pango_layout_set_markup(layout, markup, len);
  return Val_unit;
}

CAMLprim value ml_pango_layout_set_markup_with_accel(value layout_val, value markup_val,
                                                      value accel_val, value accel_out_val)
{
  PangoLayout *layout = PangoLayout_val(layout_val);
  const char *markup = String_val(markup_val);
  int len = caml_string_length(markup_val);
  gunichar accel_marker = Int_val(accel_val);

  pango_layout_set_markup_with_accel(layout, markup, len, accel_marker, NULL);
  return Val_unit;
}

ML_2(pango_layout_set_font_description, PangoLayout_val, PangoFontDescription_val, Unit)
ML_1(pango_layout_get_font_description, PangoLayout_val, Val_PangoFontDescription)
ML_2(pango_layout_set_width, PangoLayout_val, Int_val, Unit)
ML_1(pango_layout_get_width, PangoLayout_val, Val_int)
ML_2(pango_layout_set_wrap, PangoLayout_val, Pango_wrap_mode_val, Unit)
ML_1(pango_layout_get_wrap, PangoLayout_val, Val_pango_wrap_mode)
ML_2(pango_layout_set_indent, PangoLayout_val, Int_val, Unit)
ML_1(pango_layout_get_indent, PangoLayout_val, Val_int)
ML_2(pango_layout_set_spacing, PangoLayout_val, Int_val, Unit)
ML_1(pango_layout_get_spacing, PangoLayout_val, Val_int)
ML_2(pango_layout_set_justify, PangoLayout_val, Bool_val, Unit)
ML_1(pango_layout_get_justify, PangoLayout_val, Val_bool)
ML_2(pango_layout_set_single_paragraph_mode, PangoLayout_val, Bool_val, Unit)
ML_1(pango_layout_get_single_paragraph_mode, PangoLayout_val, Val_bool)
ML_1(pango_layout_context_changed, PangoLayout_val, Unit)

CAMLprim value ml_pango_layout_get_size(value layout_val)
{
  CAMLparam1(layout_val);
  CAMLlocal1(result);

  int width, height;
  pango_layout_get_size(PangoLayout_val(layout_val), &width, &height);

  result = caml_alloc_tuple(2);
  Store_field(result, 0, Val_int(width));
  Store_field(result, 1, Val_int(height));

  CAMLreturn(result);
}

CAMLprim value ml_pango_layout_get_pixel_size(value layout_val)
{
  CAMLparam1(layout_val);
  CAMLlocal1(result);

  int width, height;
  pango_layout_get_pixel_size(PangoLayout_val(layout_val), &width, &height);

  result = caml_alloc_tuple(2);
  Store_field(result, 0, Val_int(width));
  Store_field(result, 1, Val_int(height));

  CAMLreturn(result);
}

CAMLexport value Val_PangoRectangle(PangoRectangle *rect)
{
  CAMLparam0();
  CAMLlocal1(result);

  result = caml_alloc_tuple(4);
  Store_field(result, 0, Val_int(rect->x));
  Store_field(result, 1, Val_int(rect->y));
  Store_field(result, 2, Val_int(rect->width));
  Store_field(result, 3, Val_int(rect->height));

  CAMLreturn(result);
}

CAMLprim value ml_pango_layout_index_to_pos(value layout_val, value index_val)
{
  CAMLparam2(layout_val, index_val);

  PangoRectangle pos;
  pango_layout_index_to_pos(PangoLayout_val(layout_val), Int_val(index_val), &pos);

  CAMLreturn(Val_PangoRectangle(&pos));
}

CAMLprim value ml_pango_layout_xy_to_index(value layout_val, value x_val, value y_val)
{
  CAMLparam3(layout_val, x_val, y_val);
  CAMLlocal1(result);

  int index, trailing;
  gboolean exact;

  exact = pango_layout_xy_to_index(PangoLayout_val(layout_val), Int_val(x_val),
                                   Int_val(y_val), &index, &trailing);

  result = caml_alloc_tuple(3);
  Store_field(result, 0, Val_int(index));
  Store_field(result, 1, Val_int(trailing));
  Store_field(result, 2, Val_bool(exact));

  CAMLreturn(result);
}

CAMLprim value ml_pango_layout_get_extent(value layout_val)
{
  CAMLparam1(layout_val);

  PangoRectangle ink;
  pango_layout_get_extents(PangoLayout_val(layout_val), &ink, NULL);

  CAMLreturn(Val_PangoRectangle(&ink));
}

CAMLprim value ml_pango_layout_get_pixel_extent(value layout_val)
{
  CAMLparam1(layout_val);

  PangoRectangle ink;
  pango_layout_get_pixel_extents(PangoLayout_val(layout_val), &ink, NULL);

  CAMLreturn(Val_PangoRectangle(&ink));
}

ML_1(pango_layout_get_ellipsize, PangoLayout_val, Val_pango_ellipsize_mode)
ML_2(pango_layout_set_ellipsize, PangoLayout_val, Pango_ellipsize_mode_val, Unit)
