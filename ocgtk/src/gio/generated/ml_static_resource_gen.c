/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StaticResource */

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

/* Conversion functions for GStaticResource (opaque record with hidden fields) */
GStaticResource *GStaticResource_val(value v) {
  return *(GStaticResource **)Data_custom_val(v);
}

value Val_GStaticResource(const GStaticResource *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GStaticResource_option(const GStaticResource *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GStaticResource(ptr));
}


CAMLexport CAMLprim value ml_g_static_resource_init(value self)
{
CAMLparam1(self);

g_static_resource_init(GStaticResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_static_resource_get_resource(value self)
{
CAMLparam1(self);

GResource* result = g_static_resource_get_resource(GStaticResource_val(self));
CAMLreturn(Val_GResource(result));
}

CAMLexport CAMLprim value ml_g_static_resource_fini(value self)
{
CAMLparam1(self);

g_static_resource_fini(GStaticResource_val(self));
CAMLreturn(Val_unit);
}
