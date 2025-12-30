/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Settings */

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


CAMLexport CAMLprim value ml_g_settings_new(value arg1)
{
CAMLparam1(arg1);
GSettings *obj = g_settings_new(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSettings(obj));
}

CAMLexport CAMLprim value ml_g_settings_new_full(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GSettings *obj = g_settings_new_full(GSettingsSchema_val(arg1), Option_val(arg2, GSettingsBackend_val, NULL), String_option_val(arg3));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSettings(obj));
}

CAMLexport CAMLprim value ml_g_settings_new_with_backend(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GSettings *obj = g_settings_new_with_backend(String_val(arg1), GSettingsBackend_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSettings(obj));
}

CAMLexport CAMLprim value ml_g_settings_new_with_backend_and_path(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GSettings *obj = g_settings_new_with_backend_and_path(String_val(arg1), GSettingsBackend_val(arg2), String_val(arg3));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSettings(obj));
}

CAMLexport CAMLprim value ml_g_settings_new_with_path(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GSettings *obj = g_settings_new_with_path(String_val(arg1), String_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSettings(obj));
}

CAMLexport CAMLprim value ml_g_settings_set_uint(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_uint(GSettings_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_string(GSettings_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_int(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_int(GSettings_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_flags(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_flags(GSettings_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_enum(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_enum(GSettings_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_double(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_double(GSettings_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_set_boolean(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_settings_set_boolean(GSettings_val(self), String_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_revert(value self)
{
CAMLparam1(self);

g_settings_revert(GSettings_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_reset(value self, value arg1)
{
CAMLparam2(self, arg1);

g_settings_reset(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_is_writable(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_settings_is_writable(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_get_uint(value self, value arg1)
{
CAMLparam2(self, arg1);

guint result = g_settings_get_uint(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_settings_get_string(value self, value arg1)
{
CAMLparam2(self, arg1);

gchar* result = g_settings_get_string(GSettings_val(self), String_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_settings_get_int(value self, value arg1)
{
CAMLparam2(self, arg1);

gint result = g_settings_get_int(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_settings_get_has_unapplied(value self)
{
CAMLparam1(self);

gboolean result = g_settings_get_has_unapplied(GSettings_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_get_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

guint result = g_settings_get_flags(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_settings_get_enum(value self, value arg1)
{
CAMLparam2(self, arg1);

gint result = g_settings_get_enum(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_settings_get_double(value self, value arg1)
{
CAMLparam2(self, arg1);

gdouble result = g_settings_get_double(GSettings_val(self), String_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_g_settings_get_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GSettings* result = g_settings_get_child(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_GSettings(result));
}

CAMLexport CAMLprim value ml_g_settings_get_boolean(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_settings_get_boolean(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_settings_delay(value self)
{
CAMLparam1(self);

g_settings_delay(GSettings_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_create_action(value self, value arg1)
{
CAMLparam2(self, arg1);

GAction* result = g_settings_create_action(GSettings_val(self), String_val(arg1));
CAMLreturn(Val_GAction(result));
}

CAMLexport CAMLprim value ml_g_settings_apply(value self)
{
CAMLparam1(self);

g_settings_apply(GSettings_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_backend(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    GSettingsBackend *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "backend");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_backend: property 'backend' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "backend", &prop_gvalue);
    caml_failwith("ml_gtk_settings_get_backend: unsupported property type 'backend'");

result = Val_GSettingsBackend(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_get_delay_apply(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "delay-apply");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_delay_apply: property 'delay-apply' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "delay-apply", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_get_path(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "path");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_path: property 'path' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "path", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_get_schema(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "schema");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_schema: property 'schema' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "schema", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_get_schema_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "schema-id");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_schema_id: property 'schema-id' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "schema-id", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_get_settings_schema(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSettings *obj = (GSettings *)GSettings_val(self);
    GSettingsSchema *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "settings-schema");
if (pspec == NULL) caml_failwith("ml_gtk_settings_get_settings_schema: property 'settings-schema' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "settings-schema", &prop_gvalue);
    prop_value = (GSettingsSchema*)g_value_get_boxed(&prop_gvalue);

result = Val_GSettingsSchema(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
