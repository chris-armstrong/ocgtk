/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusMethodInvocation */

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

/* Type-specific conversion macros for GDBusMethodInvocation */
#ifndef Val_GDBusMethodInvocation
#define GDBusMethodInvocation_val(val) ((GDBusMethodInvocation*)ext_of_val(val))
#define Val_GDBusMethodInvocation(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusMethodInvocation */


CAMLexport CAMLprim value ml_g_dbus_method_invocation_return_dbus_error(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_dbus_method_invocation_return_dbus_error(GDBusMethodInvocation_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_sender(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_method_invocation_get_sender(GDBusMethodInvocation_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_property_info(value self)
{
CAMLparam1(self);

const GDBusPropertyInfo* result = g_dbus_method_invocation_get_property_info(GDBusMethodInvocation_val(self));
CAMLreturn(Val_option(result, Val_GDBusPropertyInfo));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_method_invocation_get_object_path(GDBusMethodInvocation_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_method_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_method_invocation_get_method_name(GDBusMethodInvocation_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_method_info(value self)
{
CAMLparam1(self);

const GDBusMethodInfo* result = g_dbus_method_invocation_get_method_info(GDBusMethodInvocation_val(self));
CAMLreturn(Val_option(result, Val_GDBusMethodInfo));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_message(value self)
{
CAMLparam1(self);

GDBusMessage* result = g_dbus_method_invocation_get_message(GDBusMethodInvocation_val(self));
CAMLreturn(Val_GDBusMessage(result));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_interface_name(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_method_invocation_get_interface_name(GDBusMethodInvocation_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_method_invocation_get_connection(value self)
{
CAMLparam1(self);

GDBusConnection* result = g_dbus_method_invocation_get_connection(GDBusMethodInvocation_val(self));
CAMLreturn(Val_GDBusConnection(result));
}
