/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ContentDeserializer */

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
/* Include library-specific type conversions and forward declarations */
#include "gdk_decls.h"


CAMLexport CAMLprim value ml_gdk_content_deserializer_return_success(value self)
{
CAMLparam1(self);

gdk_content_deserializer_return_success(GdkContentDeserializer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_content_deserializer_get_priority(value self)
{
CAMLparam1(self);

int result = gdk_content_deserializer_get_priority(GdkContentDeserializer_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_content_deserializer_get_mime_type(value self)
{
CAMLparam1(self);

const char* result = gdk_content_deserializer_get_mime_type(GdkContentDeserializer_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_content_deserializer_get_input_stream(value self)
{
CAMLparam1(self);

GInputStream* result = gdk_content_deserializer_get_input_stream(GdkContentDeserializer_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GInputStream(result));
}

CAMLexport CAMLprim value ml_gdk_content_deserializer_get_cancellable(value self)
{
CAMLparam1(self);

GCancellable* result = gdk_content_deserializer_get_cancellable(GdkContentDeserializer_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GCancellable));
}
