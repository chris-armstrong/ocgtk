/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusArgInfo */

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

/* Conversion functions for GDBusArgInfo (opaque record with hidden fields) */
GDBusArgInfo *GDBusArgInfo_val(value v) {
  return *(GDBusArgInfo **)Data_custom_val(v);
}

value Val_GDBusArgInfo(const GDBusArgInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GDBusArgInfo_option(const GDBusArgInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusArgInfo(ptr));
}


CAMLexport CAMLprim value ml_g_dbus_arg_info_unref(value self)
{
CAMLparam1(self);

g_dbus_arg_info_unref(GDBusArgInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_arg_info_ref(value self)
{
CAMLparam1(self);

GDBusArgInfo* result = g_dbus_arg_info_ref(GDBusArgInfo_val(self));
CAMLreturn(Val_GDBusArgInfo(result));
}
