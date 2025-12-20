/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusInterfaceSkeleton */

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

/* Type-specific conversion macros for GDBusInterfaceSkeleton */
#ifndef Val_GDBusInterfaceSkeleton
#define GDBusInterfaceSkeleton_val(val) ((GDBusInterfaceSkeleton*)ext_of_val(val))
#define Val_GDBusInterfaceSkeleton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusInterfaceSkeleton */


CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_unexport_from_connection(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_interface_skeleton_unexport_from_connection(GDBusInterfaceSkeleton_val(self), GDBusConnection_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_unexport(value self)
{
CAMLparam1(self);

g_dbus_interface_skeleton_unexport(GDBusInterfaceSkeleton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_has_connection(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_dbus_interface_skeleton_has_connection(GDBusInterfaceSkeleton_val(self), GDBusConnection_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_interface_skeleton_get_object_path(GDBusInterfaceSkeleton_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_get_info(value self)
{
CAMLparam1(self);

GDBusInterfaceInfo* result = g_dbus_interface_skeleton_get_info(GDBusInterfaceSkeleton_val(self));
CAMLreturn(Val_GDBusInterfaceInfo(result));
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_get_connection(value self)
{
CAMLparam1(self);

GDBusConnection* result = g_dbus_interface_skeleton_get_connection(GDBusInterfaceSkeleton_val(self));
CAMLreturn(Val_option(result, Val_GDBusConnection));
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_flush(value self)
{
CAMLparam1(self);

g_dbus_interface_skeleton_flush(GDBusInterfaceSkeleton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_skeleton_export(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = g_dbus_interface_skeleton_export(GDBusInterfaceSkeleton_val(self), GDBusConnection_val(arg1), String_val(arg2), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
