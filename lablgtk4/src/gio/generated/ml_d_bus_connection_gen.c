/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusConnection */

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


CAMLexport CAMLprim value ml_g_dbus_connection_unregister_subtree(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_dbus_connection_unregister_subtree(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_unregister_object(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_dbus_connection_unregister_object(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_unexport_menu_model(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_connection_unexport_menu_model(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_unexport_action_group(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_connection_unexport_action_group(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_start_message_processing(value self)
{
CAMLparam1(self);

g_dbus_connection_start_message_processing(GDBusConnection_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_signal_unsubscribe(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_connection_signal_unsubscribe(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_set_exit_on_close(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_connection_set_exit_on_close(GDBusConnection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_send_message_with_reply_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GDBusMessage* result = g_dbus_connection_send_message_with_reply_finish(GDBusConnection_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GDBusMessage(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_remove_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_connection_remove_filter(GDBusConnection_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_connection_is_closed(value self)
{
CAMLparam1(self);

gboolean result = g_dbus_connection_is_closed(GDBusConnection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_unique_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_connection_get_unique_name(GDBusConnection_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_stream(value self)
{
CAMLparam1(self);

GIOStream* result = g_dbus_connection_get_stream(GDBusConnection_val(self));
CAMLreturn(Val_GIOStream(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_peer_credentials(value self)
{
CAMLparam1(self);

GCredentials* result = g_dbus_connection_get_peer_credentials(GDBusConnection_val(self));
CAMLreturn(Val_option(result, Val_GCredentials));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_guid(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_connection_get_guid(GDBusConnection_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_flags(value self)
{
CAMLparam1(self);

GDBusConnectionFlags result = g_dbus_connection_get_flags(GDBusConnection_val(self));
CAMLreturn(Val_GioDBusConnectionFlags(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_exit_on_close(value self)
{
CAMLparam1(self);

gboolean result = g_dbus_connection_get_exit_on_close(GDBusConnection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_get_capabilities(value self)
{
CAMLparam1(self);

GDBusCapabilityFlags result = g_dbus_connection_get_capabilities(GDBusConnection_val(self));
CAMLreturn(Val_GioDBusCapabilityFlags(result));
}

CAMLexport CAMLprim value ml_g_dbus_connection_flush_sync(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dbus_connection_flush_sync(GDBusConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_flush_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dbus_connection_flush_finish(GDBusConnection_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_export_menu_model(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

guint result = g_dbus_connection_export_menu_model(GDBusConnection_val(self), String_val(arg1), GMenuModel_val(arg2), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_export_action_group(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

guint result = g_dbus_connection_export_action_group(GDBusConnection_val(self), String_val(arg1), GActionGroup_val(arg2), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_close_sync(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dbus_connection_close_sync(GDBusConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dbus_connection_close_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dbus_connection_close_finish(GDBusConnection_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_d_bus_connection_get_address(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusConnection *obj = (GDBusConnection *)GDBusConnection_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "address");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_connection_get_address: property 'address' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "address", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_connection_get_authentication_observer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusConnection *obj = (GDBusConnection *)GDBusConnection_val(self);
    GDBusAuthObserver *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "authentication-observer");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_connection_get_authentication_observer: property 'authentication-observer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "authentication-observer", &prop_gvalue);
    caml_failwith("ml_gtk_d_bus_connection_get_authentication_observer: unsupported property type 'authentication-observer'");

result = Val_GDBusAuthObserver(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_connection_get_closed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusConnection *obj = (GDBusConnection *)GDBusConnection_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "closed");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_connection_get_closed: property 'closed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "closed", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
