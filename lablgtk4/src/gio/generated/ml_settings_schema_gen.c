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

/* Type-specific conversion macros for GSettingsSchema */
#ifndef Val_GSettingsSchema
#define GSettingsSchema_val(val) ((GSettingsSchema*)ext_of_val(val))
#define Val_GSettingsSchema(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSettingsSchema */


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
