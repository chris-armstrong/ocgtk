/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusMethodInfo */

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

/* Type-specific conversion macros for GDBusMethodInfo */
#ifndef Val_GDBusMethodInfo
#define GDBusMethodInfo_val(val) ((GDBusMethodInfo*)ext_of_val(val))
#define Val_GDBusMethodInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusMethodInfo */


CAMLexport CAMLprim value ml_g_dbus_method_info_unref(value self)
{
CAMLparam1(self);

g_dbus_method_info_unref(GDBusMethodInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_method_info_ref(value self)
{
CAMLparam1(self);

GDBusMethodInfo* result = g_dbus_method_info_ref(GDBusMethodInfo_val(self));
CAMLreturn(Val_GDBusMethodInfo(result));
}
