/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusProxy */

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


CAMLexport CAMLprim value ml_g_dbus_proxy_set_interface_info(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_proxy_set_interface_info(GDBusProxy_val(self), Option_val(arg1, GDBusInterfaceInfo_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_proxy_set_default_timeout(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_proxy_set_default_timeout(GDBusProxy_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_proxy_get_object_path(GDBusProxy_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_name_owner(value self)
{
CAMLparam1(self);

gchar* result = g_dbus_proxy_get_name_owner(GDBusProxy_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_proxy_get_name(GDBusProxy_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_interface_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_proxy_get_interface_name(GDBusProxy_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_interface_info(value self)
{
CAMLparam1(self);

GDBusInterfaceInfo* result = g_dbus_proxy_get_interface_info(GDBusProxy_val(self));
CAMLreturn(Val_option(result, Val_GDBusInterfaceInfo));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_flags(value self)
{
CAMLparam1(self);

GDBusProxyFlags result = g_dbus_proxy_get_flags(GDBusProxy_val(self));
CAMLreturn(Val_GioDBusProxyFlags(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_default_timeout(value self)
{
CAMLparam1(self);

gint result = g_dbus_proxy_get_default_timeout(GDBusProxy_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_connection(value self)
{
CAMLparam1(self);

GDBusConnection* result = g_dbus_proxy_get_connection(GDBusProxy_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GDBusConnection(result));
}

CAMLexport CAMLprim value ml_g_dbus_proxy_get_cached_property_names(value self)
{
CAMLparam1(self);

gchar** result = g_dbus_proxy_get_cached_property_names(GDBusProxy_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_bus_type(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    GBusType prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-bus-type");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_bus_type: property 'g-bus-type' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-bus-type", &prop_gvalue);
          prop_value = (GBusType)g_value_get_enum(&prop_gvalue);

      result = Val_GioBusType(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_connection(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    GDBusConnection *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-connection");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_connection: property 'g-connection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-connection", &prop_gvalue);
          prop_value = (GDBusConnection*)g_value_get_object(&prop_gvalue);

      result = Val_GDBusConnection(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_default_timeout(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-default-timeout");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_default_timeout: property 'g-default-timeout' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-default-timeout", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_set_g_default_timeout(value self, value new_value)
{
    CAMLparam2(self, new_value);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-default-timeout");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_set_g_default_timeout: property 'g-default-timeout' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "g-default-timeout", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_flags(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    GDBusProxyFlags prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-flags");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_flags: property 'g-flags' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-flags", &prop_gvalue);
          prop_value = (GDBusProxyFlags)g_value_get_flags(&prop_gvalue);

      result = Val_GioDBusProxyFlags(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_interface_info(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    GDBusInterfaceInfo *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-interface-info");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_interface_info: property 'g-interface-info' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-interface-info", &prop_gvalue);
          prop_value = (GDBusInterfaceInfo*)g_value_get_boxed(&prop_gvalue);

      result = Val_GDBusInterfaceInfo(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_set_g_interface_info(value self, value new_value)
{
    CAMLparam2(self, new_value);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    GDBusInterfaceInfo *c_value = GDBusInterfaceInfo_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-interface-info");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_set_g_interface_info: property 'g-interface-info' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boxed(&prop_gvalue, &c_value);
g_object_set_property(G_OBJECT(obj), "g-interface-info", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_interface_name(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-interface-name");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_interface_name: property 'g-interface-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-interface-name", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_name(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-name");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_name: property 'g-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-name", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_name_owner(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-name-owner");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_name_owner: property 'g-name-owner' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-name-owner", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_d_bus_proxy_get_g_object_path(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDBusProxy *obj = (GDBusProxy *)GDBusProxy_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "g-object-path");
if (pspec == NULL) caml_failwith("ml_gtk_d_bus_proxy_get_g_object_path: property 'g-object-path' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "g-object-path", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
