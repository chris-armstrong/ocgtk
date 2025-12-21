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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GDBusInterface */
#ifndef Val_GDBusInterface
#define GDBusInterface_val(val) ((GDBusInterface*)ext_of_val(val))
#define Val_GDBusInterface(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusInterface */


CAMLexport CAMLprim value ml_g_dbus_interface_get_info(value self)
{
CAMLparam1(self);

GDBusInterfaceInfo* result = g_dbus_interface_get_info(GDBusInterface_val(self));
CAMLreturn(Val_GDBusInterfaceInfo(result));
}
