/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Font */

#include <pango/pango.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pango.h>
/* Include library-specific type conversions and forward declarations */
#include "pango_decls.h"


CAMLexport CAMLprim value ml_pango_font_get_metrics(value self, value arg1)
{
CAMLparam2(self, arg1);

PangoFontMetrics* result = pango_font_get_metrics(PangoFont_val(self), Option_val(arg1, PangoLanguage_val, NULL));
CAMLreturn(Val_PangoFontMetrics(result));
}

CAMLexport CAMLprim value ml_pango_font_get_font_map(value self)
{
CAMLparam1(self);

PangoFontMap* result = pango_font_get_font_map(PangoFont_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_PangoFontMap));
}

CAMLexport CAMLprim value ml_pango_font_get_face(value self)
{
CAMLparam1(self);

PangoFontFace* result = pango_font_get_face(PangoFont_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_PangoFontFace(result));
}

CAMLexport CAMLprim value ml_pango_font_get_coverage(value self, value arg1)
{
CAMLparam2(self, arg1);

PangoCoverage* result = pango_font_get_coverage(PangoFont_val(self), PangoLanguage_val(arg1));
CAMLreturn(Val_PangoCoverage(result));
}

CAMLexport CAMLprim value ml_pango_font_describe_with_absolute_size(value self)
{
CAMLparam1(self);

PangoFontDescription* result = pango_font_describe_with_absolute_size(PangoFont_val(self));
CAMLreturn(Val_PangoFontDescription(result));
}

CAMLexport CAMLprim value ml_pango_font_describe(value self)
{
CAMLparam1(self);

PangoFontDescription* result = pango_font_describe(PangoFont_val(self));
CAMLreturn(Val_PangoFontDescription(result));
}
