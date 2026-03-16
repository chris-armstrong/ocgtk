/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PathPoint */

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

/* Copy function for GskPathPoint (value-like record with copy method) */
value copy_GskPathPoint(const GskPathPoint *ptr)
{
  if (ptr == NULL) return Val_none;
  GskPathPoint *copy = gsk_path_point_copy((GskPathPoint*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_gsk_path_point_get_rotation(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

float result = gsk_path_point_get_rotation(GskPathPoint_val(self), GskPath_val(arg1), GskPathDirection_val(arg2));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_path_point_get_distance(value self, value arg1)
{
CAMLparam2(self, arg1);

float result = gsk_path_point_get_distance(GskPathPoint_val(self), GskPathMeasure_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_path_point_free(value self)
{
CAMLparam1(self);

gsk_path_point_free(GskPathPoint_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_point_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gsk_path_point_equal(GskPathPoint_val(self), GskPathPoint_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_path_point_copy(value self)
{
CAMLparam1(self);

GskPathPoint* result = gsk_path_point_copy(GskPathPoint_val(self));
CAMLreturn(Val_GskPathPoint(result));
}

CAMLexport CAMLprim value ml_gsk_path_point_compare(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gsk_path_point_compare(GskPathPoint_val(self), GskPathPoint_val(arg1));
CAMLreturn(Val_int(result));
}
