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

CAMLexport CAMLprim value ml_g_settings_schema_source_list_schemas(value self, value arg1)
{
CAMLparam2(self, arg1);
gchar** out2 = NULL;
gchar** out3 = NULL;

g_settings_schema_source_list_schemas(GSettingsSchemaSource_val(self), Bool_val(arg1), &out2, &out3);
    int out2_length = 0;
    while (out2[out2_length] != NULL) out2_length++;
    CAMLlocal1(ml_out2);
    ml_out2 = caml_alloc(out2_length, 0);
    for (int i = 0; i < out2_length; i++) {
      Store_field(ml_out2, i, caml_copy_string(out2[i]));
    }
    int out3_length = 0;
    while (out3[out3_length] != NULL) out3_length++;
    CAMLlocal1(ml_out3);
    ml_out3 = caml_alloc(out3_length, 0);
    for (int i = 0; i < out3_length; i++) {
      Store_field(ml_out3, i, caml_copy_string(out3[i]));
    }

    for (int i = 0; i < out2_length; i++) {
      g_free((gpointer)out2[i]);
    }
    g_free(out2);
    for (int i = 0; i < out3_length; i++) {
      g_free((gpointer)out3[i]);
    }
    g_free(out3);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, ml_out2);
    Store_field(ret, 1, ml_out3);
    CAMLreturn(ret);
}
