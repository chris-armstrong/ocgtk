/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ContentFormats */

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

/* Conversion functions for GdkContentFormats (opaque record with hidden fields) */
GdkContentFormats *GdkContentFormats_val(value v) {
  return *(GdkContentFormats **)Data_custom_val(v);
}

value Val_GdkContentFormats(const GdkContentFormats *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkContentFormats_option(const GdkContentFormats *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkContentFormats(ptr));
}


CAMLexport CAMLprim value ml_gdk_content_formats_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
    char** c_arg1 = NULL;
    
    if (Is_some(arg1)) {
        value array = Some_val(arg1);
        int arg1_length = Wosize_val(array);
        c_arg1 = (char**)g_malloc(sizeof(char*) * arg1_length);
        for (int i = 0; i < arg1_length; i++) {
          c_arg1[i] = String_val(Field(array, i));
        }
    }

GdkContentFormats *obj = gdk_content_formats_new(c_arg1, Int_val(arg2));

    if (c_arg1) g_free(c_arg1);
CAMLreturn(Val_GdkContentFormats(obj));
}
CAMLexport CAMLprim value ml_gdk_content_formats_unref(value self)
{
CAMLparam1(self);

gdk_content_formats_unref(GdkContentFormats_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_content_formats_union_serialize_mime_types(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_union_serialize_mime_types(GdkContentFormats_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_union_serialize_gtypes(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_union_serialize_gtypes(GdkContentFormats_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_union_deserialize_mime_types(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_union_deserialize_mime_types(GdkContentFormats_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_union_deserialize_gtypes(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_union_deserialize_gtypes(GdkContentFormats_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_union(value self, value arg1)
{
CAMLparam2(self, arg1);

GdkContentFormats* result = gdk_content_formats_union(GdkContentFormats_val(self), GdkContentFormats_val(arg1));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_to_string(value self)
{
CAMLparam1(self);

char* result = gdk_content_formats_to_string(GdkContentFormats_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_ref(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_formats_ref(GdkContentFormats_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_match_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gdk_content_formats_match_mime_type(GdkContentFormats_val(self), GdkContentFormats_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_match(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_content_formats_match(GdkContentFormats_val(self), GdkContentFormats_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_content_formats_contain_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_content_formats_contain_mime_type(GdkContentFormats_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}
