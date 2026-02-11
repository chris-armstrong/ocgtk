/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Path */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GskPath (opaque record with hidden fields) */
GskPath *GskPath_val(value v) {
  return *(GskPath **)Data_custom_val(v);
}

value Val_GskPath(const GskPath *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskPath_option(const GskPath *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskPath(ptr));
}


CAMLexport CAMLprim value ml_gsk_path_unref(value self)
{
CAMLparam1(self);

gsk_path_unref(GskPath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_to_string(value self)
{
CAMLparam1(self);

char* result = gsk_path_to_string(GskPath_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gsk_path_ref(value self)
{
CAMLparam1(self);

GskPath* result = gsk_path_ref(GskPath_val(self));
CAMLreturn(Val_GskPath(result));
}

CAMLexport CAMLprim value ml_gsk_path_is_empty(value self)
{
CAMLparam1(self);

gboolean result = gsk_path_is_empty(GskPath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_path_is_closed(value self)
{
CAMLparam1(self);

gboolean result = gsk_path_is_closed(GskPath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_path_get_start_point(value self)
{
CAMLparam1(self);
GskPathPoint out1;

gboolean result = gsk_path_get_start_point(GskPath_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GskPathPoint(&out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gsk_path_get_end_point(value self)
{
CAMLparam1(self);
GskPathPoint out1;

gboolean result = gsk_path_get_end_point(GskPath_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GskPathPoint(&out1));
    CAMLreturn(ret);
}
