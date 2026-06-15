/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrColor */

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

/* Conversion functions for PangoAttrColor (opaque record with hidden fields) */
PangoAttrColor *PangoAttrColor_val(value v) {
  return (PangoAttrColor *)ml_gir_record_ptr_val(v, "PangoAttrColor");
}

value Val_PangoAttrColor(const PangoAttrColor *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrColor_option(const PangoAttrColor *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrColor(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_color_get_color(value self)
{
    CAMLparam1(self);
    PangoAttrColor *rec = PangoAttrColor_val(self);
    CAMLreturn(Val_PangoColor(&rec->color));
}

\
CAMLexport CAMLprim value ml_pango_attr_color_set_color(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrColor *rec = PangoAttrColor_val(self);
    rec->color = *PangoColor_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_color_make(value v_color)
{
    CAMLparam1(v_color);
    PangoAttrColor *obj = g_new0(PangoAttrColor, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->color = *PangoColor_val(v_color);
    CAMLreturn(Val_PangoAttrColor(obj));
}

