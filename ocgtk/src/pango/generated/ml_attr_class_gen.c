/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrClass */

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

/* Conversion functions for PangoAttrClass (opaque record with hidden fields) */
PangoAttrClass *PangoAttrClass_val(value v) {
  return (PangoAttrClass *)ml_gir_record_ptr_val(v, "PangoAttrClass");
}

value Val_PangoAttrClass(const PangoAttrClass *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrClass_option(const PangoAttrClass *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrClass(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_class_get_type(value self)
{
    CAMLparam1(self);
    PangoAttrClass *rec = PangoAttrClass_val(self);
    CAMLreturn(Val_PangoAttrType(rec->type));
}

\
CAMLexport CAMLprim value ml_pango_attr_class_set_type(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrClass *rec = PangoAttrClass_val(self);
    rec->type = PangoAttrType_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_class_make(value v_type)
{
    CAMLparam1(v_type);
    PangoAttrClass *obj = g_new0(PangoAttrClass, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->type = PangoAttrType_val(v_type);
    CAMLreturn(Val_PangoAttrClass(obj));
}

