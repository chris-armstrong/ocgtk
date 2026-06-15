/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrShape */

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

/* Conversion functions for PangoAttrShape (opaque record with hidden fields) */
PangoAttrShape *PangoAttrShape_val(value v) {
  return (PangoAttrShape *)ml_gir_record_ptr_val(v, "PangoAttrShape");
}

value Val_PangoAttrShape(const PangoAttrShape *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrShape_option(const PangoAttrShape *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrShape(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_get_ink_rect(value self)
{
    CAMLparam1(self);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    CAMLreturn(Val_PangoRectangle(&rec->ink_rect));
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_get_logical_rect(value self)
{
    CAMLparam1(self);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    CAMLreturn(Val_PangoRectangle(&rec->logical_rect));
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_get_destroy_func(value self)
{
    CAMLparam1(self);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    CAMLreturn(Val_int(rec->destroy_func));
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_set_ink_rect(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    rec->ink_rect = *PangoRectangle_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_set_logical_rect(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    rec->logical_rect = *PangoRectangle_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_set_destroy_func(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrShape *rec = PangoAttrShape_val(self);
    rec->destroy_func = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_shape_make(value v_ink_rect, value v_logical_rect, value v_destroy_func)
{
    CAMLparam3(v_ink_rect, v_logical_rect, v_destroy_func);
    PangoAttrShape *obj = g_new0(PangoAttrShape, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->ink_rect = *PangoRectangle_val(v_ink_rect);
    obj->logical_rect = *PangoRectangle_val(v_logical_rect);
    obj->destroy_func = Int_val(v_destroy_func);
    CAMLreturn(Val_PangoAttrShape(obj));
}

