/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusObjectManagerClient */

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

/* Type-specific conversion macros for GDBusObjectManagerClient */
#ifndef Val_GDBusObjectManagerClient
#define GDBusObjectManagerClient_val(val) ((GDBusObjectManagerClient*)ext_of_val(val))
#define Val_GDBusObjectManagerClient(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusObjectManagerClient */


CAMLexport CAMLprim value ml_g_dbus_object_manager_client_get_name_owner(value self)
{
CAMLparam1(self);

gchar* result = g_dbus_object_manager_client_get_name_owner(GDBusObjectManagerClient_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_object_manager_client_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_manager_client_get_name(GDBusObjectManagerClient_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_object_manager_client_get_connection(value self)
{
CAMLparam1(self);

GDBusConnection* result = g_dbus_object_manager_client_get_connection(GDBusObjectManagerClient_val(self));
CAMLreturn(Val_GDBusConnection(result));
}

CAMLexport CAMLprim value ml_gtk_d_bus_object_manager_client_get_bus_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusObjectManagerClient *obj = (GDBusObjectManagerClient *)GDBusObjectManagerClient_val(self);
    GBusType prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "bus-type");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_object_manager_client_get_bus_type: property 'bus-type' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "bus-type", &prop_gvalue);
    prop_value = (GBusType)g_value_get_enum(&prop_gvalue);

result = Val_GioBusType(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_object_manager_client_get_object_path(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDBusObjectManagerClient *obj = (GDBusObjectManagerClient *)GDBusObjectManagerClient_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "object-path");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_object_manager_client_get_object_path: property 'object-path' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "object-path", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
