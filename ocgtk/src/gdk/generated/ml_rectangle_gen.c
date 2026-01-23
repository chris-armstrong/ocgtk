/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Rectangle */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkRectangle (opaque record with hidden fields) */
GdkRectangle *GdkRectangle_val(value v) {
  return *(GdkRectangle **)Data_custom_val(v);
}

value Val_GdkRectangle(const GdkRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkRectangle_option(const GdkRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkRectangle(ptr));
}


CAMLexport CAMLprim value ml_gdk_rectangle_union(value self, value arg1)
{
CAMLparam2(self, arg1);
GdkRectangle out2;

gdk_rectangle_union(GdkRectangle_val(self), GdkRectangle_val(arg1), &out2);
CAMLreturn(Val_GdkRectangle(&out2));
}

CAMLexport CAMLprim value ml_gdk_rectangle_intersect(value self, value arg1)
{
CAMLparam2(self, arg1);
GdkRectangle out2;

gboolean result = gdk_rectangle_intersect(GdkRectangle_val(self), GdkRectangle_val(arg1), &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GdkRectangle(&out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gdk_rectangle_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_rectangle_equal(GdkRectangle_val(self), GdkRectangle_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rectangle_contains_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gdk_rectangle_contains_point(GdkRectangle_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}
