/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusInterface */

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


CAMLexport CAMLprim value ml_g_dbus_interface_set_object(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dbus_interface_set_object(GDBusInterface_val(self), Option_val(arg1, GDBusObject_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_interface_get_info(value self)
{
CAMLparam1(self);

GDBusInterfaceInfo* result = g_dbus_interface_get_info(GDBusInterface_val(self));
CAMLreturn(Val_GDBusInterfaceInfo(result));
}

#if GLIB_CHECK_VERSION(2,32,0)

CAMLexport CAMLprim value ml_g_dbus_interface_dup_object(value self)
{
CAMLparam1(self);

GDBusObject* result = g_dbus_interface_dup_object(GDBusInterface_val(self));
CAMLreturn(Val_option(result, Val_GDBusObject));
}

#else

CAMLexport CAMLprim value ml_g_dbus_interface_dup_object(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusInterface requires GLib >= 2.32");
return Val_unit;
}
#endif

#else


CAMLexport CAMLprim value ml_g_dbus_interface_dup_object(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusInterface requires GLib >= 2.30");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_dbus_interface_get_info(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusInterface requires GLib >= 2.30");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_dbus_interface_set_object(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("DBusInterface requires GLib >= 2.30");
return Val_unit;
}


#endif
