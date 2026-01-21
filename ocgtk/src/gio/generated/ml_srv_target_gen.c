/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SrvTarget */

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

/* Conversion functions for GSrvTarget (opaque record with hidden fields) */
GSrvTarget *GSrvTarget_val(value v) {
  return *(GSrvTarget **)Data_custom_val(v);
}

value Val_GSrvTarget(const GSrvTarget *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GSrvTarget_option(const GSrvTarget *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GSrvTarget(ptr));
}


CAMLexport CAMLprim value ml_g_srv_target_get_hostname(value self)
{
CAMLparam1(self);

const gchar* result = g_srv_target_get_hostname(GSrvTarget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_srv_target_free(value self)
{
CAMLparam1(self);

g_srv_target_free(GSrvTarget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_srv_target_copy(value self)
{
CAMLparam1(self);

GSrvTarget* result = g_srv_target_copy(GSrvTarget_val(self));
CAMLreturn(Val_GSrvTarget(result));
}
