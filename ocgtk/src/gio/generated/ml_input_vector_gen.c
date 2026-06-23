/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InputVector */

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
/* Conversion functions for GInputVector (opaque record with hidden fields) */
GInputVector *GInputVector_val(value v) {
  return (GInputVector *)ml_gir_record_ptr_val(v, "GInputVector");
}

value Val_GInputVector(const GInputVector *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GInputVector_option(const GInputVector *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GInputVector(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,22,0)

\
CAMLexport CAMLprim value ml_g_input_vector_get_size(value self)
{
    CAMLparam1(self);
    GInputVector *rec = GInputVector_val(self);
    CAMLreturn(Val_gsize(rec->size));
}

\
CAMLexport CAMLprim value ml_g_input_vector_set_size(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputVector *rec = GInputVector_val(self);
    rec->size = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_vector_make(value v_size)
{
    CAMLparam1(v_size);
    GInputVector *obj = g_new0(GInputVector, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->size = Gsize_val(v_size);
    CAMLreturn(Val_GInputVector(obj));
}


#else


#endif
