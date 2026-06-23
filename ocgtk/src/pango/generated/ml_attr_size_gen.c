/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrSize */

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

/* Conversion functions for PangoAttrSize (opaque record with hidden fields) */
PangoAttrSize *PangoAttrSize_val(value v) {
  return (PangoAttrSize *)ml_gir_record_ptr_val(v, "PangoAttrSize");
}

value Val_PangoAttrSize(const PangoAttrSize *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrSize_option(const PangoAttrSize *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrSize(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_size_get_attr(value self)
{
    CAMLparam1(self);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    CAMLreturn(Val_PangoAttribute(&rec->attr));
}

\
CAMLexport CAMLprim value ml_pango_attr_size_get_size(value self)
{
    CAMLparam1(self);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    CAMLreturn(Val_int(rec->size));
}

\
CAMLexport CAMLprim value ml_pango_attr_size_get_absolute(value self)
{
    CAMLparam1(self);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    CAMLreturn(Val_int(rec->absolute));
}

\
CAMLexport CAMLprim value ml_pango_attr_size_set_attr(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    rec->attr = *PangoAttribute_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_size_set_size(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    rec->size = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_size_set_absolute(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrSize *rec = PangoAttrSize_val(self);
    rec->absolute = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_size_make(value v_attr, value v_size, value v_absolute)
{
    CAMLparam3(v_attr, v_size, v_absolute);
    PangoAttrSize *obj = g_new0(PangoAttrSize, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->attr = *PangoAttribute_val(v_attr);
    obj->size = Int_val(v_size);
    obj->absolute = Int_val(v_absolute);
    CAMLreturn(Val_PangoAttrSize(obj));
}

