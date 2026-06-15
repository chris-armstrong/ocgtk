/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFloat */

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

/* Conversion functions for PangoAttrFloat (opaque record with hidden fields) */
PangoAttrFloat *PangoAttrFloat_val(value v) {
  return (PangoAttrFloat *)ml_gir_record_ptr_val(v, "PangoAttrFloat");
}

value Val_PangoAttrFloat(const PangoAttrFloat *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFloat_option(const PangoAttrFloat *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFloat(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_float_get_value(value self)
{
    CAMLparam1(self);
    PangoAttrFloat *rec = PangoAttrFloat_val(self);
    CAMLreturn(caml_copy_double(rec->value));
}

\
CAMLexport CAMLprim value ml_pango_attr_float_set_value(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrFloat *rec = PangoAttrFloat_val(self);
    rec->value = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_float_make(value v_value)
{
    CAMLparam1(v_value);
    PangoAttrFloat *obj = g_new0(PangoAttrFloat, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->value = Double_val(v_value);
    CAMLreturn(Val_PangoAttrFloat(obj));
}

