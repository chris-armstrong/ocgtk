/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DebugControllerDBus */

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

/* Type-specific conversion macros for GDebugControllerDBus */
#ifndef Val_GDebugControllerDBus
#define GDebugControllerDBus_val(val) ((GDebugControllerDBus*)ext_of_val(val))
#define Val_GDebugControllerDBus(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDebugControllerDBus */


CAMLexport CAMLprim value ml_g_debug_controller_dbus_stop(value self)
{
CAMLparam1(self);

g_debug_controller_dbus_stop(GDebugControllerDBus_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_debug_controller_d_bus_get_connection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GDebugControllerDBus *obj = (GDebugControllerDBus *)GDebugControllerDBus_val(self);
    GDBusConnection *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "connection");
if (pspec == NULL) caml_failwith("ml_gtk_debug_controller_d_bus_get_connection: property 'connection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "connection", &prop_gvalue);
    caml_failwith("ml_gtk_debug_controller_d_bus_get_connection: unsupported property type 'connection'");

result = Val_GDBusConnection(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
