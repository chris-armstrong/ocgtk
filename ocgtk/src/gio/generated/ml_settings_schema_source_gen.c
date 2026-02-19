/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SettingsSchemaSource */

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

/* Conversion functions for GSettingsSchemaSource (opaque record with hidden fields) */
GSettingsSchemaSource *GSettingsSchemaSource_val(value v) {
  return *(GSettingsSchemaSource **)Data_custom_val(v);
}

value Val_GSettingsSchemaSource(const GSettingsSchemaSource *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GSettingsSchemaSource_option(const GSettingsSchemaSource *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GSettingsSchemaSource(ptr));
}


CAMLexport CAMLprim value ml_g_settings_schema_source_unref(value self)
{
CAMLparam1(self);

g_settings_schema_source_unref(GSettingsSchemaSource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_schema_source_ref(value self)
{
CAMLparam1(self);

GSettingsSchemaSource* result = g_settings_schema_source_ref(GSettingsSchemaSource_val(self));
CAMLreturn(Val_GSettingsSchemaSource(result));
}

CAMLexport CAMLprim value ml_g_settings_schema_source_lookup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GSettingsSchema* result = g_settings_schema_source_lookup(GSettingsSchemaSource_val(self), String_val(arg1), Bool_val(arg2));
CAMLreturn(Val_option(result, Val_GSettingsSchema));
}
