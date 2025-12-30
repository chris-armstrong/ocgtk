/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Application */

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


CAMLexport CAMLprim value ml_g_application_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GApplication *obj = g_application_new(String_option_val(arg1), GioApplicationFlags_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GApplication(obj));
}

CAMLexport CAMLprim value ml_g_application_withdraw_notification(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_withdraw_notification(GApplication_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_unmark_busy(value self)
{
CAMLparam1(self);

g_application_unmark_busy(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_version(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_version(GApplication_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_resource_base_path(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_resource_base_path(GApplication_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_option_context_summary(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_option_context_summary(GApplication_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_option_context_parameter_string(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_option_context_parameter_string(GApplication_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_option_context_description(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_option_context_description(GApplication_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_inactivity_timeout(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_inactivity_timeout(GApplication_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_flags(GApplication_val(self), GioApplicationFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_default(value self)
{
CAMLparam1(self);

g_application_set_default(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_application_id(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_application_id(GApplication_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_set_action_group(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_set_action_group(GApplication_val(self), Option_val(arg1, GActionGroup_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_send_notification(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_application_send_notification(GApplication_val(self), String_option_val(arg1), GNotification_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_release(value self)
{
CAMLparam1(self);

g_application_release(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_register(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_application_register(GApplication_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_application_quit(value self)
{
CAMLparam1(self);

g_application_quit(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_mark_busy(value self)
{
CAMLparam1(self);

g_application_mark_busy(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_hold(value self)
{
CAMLparam1(self);

g_application_hold(GApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_get_version(value self)
{
CAMLparam1(self);

const gchar* result = g_application_get_version(GApplication_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_application_get_resource_base_path(value self)
{
CAMLparam1(self);

const gchar* result = g_application_get_resource_base_path(GApplication_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_application_get_is_remote(value self)
{
CAMLparam1(self);

gboolean result = g_application_get_is_remote(GApplication_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_application_get_is_registered(value self)
{
CAMLparam1(self);

gboolean result = g_application_get_is_registered(GApplication_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_application_get_is_busy(value self)
{
CAMLparam1(self);

gboolean result = g_application_get_is_busy(GApplication_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_application_get_inactivity_timeout(value self)
{
CAMLparam1(self);

guint result = g_application_get_inactivity_timeout(GApplication_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_application_get_flags(value self)
{
CAMLparam1(self);

GApplicationFlags result = g_application_get_flags(GApplication_val(self));
CAMLreturn(Val_GioApplicationFlags(result));
}

CAMLexport CAMLprim value ml_g_application_get_dbus_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_application_get_dbus_object_path(GApplication_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_application_get_dbus_connection(value self)
{
CAMLparam1(self);

GDBusConnection* result = g_application_get_dbus_connection(GApplication_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GDBusConnection));
}

CAMLexport CAMLprim value ml_g_application_get_application_id(value self)
{
CAMLparam1(self);

const gchar* result = g_application_get_application_id(GApplication_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_application_activate(value self)
{
CAMLparam1(self);

g_application_activate(GApplication_val(self));
CAMLreturn(Val_unit);
}
