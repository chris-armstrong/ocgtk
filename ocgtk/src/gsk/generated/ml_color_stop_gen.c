/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorStop */

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

/* Conversion functions for GskColorStop (opaque record with hidden fields) */
GskColorStop *GskColorStop_val(value v) {
  return (GskColorStop *)ml_gir_record_ptr_val(v, "GskColorStop");
}

value Val_GskColorStop(const GskColorStop *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskColorStop_option(const GskColorStop *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskColorStop(ptr));
}

\
CAMLexport CAMLprim value ml_gsk_color_stop_get_offset(value self)
{
    CAMLparam1(self);
    GskColorStop *rec = GskColorStop_val(self);
    CAMLreturn(caml_copy_double(rec->offset));
}

\
CAMLexport CAMLprim value ml_gsk_color_stop_get_color(value self)
{
    CAMLparam1(self);
    GskColorStop *rec = GskColorStop_val(self);
    CAMLreturn(Val_GdkRGBA(&rec->color));
}

\
CAMLexport CAMLprim value ml_gsk_color_stop_set_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskColorStop *rec = GskColorStop_val(self);
    rec->offset = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_color_stop_set_color(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskColorStop *rec = GskColorStop_val(self);
    rec->color = *GdkRGBA_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_color_stop_make(value v_offset, value v_color)
{
    CAMLparam2(v_offset, v_color);
    GskColorStop *obj = g_new0(GskColorStop, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->offset = Double_val(v_offset);
    obj->color = *GdkRGBA_val(v_color);
    CAMLreturn(Val_GskColorStop(obj));
}

