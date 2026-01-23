/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusPropertyInfo */

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

/* Conversion functions for GDBusPropertyInfo (opaque record with hidden fields) */
GDBusPropertyInfo *GDBusPropertyInfo_val(value v) {
  return *(GDBusPropertyInfo **)Data_custom_val(v);
}

value Val_GDBusPropertyInfo(const GDBusPropertyInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GDBusPropertyInfo_option(const GDBusPropertyInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusPropertyInfo(ptr));
}


CAMLexport CAMLprim value ml_g_dbus_property_info_unref(value self)
{
CAMLparam1(self);

g_dbus_property_info_unref(GDBusPropertyInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_property_info_ref(value self)
{
CAMLparam1(self);

GDBusPropertyInfo* result = g_dbus_property_info_ref(GDBusPropertyInfo_val(self));
CAMLreturn(Val_GDBusPropertyInfo(result));
}
