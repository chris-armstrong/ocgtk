/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppInfo */

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

/* Type-specific conversion macros for GAppInfo */
#ifndef Val_GAppInfo
#define GAppInfo_val(val) ((GAppInfo*)ext_of_val(val))
#define Val_GAppInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GAppInfo */


CAMLexport CAMLprim value ml_g_app_info_supports_uris(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_supports_uris(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_supports_files(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_supports_files(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_should_show(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_should_show(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_set_as_last_used_for_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_set_as_last_used_for_type(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_set_as_default_for_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_set_as_default_for_type(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_remove_supports_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_remove_supports_type(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_get_name(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_name(GAppInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_app_info_get_id(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_id(GAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_app_info_get_display_name(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_display_name(GAppInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_app_info_get_description(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_description(GAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_app_info_delete(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_delete(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_can_remove_supports_type(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_can_remove_supports_type(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_can_delete(value self)
{
CAMLparam1(self);

gboolean result = g_app_info_can_delete(GAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_add_supports_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_add_supports_type(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
