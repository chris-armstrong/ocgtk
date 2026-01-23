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

/* Conversion functions for GDBusMethodInfo (opaque record with hidden fields) */
GDBusMethodInfo *GDBusMethodInfo_val(value v) {
  return *(GDBusMethodInfo **)Data_custom_val(v);
}

value Val_GDBusMethodInfo(const GDBusMethodInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GDBusMethodInfo_option(const GDBusMethodInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusMethodInfo(ptr));
}


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
