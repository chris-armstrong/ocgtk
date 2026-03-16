/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Transform */

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

/* Conversion functions for GskTransform (opaque record with hidden fields) */
GskTransform *GskTransform_val(value v) {
  return *(GskTransform **)Data_custom_val(v);
}

value Val_GskTransform(const GskTransform *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskTransform_option(const GskTransform *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskTransform(ptr));
}


CAMLexport CAMLprim value ml_gsk_transform_new(value unit)
{
CAMLparam1(unit);

GskTransform *obj = gsk_transform_new();

CAMLreturn(Val_GskTransform(obj));
}
CAMLexport CAMLprim value ml_gsk_transform_unref(value self)
{
CAMLparam1(self);

gsk_transform_unref(GskTransform_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_transform_transform(value self, value arg1)
{
CAMLparam2(self, arg1);

GskTransform* result = gsk_transform_transform(GskTransform_val(self), Option_val(arg1, GskTransform_val, NULL));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_to_translate(value self)
{
CAMLparam1(self);
float out1;
float out2;

gsk_transform_to_translate(GskTransform_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gsk_transform_to_string(value self)
{
CAMLparam1(self);

char* result = gsk_transform_to_string(GskTransform_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gsk_transform_to_affine(value self)
{
CAMLparam1(self);
float out1;
float out2;
float out3;
float out4;

gsk_transform_to_affine(GskTransform_val(self), &out1, &out2, &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(4, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    Store_field(ret, 2, caml_copy_double(out3));
    Store_field(ret, 3, caml_copy_double(out4));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gsk_transform_to_2d_components(value self)
{
CAMLparam1(self);
float out1;
float out2;
float out3;
float out4;
float out5;
float out6;
float out7;

gsk_transform_to_2d_components(GskTransform_val(self), &out1, &out2, &out3, &out4, &out5, &out6, &out7);
CAMLlocal1(ret);
    ret = caml_alloc(7, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    Store_field(ret, 2, caml_copy_double(out3));
    Store_field(ret, 3, caml_copy_double(out4));
    Store_field(ret, 4, caml_copy_double(out5));
    Store_field(ret, 5, caml_copy_double(out6));
    Store_field(ret, 6, caml_copy_double(out7));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gsk_transform_to_2d(value self)
{
CAMLparam1(self);
float out1;
float out2;
float out3;
float out4;
float out5;
float out6;

gsk_transform_to_2d(GskTransform_val(self), &out1, &out2, &out3, &out4, &out5, &out6);
CAMLlocal1(ret);
    ret = caml_alloc(6, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    Store_field(ret, 2, caml_copy_double(out3));
    Store_field(ret, 3, caml_copy_double(out4));
    Store_field(ret, 4, caml_copy_double(out5));
    Store_field(ret, 5, caml_copy_double(out6));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gsk_transform_skew(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GskTransform* result = gsk_transform_skew(GskTransform_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_scale_3d(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

GskTransform* result = gsk_transform_scale_3d(GskTransform_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_scale(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GskTransform* result = gsk_transform_scale(GskTransform_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_rotate(value self, value arg1)
{
CAMLparam2(self, arg1);

GskTransform* result = gsk_transform_rotate(GskTransform_val(self), Double_val(arg1));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_ref(value self)
{
CAMLparam1(self);

GskTransform* result = gsk_transform_ref(GskTransform_val(self));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_perspective(value self, value arg1)
{
CAMLparam2(self, arg1);

GskTransform* result = gsk_transform_perspective(GskTransform_val(self), Double_val(arg1));
CAMLreturn(Val_GskTransform(result));
}

CAMLexport CAMLprim value ml_gsk_transform_invert(value self)
{
CAMLparam1(self);

GskTransform* result = gsk_transform_invert(GskTransform_val(self));
CAMLreturn(Val_option(result, Val_GskTransform));
}

CAMLexport CAMLprim value ml_gsk_transform_get_category(value self)
{
CAMLparam1(self);

GskTransformCategory result = gsk_transform_get_category(GskTransform_val(self));
CAMLreturn(Val_GskTransformCategory(result));
}

CAMLexport CAMLprim value ml_gsk_transform_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gsk_transform_equal(GskTransform_val(self), Option_val(arg1, GskTransform_val, NULL));
CAMLreturn(Val_bool(result));
}
