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

CAMLexport CAMLprim value ml_g_app_info_set_as_default_for_extension(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_set_as_default_for_extension(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_remove_supports_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_remove_supports_type(GAppInfo_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_launch_uris_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_app_info_launch_uris_finish(GAppInfo_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_app_info_get_supported_types(value self)
{
CAMLparam1(self);

const char** result = g_app_info_get_supported_types(GAppInfo_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
CAMLreturn(ml_result);
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

CAMLexport CAMLprim value ml_g_app_info_get_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_app_info_get_icon(GAppInfo_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GIcon));
}

CAMLexport CAMLprim value ml_g_app_info_get_executable(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_executable(GAppInfo_val(self));
CAMLreturn(caml_copy_string(result));
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

CAMLexport CAMLprim value ml_g_app_info_get_commandline(value self)
{
CAMLparam1(self);

const char* result = g_app_info_get_commandline(GAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_app_info_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_app_info_equal(GAppInfo_val(self), GAppInfo_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_app_info_dup(value self)
{
CAMLparam1(self);

GAppInfo* result = g_app_info_dup(GAppInfo_val(self));
CAMLreturn(Val_GAppInfo(result));
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
