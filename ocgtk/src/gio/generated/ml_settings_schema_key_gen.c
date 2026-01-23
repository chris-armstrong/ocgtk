/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SettingsSchemaKey */

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

/* Conversion functions for GSettingsSchemaKey (opaque record with hidden fields) */
GSettingsSchemaKey *GSettingsSchemaKey_val(value v) {
  return *(GSettingsSchemaKey **)Data_custom_val(v);
}

value Val_GSettingsSchemaKey(const GSettingsSchemaKey *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GSettingsSchemaKey_option(const GSettingsSchemaKey *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GSettingsSchemaKey(ptr));
}


CAMLexport CAMLprim value ml_g_settings_schema_key_unref(value self)
{
CAMLparam1(self);

g_settings_schema_key_unref(GSettingsSchemaKey_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_schema_key_ref(value self)
{
CAMLparam1(self);

GSettingsSchemaKey* result = g_settings_schema_key_ref(GSettingsSchemaKey_val(self));
CAMLreturn(Val_GSettingsSchemaKey(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_key_get_summary(value self)
{
CAMLparam1(self);

const gchar* result = g_settings_schema_key_get_summary(GSettingsSchemaKey_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_key_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_settings_schema_key_get_name(GSettingsSchemaKey_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_key_get_description(value self)
{
CAMLparam1(self);

const gchar* result = g_settings_schema_key_get_description(GSettingsSchemaKey_val(self));
CAMLreturn(Val_option_string(result));
}
