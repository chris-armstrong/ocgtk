/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrInt */

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

/* Conversion functions for PangoAttrInt (opaque record with hidden fields) */
PangoAttrInt *PangoAttrInt_val(value v) {
  return (PangoAttrInt *)ml_gir_record_ptr_val(v, "PangoAttrInt");
}

value Val_PangoAttrInt(const PangoAttrInt *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrInt_option(const PangoAttrInt *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrInt(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_int_get_attr(value self)
{
    CAMLparam1(self);
    PangoAttrInt *rec = PangoAttrInt_val(self);
    CAMLreturn(Val_PangoAttribute(&rec->attr));
}

\
CAMLexport CAMLprim value ml_pango_attr_int_get_value(value self)
{
    CAMLparam1(self);
    PangoAttrInt *rec = PangoAttrInt_val(self);
    CAMLreturn(Val_int(rec->value));
}

\
CAMLexport CAMLprim value ml_pango_attr_int_set_attr(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrInt *rec = PangoAttrInt_val(self);
    rec->attr = *PangoAttribute_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_int_set_value(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrInt *rec = PangoAttrInt_val(self);
    rec->value = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_int_make(value v_attr, value v_value)
{
    CAMLparam2(v_attr, v_value);
    PangoAttrInt *obj = g_new0(PangoAttrInt, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->attr = *PangoAttribute_val(v_attr);
    obj->value = Int_val(v_value);
    CAMLreturn(Val_PangoAttrInt(obj));
}

