/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ContentSerializer */

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


CAMLexport CAMLprim value ml_gdk_content_serializer_return_success(value self)
{
CAMLparam1(self);

gdk_content_serializer_return_success(GdkContentSerializer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_content_serializer_get_priority(value self)
{
CAMLparam1(self);

int result = gdk_content_serializer_get_priority(GdkContentSerializer_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_content_serializer_get_mime_type(value self)
{
CAMLparam1(self);

const char* result = gdk_content_serializer_get_mime_type(GdkContentSerializer_val(self));
CAMLreturn(caml_copy_string(result));
}
