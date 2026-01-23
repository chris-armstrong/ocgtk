/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DesktopAppInfo */

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


CAMLexport CAMLprim value ml_g_desktop_app_info_new(value arg1)
{
CAMLparam1(arg1);

GDesktopAppInfo *obj = g_desktop_app_info_new(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GDesktopAppInfo(obj));
}
CAMLexport CAMLprim value ml_g_desktop_app_info_new_from_filename(value arg1)
{
CAMLparam1(arg1);

GDesktopAppInfo *obj = g_desktop_app_info_new_from_filename(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GDesktopAppInfo(obj));
}
CAMLexport CAMLprim value ml_g_desktop_app_info_list_actions(value self)
{
CAMLparam1(self);

const gchar* const* result = g_desktop_app_info_list_actions(GDesktopAppInfo_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_g_desktop_app_info_launch_action(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_desktop_app_info_launch_action(GDesktopAppInfo_val(self), String_val(arg1), Option_val(arg2, GAppLaunchContext_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_desktop_app_info_has_key(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_desktop_app_info_has_key(GDesktopAppInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_string(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_desktop_app_info_get_string(GDesktopAppInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_startup_wm_class(value self)
{
CAMLparam1(self);

const char* result = g_desktop_app_info_get_startup_wm_class(GDesktopAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_show_in(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_desktop_app_info_get_show_in(GDesktopAppInfo_val(self), String_option_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_nodisplay(value self)
{
CAMLparam1(self);

gboolean result = g_desktop_app_info_get_nodisplay(GDesktopAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_locale_string(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_desktop_app_info_get_locale_string(GDesktopAppInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_keywords(value self)
{
CAMLparam1(self);

const char* const* result = g_desktop_app_info_get_keywords(GDesktopAppInfo_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_is_hidden(value self)
{
CAMLparam1(self);

gboolean result = g_desktop_app_info_get_is_hidden(GDesktopAppInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_generic_name(value self)
{
CAMLparam1(self);

const char* result = g_desktop_app_info_get_generic_name(GDesktopAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_filename(value self)
{
CAMLparam1(self);

const char* result = g_desktop_app_info_get_filename(GDesktopAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_categories(value self)
{
CAMLparam1(self);

const char* result = g_desktop_app_info_get_categories(GDesktopAppInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_boolean(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_desktop_app_info_get_boolean(GDesktopAppInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_desktop_app_info_get_action_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gchar* result = g_desktop_app_info_get_action_name(GDesktopAppInfo_val(self), String_val(arg1));
CAMLreturn(caml_copy_string(result));
}
