/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Color */

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

/* Copy function for PangoColor (value-like record with copy method) */
value copy_PangoColor(const PangoColor *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoColor *copy = pango_color_copy((PangoColor*)ptr);
  return ml_gir_record_val_ptr(copy);
}


#if PANGO_VERSION_CHECK(1,16,0)

CAMLexport CAMLprim value ml_pango_color_to_string(value self)
{
CAMLparam1(self);

char* result = pango_color_to_string(PangoColor_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_pango_color_to_string(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Color requires Pango >= 1.16");
return Val_unit;
}
#endif

CAMLexport CAMLprim value ml_pango_color_parse(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = pango_color_parse(PangoColor_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_color_free(value self)
{
CAMLparam1(self);

pango_color_free(PangoColor_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_color_copy(value self)
{
CAMLparam1(self);

PangoColor* result = pango_color_copy(PangoColor_val(self));
CAMLreturn(Val_option(result, Val_PangoColor));
}
