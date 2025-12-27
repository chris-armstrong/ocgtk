/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusObjectManager */

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


CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_manager_get_object_path(GDBusObjectManager_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusObject* result = g_dbus_object_manager_get_object(GDBusObjectManager_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusObject));
}

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_interface(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GDBusInterface* result = g_dbus_object_manager_get_interface(GDBusObjectManager_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_option(result, Val_GDBusInterface));
}
