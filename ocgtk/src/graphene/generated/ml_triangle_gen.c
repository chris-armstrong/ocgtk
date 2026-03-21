/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Triangle */

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

/* Conversion functions for graphene_triangle_t (opaque record with hidden fields) */
graphene_triangle_t *graphene_triangle_t_val(value v) {
  return *(graphene_triangle_t **)Data_custom_val(v);
}

value Val_graphene_triangle_t(const graphene_triangle_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_graphene_triangle_t_option(const graphene_triangle_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_graphene_triangle_t(ptr));
}


CAMLexport CAMLprim value ml_graphene_triangle_alloc(value unit)
{
CAMLparam1(unit);

graphene_triangle_t *obj = graphene_triangle_alloc();

CAMLreturn(Val_graphene_triangle_t(obj));
}
CAMLexport CAMLprim value ml_graphene_triangle_init_from_vec3(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

graphene_triangle_t* result = graphene_triangle_init_from_vec3(graphene_triangle_t_val(self), Option_val(arg1, graphene_vec3_t_val, NULL), Option_val(arg2, graphene_vec3_t_val, NULL), Option_val(arg3, graphene_vec3_t_val, NULL));
CAMLreturn(Val_graphene_triangle_t(result));
}

CAMLexport CAMLprim value ml_graphene_triangle_init_from_point3d(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

graphene_triangle_t* result = graphene_triangle_init_from_point3d(graphene_triangle_t_val(self), Option_val(arg1, graphene_point3d_t_val, NULL), Option_val(arg2, graphene_point3d_t_val, NULL), Option_val(arg3, graphene_point3d_t_val, NULL));
CAMLreturn(Val_graphene_triangle_t(result));
}

CAMLexport CAMLprim value ml_graphene_triangle_init_from_float(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
    int arg1_length = Wosize_val(arg1);
    float* c_arg1 = (float*)g_malloc(sizeof(float) * arg1_length);
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = Double_val(Field(arg1, i));
    }
    int arg2_length = Wosize_val(arg2);
    float* c_arg2 = (float*)g_malloc(sizeof(float) * arg2_length);
    for (int i = 0; i < arg2_length; i++) {
      c_arg2[i] = Double_val(Field(arg2, i));
    }
    int arg3_length = Wosize_val(arg3);
    float* c_arg3 = (float*)g_malloc(sizeof(float) * arg3_length);
    for (int i = 0; i < arg3_length; i++) {
      c_arg3[i] = Double_val(Field(arg3, i));
    }

graphene_triangle_t* result = graphene_triangle_init_from_float(graphene_triangle_t_val(self), c_arg1, c_arg2, c_arg3);
    g_free(c_arg1);
    g_free(c_arg2);
    g_free(c_arg3);
CAMLreturn(Val_graphene_triangle_t(result));
}

CAMLexport CAMLprim value ml_graphene_triangle_get_vertices(value self)
{
CAMLparam1(self);
graphene_vec3_t out1;
graphene_vec3_t out2;
graphene_vec3_t out3;

graphene_triangle_get_vertices(graphene_triangle_t_val(self), &out1, &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_graphene_vec3_t(&out1));
    Store_field(ret, 1, Val_graphene_vec3_t(&out2));
    Store_field(ret, 2, Val_graphene_vec3_t(&out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_graphene_triangle_get_uv(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
graphene_vec2_t out5;

_Bool result = graphene_triangle_get_uv(graphene_triangle_t_val(self), Option_val(arg1, graphene_point3d_t_val, NULL), graphene_vec2_t_val(arg2), graphene_vec2_t_val(arg3), graphene_vec2_t_val(arg4), &out5);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_graphene_vec2_t(&out5));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_graphene_triangle_get_points(value self)
{
CAMLparam1(self);
graphene_point3d_t out1;
graphene_point3d_t out2;
graphene_point3d_t out3;

graphene_triangle_get_points(graphene_triangle_t_val(self), &out1, &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_graphene_point3d_t(&out1));
    Store_field(ret, 1, Val_graphene_point3d_t(&out2));
    Store_field(ret, 2, Val_graphene_point3d_t(&out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_graphene_triangle_get_plane(value self)
{
CAMLparam1(self);
graphene_plane_t out1;

graphene_triangle_get_plane(graphene_triangle_t_val(self), &out1);
CAMLreturn(Val_graphene_plane_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_triangle_get_normal(value self)
{
CAMLparam1(self);
graphene_vec3_t out1;

graphene_triangle_get_normal(graphene_triangle_t_val(self), &out1);
CAMLreturn(Val_graphene_vec3_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_triangle_get_midpoint(value self)
{
CAMLparam1(self);
graphene_point3d_t out1;

graphene_triangle_get_midpoint(graphene_triangle_t_val(self), &out1);
CAMLreturn(Val_graphene_point3d_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_triangle_get_bounding_box(value self)
{
CAMLparam1(self);
graphene_box_t out1;

graphene_triangle_get_bounding_box(graphene_triangle_t_val(self), &out1);
CAMLreturn(Val_graphene_box_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_triangle_get_barycoords(value self, value arg1)
{
CAMLparam2(self, arg1);
graphene_vec2_t out2;

_Bool result = graphene_triangle_get_barycoords(graphene_triangle_t_val(self), Option_val(arg1, graphene_point3d_t_val, NULL), &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_graphene_vec2_t(&out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_graphene_triangle_get_area(value self)
{
CAMLparam1(self);

float result = graphene_triangle_get_area(graphene_triangle_t_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_graphene_triangle_free(value self)
{
CAMLparam1(self);

graphene_triangle_free(graphene_triangle_t_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_graphene_triangle_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_triangle_equal(graphene_triangle_t_val(self), graphene_triangle_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_triangle_contains_point(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_triangle_contains_point(graphene_triangle_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(Val_bool(result));
}
