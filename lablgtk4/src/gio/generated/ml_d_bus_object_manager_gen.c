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

/* Type-specific conversion macros for GDBusObjectManager */
#ifndef Val_GDBusObjectManager
#define GDBusObjectManager_val(val) ((GDBusObjectManager*)ext_of_val(val))
#define Val_GDBusObjectManager(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusObjectManager */


CAMLexport CAMLprim value ml_g_dbus_object_manager_get_object_path(value self)
{
CAMLparam1(self);

const gchar* result = g_dbus_object_manager_get_object_path(GDBusObjectManager_val(self));
CAMLreturn(caml_copy_string(result));
}
