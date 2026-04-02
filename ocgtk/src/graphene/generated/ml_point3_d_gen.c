/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Point3D */

#include <graphene.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <graphene-gobject.h>
/* Include library-specific type conversions and forward declarations */
#include "graphene_decls.h"

/* Conversion functions for graphene_point3d_t (opaque record with hidden fields) */
graphene_point3d_t *graphene_point3d_t_val(value v) {
  return *(graphene_point3d_t **)Data_custom_val(v);
}

value Val_graphene_point3d_t(const graphene_point3d_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_graphene_point3d_t_option(const graphene_point3d_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_graphene_point3d_t(ptr));
}


CAMLexport CAMLprim value ml_graphene_point3d_alloc(value unit)
{
CAMLparam1(unit);

graphene_point3d_t *obj = graphene_point3d_alloc();

CAMLreturn(Val_graphene_point3d_t(obj));
}
CAMLexport CAMLprim value ml_graphene_point3d_to_vec3(value self)
{
CAMLparam1(self);
graphene_vec3_t out1;

graphene_point3d_to_vec3(graphene_point3d_t_val(self), &out1);
CAMLreturn(Val_graphene_vec3_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_point3d_scale(value self, value arg1)
{
CAMLparam2(self, arg1);
graphene_point3d_t out2;

graphene_point3d_scale(graphene_point3d_t_val(self), Double_val(arg1), &out2);
CAMLreturn(Val_graphene_point3d_t(&out2));
}

CAMLexport CAMLprim value ml_graphene_point3d_normalize_viewport(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
graphene_point3d_t out4;

graphene_point3d_normalize_viewport(graphene_point3d_t_val(self), graphene_rect_t_val(arg1), Double_val(arg2), Double_val(arg3), &out4);
CAMLreturn(Val_graphene_point3d_t(&out4));
}

CAMLexport CAMLprim value ml_graphene_point3d_normalize(value self)
{
CAMLparam1(self);
graphene_point3d_t out1;

graphene_point3d_normalize(graphene_point3d_t_val(self), &out1);
CAMLreturn(Val_graphene_point3d_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_point3d_near(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

_Bool result = graphene_point3d_near(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1), Double_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_length(value self)
{
CAMLparam1(self);

float result = graphene_point3d_length(graphene_point3d_t_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_interpolate(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
graphene_point3d_t out3;

graphene_point3d_interpolate(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1), Double_val(arg2), &out3);
CAMLreturn(Val_graphene_point3d_t(&out3));
}

CAMLexport CAMLprim value ml_graphene_point3d_init_from_vec3(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_point3d_t* result = graphene_point3d_init_from_vec3(graphene_point3d_t_val(self), graphene_vec3_t_val(arg1));
CAMLreturn(Val_graphene_point3d_t(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_init_from_point(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_point3d_t* result = graphene_point3d_init_from_point(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(Val_graphene_point3d_t(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_init(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

graphene_point3d_t* result = graphene_point3d_init(graphene_point3d_t_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_graphene_point3d_t(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_free(value self)
{
CAMLparam1(self);

graphene_point3d_free(graphene_point3d_t_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_graphene_point3d_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_point3d_equal(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_dot(value self, value arg1)
{
CAMLparam2(self, arg1);

float result = graphene_point3d_dot(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_graphene_point3d_distance(value self, value arg1)
{
CAMLparam2(self, arg1);
graphene_vec3_t out2;

float result = graphene_point3d_distance(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1), &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(result));
    Store_field(ret, 1, Val_graphene_vec3_t(&out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_graphene_point3d_cross(value self, value arg1)
{
CAMLparam2(self, arg1);
graphene_point3d_t out2;

graphene_point3d_cross(graphene_point3d_t_val(self), graphene_point3d_t_val(arg1), &out2);
CAMLreturn(Val_graphene_point3d_t(&out2));
}
