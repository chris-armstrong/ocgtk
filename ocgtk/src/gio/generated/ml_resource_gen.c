/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Resource */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GResource (opaque record with hidden fields) */
GResource *GResource_val(value v) {
  return *(GResource **)Data_custom_val(v);
}

value Val_GResource(const GResource *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GResource_option(const GResource *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GResource(ptr));
}


CAMLexport CAMLprim value ml_g_resource_unref(value self)
{
CAMLparam1(self);

g_resource_unref(GResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resource_ref(value self)
{
CAMLparam1(self);

GResource* result = g_resource_ref(GResource_val(self));
CAMLreturn(Val_GResource(result));
}

CAMLexport CAMLprim value ml_g_resource_open_stream(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GInputStream* result = g_resource_open_stream(GResource_val(self), String_val(arg1), GioResourceLookupFlags_val(arg2), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GInputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_resource_enumerate_children(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

char** result = g_resource_enumerate_children(GResource_val(self), String_val(arg1), GioResourceLookupFlags_val(arg2), &error);
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
if (error == NULL) CAMLreturn(Res_Ok(ml_result)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_resources_unregister(value self)
{
CAMLparam1(self);

g_resources_unregister(GResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resources_register(value self)
{
CAMLparam1(self);

g_resources_register(GResource_val(self));
CAMLreturn(Val_unit);
}
