/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Rectangle */

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

/* Conversion functions for PangoRectangle (opaque record with hidden fields) */
PangoRectangle *PangoRectangle_val(value v) {
  return (PangoRectangle *)ml_gir_record_ptr_val(v, "PangoRectangle");
}

value Val_PangoRectangle(const PangoRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoRectangle_option(const PangoRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoRectangle(ptr));
}

\
CAMLexport CAMLprim value ml_pango_rectangle_get_x(value self)
{
    CAMLparam1(self);
    PangoRectangle *rec = PangoRectangle_val(self);
    CAMLreturn(Val_int(rec->x));
}

\
CAMLexport CAMLprim value ml_pango_rectangle_get_y(value self)
{
    CAMLparam1(self);
    PangoRectangle *rec = PangoRectangle_val(self);
    CAMLreturn(Val_int(rec->y));
}

\
CAMLexport CAMLprim value ml_pango_rectangle_get_width(value self)
{
    CAMLparam1(self);
    PangoRectangle *rec = PangoRectangle_val(self);
    CAMLreturn(Val_int(rec->width));
}

\
CAMLexport CAMLprim value ml_pango_rectangle_get_height(value self)
{
    CAMLparam1(self);
    PangoRectangle *rec = PangoRectangle_val(self);
    CAMLreturn(Val_int(rec->height));
}

\
CAMLexport CAMLprim value ml_pango_rectangle_set_x(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoRectangle *rec = PangoRectangle_val(self);
    rec->x = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_rectangle_set_y(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoRectangle *rec = PangoRectangle_val(self);
    rec->y = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_rectangle_set_width(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoRectangle *rec = PangoRectangle_val(self);
    rec->width = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_rectangle_set_height(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoRectangle *rec = PangoRectangle_val(self);
    rec->height = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_rectangle_make(value v_x, value v_y, value v_width, value v_height)
{
    CAMLparam4(v_x, v_y, v_width, v_height);
    PangoRectangle *obj = g_new0(PangoRectangle, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->x = Int_val(v_x);
    obj->y = Int_val(v_y);
    obj->width = Int_val(v_width);
    obj->height = Int_val(v_height);
    CAMLreturn(Val_PangoRectangle(obj));
}

