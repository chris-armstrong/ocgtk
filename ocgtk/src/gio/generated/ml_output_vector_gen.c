/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OutputVector */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,22,0)
/* Conversion functions for GOutputVector (opaque record with hidden fields) */
GOutputVector *GOutputVector_val(value v) {
  return (GOutputVector *)ml_gir_record_ptr_val(v, "GOutputVector");
}

value Val_GOutputVector(const GOutputVector *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GOutputVector_option(const GOutputVector *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GOutputVector(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,22,0)

\
CAMLexport CAMLprim value ml_g_output_vector_get_size(value self)
{
    CAMLparam1(self);
    GOutputVector *rec = GOutputVector_val(self);
    CAMLreturn(Val_gsize(rec->size));
}

\
CAMLexport CAMLprim value ml_g_output_vector_set_size(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputVector *rec = GOutputVector_val(self);
    rec->size = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_vector_make(value v_size)
{
    CAMLparam1(v_size);
    GOutputVector *obj = g_new0(GOutputVector, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->size = Gsize_val(v_size);
    CAMLreturn(Val_GOutputVector(obj));
}


#else


#endif
