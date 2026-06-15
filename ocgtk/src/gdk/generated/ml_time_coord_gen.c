/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TimeCoord */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include library-specific type conversions and forward declarations */
#include "gdk_decls.h"

/* Conversion functions for GdkTimeCoord (opaque record with hidden fields) */
GdkTimeCoord *GdkTimeCoord_val(value v) {
  return (GdkTimeCoord *)ml_gir_record_ptr_val(v, "GdkTimeCoord");
}

value Val_GdkTimeCoord(const GdkTimeCoord *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkTimeCoord_option(const GdkTimeCoord *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkTimeCoord(ptr));
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_get_time(value self)
{
    CAMLparam1(self);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    CAMLreturn(Val_uint32(rec->time));
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_get_flags(value self)
{
    CAMLparam1(self);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    CAMLreturn(Val_GdkAxisFlags(rec->flags));
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_get_axes(value self)
{
    CAMLparam1(self);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    CAMLlocal1(arr);
    arr = caml_alloc(12, Double_array_tag);
    for (int i = 0; i < 12; i++)
      Store_double_field(arr, i, rec->axes[i]);
    CAMLreturn(arr);
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_set_time(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    rec->time = UInt32_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_set_flags(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    rec->flags = GdkAxisFlags_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_set_axes(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkTimeCoord *rec = GdkTimeCoord_val(self);
    for (int i = 0; i < 12; i++)
      rec->axes[i] = Double_field(v_val, i);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_time_coord_make(value v_time, value v_flags, value v_axes)
{
    CAMLparam3(v_time, v_flags, v_axes);
    GdkTimeCoord *obj = g_new0(GdkTimeCoord, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->time = UInt32_val(v_time);
    obj->flags = GdkAxisFlags_val(v_flags);
    for (int i = 0; i < 12; i++)
      obj->axes[i] = Double_field(v_axes, i);
    CAMLreturn(Val_GdkTimeCoord(obj));
}

