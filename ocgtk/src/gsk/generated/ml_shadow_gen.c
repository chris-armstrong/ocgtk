/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Shadow */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"

/* Conversion functions for GskShadow (opaque record with hidden fields) */
GskShadow *GskShadow_val(value v) {
  return (GskShadow *)ml_gir_record_ptr_val(v, "GskShadow");
}

value Val_GskShadow(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskShadow_option(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskShadow(ptr));
}

\
CAMLexport CAMLprim value ml_gsk_shadow_get_color(value self)
{
    CAMLparam1(self);
    GskShadow *rec = GskShadow_val(self);
    CAMLreturn(Val_GdkRGBA(&rec->color));
}

\
CAMLexport CAMLprim value ml_gsk_shadow_get_dx(value self)
{
    CAMLparam1(self);
    GskShadow *rec = GskShadow_val(self);
    CAMLreturn(caml_copy_double(rec->dx));
}

\
CAMLexport CAMLprim value ml_gsk_shadow_get_dy(value self)
{
    CAMLparam1(self);
    GskShadow *rec = GskShadow_val(self);
    CAMLreturn(caml_copy_double(rec->dy));
}

\
CAMLexport CAMLprim value ml_gsk_shadow_get_radius(value self)
{
    CAMLparam1(self);
    GskShadow *rec = GskShadow_val(self);
    CAMLreturn(caml_copy_double(rec->radius));
}

\
CAMLexport CAMLprim value ml_gsk_shadow_set_color(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskShadow *rec = GskShadow_val(self);
    rec->color = *GdkRGBA_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_shadow_set_dx(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskShadow *rec = GskShadow_val(self);
    rec->dx = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_shadow_set_dy(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskShadow *rec = GskShadow_val(self);
    rec->dy = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_shadow_set_radius(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskShadow *rec = GskShadow_val(self);
    rec->radius = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_shadow_make(value v_color, value v_dx, value v_dy, value v_radius)
{
    CAMLparam4(v_color, v_dx, v_dy, v_radius);
    GskShadow *obj = g_new0(GskShadow, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->color = *GdkRGBA_val(v_color);
    obj->dx = Double_val(v_dx);
    obj->dy = Double_val(v_dy);
    obj->radius = Double_val(v_radius);
    CAMLreturn(Val_GskShadow(obj));
}

