/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontMap */

#include <pango/pangocairo.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pangocairo.h>
/* Include library-specific type conversions and forward declarations */
#include "pangocairo_decls.h"


CAMLexport CAMLprim value ml_pango_cairo_font_map_set_resolution(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_cairo_font_map_set_resolution(PangoCairoFontMap_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_cairo_font_map_set_default(value self)
{
CAMLparam1(self);

pango_cairo_font_map_set_default(PangoCairoFontMap_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_cairo_font_map_get_resolution(value self)
{
CAMLparam1(self);

double result = pango_cairo_font_map_get_resolution(PangoCairoFontMap_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_pango_cairo_font_map_get_font_type(value self)
{
CAMLparam1(self);

cairo_font_type_t result = pango_cairo_font_map_get_font_type(PangoCairoFontMap_val(self));
CAMLreturn(Val_cairoFontType(result));
}
