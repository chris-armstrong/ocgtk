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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GDBusObject */
#ifndef Val_GDBusObject
#define GDBusObject_val(val) ((GDBusObject*)ext_of_val(val))
#define Val_GDBusObject(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusObject */


CAMLexport CAMLprim value ml_g_dbus_object_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_get_object_path(GDBusObject_val(self));
CAMLreturn(caml_copy_string(result));
}
