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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


#if GLIB_CHECK_VERSION(2,30,0)

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_manager_get_object_path(GDBusObjectManager_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object_path(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusObjectManager requires GLib >= 2.30");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,30,0)

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusObject* result = g_dbus_object_manager_get_object(GDBusObjectManager_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusObject));
}

#else

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("DBusObjectManager requires GLib >= 2.30");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,30,0)

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_interface(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GDBusInterface* result = g_dbus_object_manager_get_interface(GDBusObjectManager_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_option(result, Val_GDBusInterface));
}

#else

CAMLexport CAMLprim value ml_g_dbus_object_manager_get_interface(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
(void)self;
(void)arg1;
(void)arg2;
caml_failwith("DBusObjectManager requires GLib >= 2.30");
return Val_unit;
}
#endif
