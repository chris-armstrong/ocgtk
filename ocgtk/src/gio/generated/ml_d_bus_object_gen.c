/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusObject */

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

CAMLexport CAMLprim value ml_g_dbus_object_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_get_object_path(GDBusObject_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_g_dbus_object_get_object_path(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusObject requires GLib >= 2.30");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,30,0)

CAMLexport CAMLprim value ml_g_dbus_object_get_interface(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusInterface* result = g_dbus_object_get_interface(GDBusObject_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusInterface));
}

#else

CAMLexport CAMLprim value ml_g_dbus_object_get_interface(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("DBusObject requires GLib >= 2.30");
return Val_unit;
}
#endif
CAMLexport CAMLprim value ml_gio_d_bus_object_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_DBUS_OBJECT)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GDBusObject");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GDBusObject((GDBusObject*)gobj));
}
