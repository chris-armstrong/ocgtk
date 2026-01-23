/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DmabufFormats */

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

/* Conversion functions for GdkDmabufFormats (opaque record with hidden fields) */
GdkDmabufFormats *GdkDmabufFormats_val(value v) {
  return *(GdkDmabufFormats **)Data_custom_val(v);
}

value Val_GdkDmabufFormats(const GdkDmabufFormats *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkDmabufFormats_option(const GdkDmabufFormats *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkDmabufFormats(ptr));
}


CAMLexport CAMLprim value ml_gdk_dmabuf_formats_unref(value self)
{
CAMLparam1(self);

gdk_dmabuf_formats_unref(GdkDmabufFormats_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_formats_ref(value self)
{
CAMLparam1(self);

GdkDmabufFormats* result = gdk_dmabuf_formats_ref(GdkDmabufFormats_val(self));
CAMLreturn(Val_GdkDmabufFormats(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_formats_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_dmabuf_formats_equal(GdkDmabufFormats_val(self), Option_val(arg1, GdkDmabufFormats_val, NULL));
CAMLreturn(Val_bool(result));
}
