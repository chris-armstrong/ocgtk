/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusNodeInfo */

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

/* Conversion functions for GDBusNodeInfo (opaque record with hidden fields) */
GDBusNodeInfo *GDBusNodeInfo_val(value v) {
  return *(GDBusNodeInfo **)Data_custom_val(v);
}

value Val_GDBusNodeInfo(const GDBusNodeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GDBusNodeInfo_option(const GDBusNodeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusNodeInfo(ptr));
}


CAMLexport CAMLprim value ml_g_dbus_node_info_unref(value self)
{
CAMLparam1(self);

g_dbus_node_info_unref(GDBusNodeInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_node_info_ref(value self)
{
CAMLparam1(self);

GDBusNodeInfo* result = g_dbus_node_info_ref(GDBusNodeInfo_val(self));
CAMLreturn(Val_GDBusNodeInfo(result));
}

CAMLexport CAMLprim value ml_g_dbus_node_info_lookup_interface(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusInterfaceInfo* result = g_dbus_node_info_lookup_interface(GDBusNodeInfo_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusInterfaceInfo));
}
