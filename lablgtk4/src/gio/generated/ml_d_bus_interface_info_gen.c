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

/* Type-specific conversion macros for GDBusInterfaceInfo */
#ifndef Val_GDBusInterfaceInfo
#define GDBusInterfaceInfo_val(val) ((GDBusInterfaceInfo*)ext_of_val(val))
#define Val_GDBusInterfaceInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusInterfaceInfo */


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
