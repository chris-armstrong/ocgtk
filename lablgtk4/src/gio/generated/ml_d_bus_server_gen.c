/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusServer */

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


CAMLexport CAMLprim value ml_g_dbus_server_stop(value self)
{
CAMLparam1(self);

g_dbus_server_stop(GDBusServer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_server_start(value self)
{
CAMLparam1(self);

g_dbus_server_start(GDBusServer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_server_is_active(value self)
{
CAMLparam1(self);

gboolean result = g_dbus_server_is_active(GDBusServer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_server_get_guid(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_server_get_guid(GDBusServer_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_server_get_flags(value self)
{
CAMLparam1(self);

GDBusServerFlags result = g_dbus_server_get_flags(GDBusServer_val(self));
CAMLreturn(Val_GioDBusServerFlags(result));
}

CAMLexport CAMLprim value ml_g_dbus_server_get_client_address(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_server_get_client_address(GDBusServer_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_d_bus_server_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusServer *obj = (GDBusServer *)GDBusServer_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_server_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_server_get_address(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusServer *obj = (GDBusServer *)GDBusServer_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "address");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_server_get_address: property 'address' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "address", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_server_get_authentication_observer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusServer *obj = (GDBusServer *)GDBusServer_val(self);
    GDBusAuthObserver *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "authentication-observer");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_server_get_authentication_observer: property 'authentication-observer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "authentication-observer", &prop_gvalue);
    caml_failwith("ml_gtk_d_bus_server_get_authentication_observer: unsupported property type 'authentication-observer'");

result = Val_GDBusAuthObserver(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
