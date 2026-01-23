/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOExtensionPoint */

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

/* Conversion functions for GIOExtensionPoint (opaque record with hidden fields) */
GIOExtensionPoint *GIOExtensionPoint_val(value v) {
  return *(GIOExtensionPoint **)Data_custom_val(v);
}

value Val_GIOExtensionPoint(const GIOExtensionPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GIOExtensionPoint_option(const GIOExtensionPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GIOExtensionPoint(ptr));
}


CAMLexport CAMLprim value ml_g_io_extension_point_get_extension_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);

GIOExtension* result = g_io_extension_point_get_extension_by_name(GIOExtensionPoint_val(self), String_val(arg1));
CAMLreturn(Val_GIOExtension(result));
}
