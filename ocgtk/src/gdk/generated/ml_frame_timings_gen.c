/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FrameTimings */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkFrameTimings (opaque record with hidden fields) */
GdkFrameTimings *GdkFrameTimings_val(value v) {
  return *(GdkFrameTimings **)Data_custom_val(v);
}

value Val_GdkFrameTimings(const GdkFrameTimings *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkFrameTimings_option(const GdkFrameTimings *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkFrameTimings(ptr));
}


CAMLexport CAMLprim value ml_gdk_frame_timings_unref(value self)
{
CAMLparam1(self);

gdk_frame_timings_unref(GdkFrameTimings_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_frame_timings_ref(value self)
{
CAMLparam1(self);

GdkFrameTimings* result = gdk_frame_timings_ref(GdkFrameTimings_val(self));
CAMLreturn(Val_GdkFrameTimings(result));
}

CAMLexport CAMLprim value ml_gdk_frame_timings_get_complete(value self)
{
CAMLparam1(self);

gboolean result = gdk_frame_timings_get_complete(GdkFrameTimings_val(self));
CAMLreturn(Val_bool(result));
}
