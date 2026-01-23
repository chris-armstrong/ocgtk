/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOExtension */

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

/* Conversion functions for GIOExtension (opaque record with hidden fields) */
GIOExtension *GIOExtension_val(value v) {
  return *(GIOExtension **)Data_custom_val(v);
}

value Val_GIOExtension(const GIOExtension *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GIOExtension_option(const GIOExtension *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GIOExtension(ptr));
}


CAMLexport CAMLprim value ml_g_io_extension_get_priority(value self)
{
CAMLparam1(self);

gint result = g_io_extension_get_priority(GIOExtension_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_io_extension_get_name(value self)
{
CAMLparam1(self);

const char* result = g_io_extension_get_name(GIOExtension_val(self));
CAMLreturn(caml_copy_string(result));
}
