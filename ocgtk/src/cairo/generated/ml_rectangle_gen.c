/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Rectangle */

#include <cairo-gobject.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <cairo-gobject.h>
/* Include library-specific type conversions and forward declarations */
#include "cairo_decls.h"

/* Conversion functions for cairo_rectangle_t (opaque record with hidden fields) */
cairo_rectangle_t *cairo_rectangle_t_val(value v) {
  return (cairo_rectangle_t *)ml_gir_record_ptr_val(v, "cairo_rectangle_t");
}

value Val_cairo_rectangle_t(const cairo_rectangle_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(cairo_gobject_rectangle_get_type(), ptr);
}

value Val_cairo_rectangle_t_option(const cairo_rectangle_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_cairo_rectangle_t(ptr));
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_get_x(value self)
{
    CAMLparam1(self);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    CAMLreturn(caml_copy_double(rec->x));
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_get_y(value self)
{
    CAMLparam1(self);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    CAMLreturn(caml_copy_double(rec->y));
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_get_width(value self)
{
    CAMLparam1(self);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    CAMLreturn(caml_copy_double(rec->width));
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_get_height(value self)
{
    CAMLparam1(self);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    CAMLreturn(caml_copy_double(rec->height));
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_set_x(value self, value v_val)
{
    CAMLparam2(self, v_val);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    rec->x = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_set_y(value self, value v_val)
{
    CAMLparam2(self, v_val);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    rec->y = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_set_width(value self, value v_val)
{
    CAMLparam2(self, v_val);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    rec->width = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_set_height(value self, value v_val)
{
    CAMLparam2(self, v_val);
    cairo_rectangle_t *rec = cairo_rectangle_t_val(self);
    rec->height = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_cairo_rectangle_make(value v_x, value v_y, value v_width, value v_height)
{
    CAMLparam4(v_x, v_y, v_width, v_height);
    cairo_rectangle_t *obj = g_new0(cairo_rectangle_t, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->x = Double_val(v_x);
    obj->y = Double_val(v_y);
    obj->width = Double_val(v_width);
    obj->height = Double_val(v_height);
    CAMLreturn(Val_cairo_rectangle_t(obj));
}

