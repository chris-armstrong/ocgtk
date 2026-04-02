/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Font */

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


CAMLexport CAMLprim value ml_pango_cairo_font_get_scaled_font(value self)
{
CAMLparam1(self);

cairo_scaled_font_t* result = pango_cairo_font_get_scaled_font(PangoCairoFont_val(self));
CAMLreturn(Val_option(result, Val_cairo_scaled_font_t));
}
