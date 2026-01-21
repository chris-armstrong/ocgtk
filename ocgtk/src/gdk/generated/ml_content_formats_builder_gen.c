/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ContentFormatsBuilder */

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

/* Conversion functions for GdkContentFormatsBuilder (opaque record with hidden fields) */
GdkContentFormatsBuilder *GdkContentFormatsBuilder_val(value v) {
  return *(GdkContentFormatsBuilder **)Data_custom_val(v);
}

value Val_GdkContentFormatsBuilder(const GdkContentFormatsBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkContentFormatsBuilder_option(const GdkContentFormatsBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkContentFormatsBuilder(ptr));
}


CAMLexport CAMLprim value ml_gdk_content_formats_builder_new(value unit)
{
CAMLparam1(unit);

GdkContentFormatsBuilder *obj = gdk_content_formats_builder_new();

CAMLreturn(Val_GdkContentFormatsBuilder(obj));
}
CAMLexport CAMLprim value ml_gdk_content_formats_builder_unref(value self)
{
CAMLparam1(self);

gdk_content_formats_builder_unref(GdkContentFormatsBuilder_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_content_formats_builder_to_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_builder_to_formats(GdkContentFormatsBuilder_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_builder_ref(value self)
{
CAMLparam1(self);

GdkContentFormatsBuilder* result = gdk_content_formats_builder_ref(GdkContentFormatsBuilder_val(self));
CAMLreturn(Val_GdkContentFormatsBuilder(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_builder_free_to_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_builder_free_to_formats(GdkContentFormatsBuilder_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_builder_add_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_content_formats_builder_add_mime_type(GdkContentFormatsBuilder_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_content_formats_builder_add_formats(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_content_formats_builder_add_formats(GdkContentFormatsBuilder_val(self), GdkContentFormats_val(arg1));
CAMLreturn(Val_unit);
}
