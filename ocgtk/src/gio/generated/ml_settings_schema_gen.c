/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SettingsSchema */

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

/* Conversion functions for GSettingsSchema (opaque record with hidden fields) */
GSettingsSchema *GSettingsSchema_val(value v) {
  return *(GSettingsSchema **)Data_custom_val(v);
}

value Val_GSettingsSchema(const GSettingsSchema *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GSettingsSchema_option(const GSettingsSchema *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GSettingsSchema(ptr));
}


CAMLexport CAMLprim value ml_g_settings_schema_unref(value self)
{
CAMLparam1(self);

g_settings_schema_unref(GSettingsSchema_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_schema_ref(value self)
{
CAMLparam1(self);

GSettingsSchema* result = g_settings_schema_ref(GSettingsSchema_val(self));
CAMLreturn(Val_GSettingsSchema(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_list_keys(value self)
{
CAMLparam1(self);

gchar** result = g_settings_schema_list_keys(GSettingsSchema_val(self));
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
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_g_settings_schema_list_children(value self)
{
CAMLparam1(self);

gchar** result = g_settings_schema_list_children(GSettingsSchema_val(self));
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
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_g_settings_schema_has_key(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_settings_schema_has_key(GSettingsSchema_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_get_path(value self)
{
CAMLparam1(self);

const gchar* result = g_settings_schema_get_path(GSettingsSchema_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_get_key(value self, value arg1)
{
CAMLparam2(self, arg1);

GSettingsSchemaKey* result = g_settings_schema_get_key(GSettingsSchema_val(self), String_val(arg1));
CAMLreturn(Val_GSettingsSchemaKey(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_get_id(value self)
{
CAMLparam1(self);

const gchar* result = g_settings_schema_get_id(GSettingsSchema_val(self));
CAMLreturn(caml_copy_string(result));
}
