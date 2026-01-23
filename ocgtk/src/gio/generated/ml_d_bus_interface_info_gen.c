/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusInterfaceInfo */

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

/* Conversion functions for GDBusInterfaceInfo (opaque record with hidden fields) */
GDBusInterfaceInfo *GDBusInterfaceInfo_val(value v) {
  return *(GDBusInterfaceInfo **)Data_custom_val(v);
}

value Val_GDBusInterfaceInfo(const GDBusInterfaceInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GDBusInterfaceInfo_option(const GDBusInterfaceInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusInterfaceInfo(ptr));
}


CAMLexport CAMLprim value ml_g_dbus_interface_info_unref(value self)
{
CAMLparam1(self);

g_dbus_interface_info_unref(GDBusInterfaceInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_ref(value self)
{
CAMLparam1(self);

GDBusInterfaceInfo* result = g_dbus_interface_info_ref(GDBusInterfaceInfo_val(self));
CAMLreturn(Val_GDBusInterfaceInfo(result));
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_lookup_signal(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusSignalInfo* result = g_dbus_interface_info_lookup_signal(GDBusInterfaceInfo_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusSignalInfo));
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_lookup_property(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusPropertyInfo* result = g_dbus_interface_info_lookup_property(GDBusInterfaceInfo_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusPropertyInfo));
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_lookup_method(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusMethodInfo* result = g_dbus_interface_info_lookup_method(GDBusInterfaceInfo_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusMethodInfo));
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_cache_release(value self)
{
CAMLparam1(self);

g_dbus_interface_info_cache_release(GDBusInterfaceInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_info_cache_build(value self)
{
CAMLparam1(self);

g_dbus_interface_info_cache_build(GDBusInterfaceInfo_val(self));
CAMLreturn(Val_unit);
}
