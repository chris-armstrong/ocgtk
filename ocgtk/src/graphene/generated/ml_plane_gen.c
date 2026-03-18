/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Plane */

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

/* Conversion functions for graphene_plane_t (opaque record with hidden fields) */
graphene_plane_t *graphene_plane_t_val(value v) {
  return *(graphene_plane_t **)Data_custom_val(v);
}

value Val_graphene_plane_t(const graphene_plane_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_graphene_plane_t_option(const graphene_plane_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_graphene_plane_t(ptr));
}


CAMLexport CAMLprim value ml_graphene_plane_alloc(value unit)
{
CAMLparam1(unit);

graphene_plane_t *obj = graphene_plane_alloc();

CAMLreturn(Val_graphene_plane_t(obj));
}
CAMLexport CAMLprim value ml_graphene_plane_transform(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
graphene_plane_t out3;

graphene_plane_transform(graphene_plane_t_val(self), graphene_matrix_t_val(arg1), Option_val(arg2, graphene_matrix_t_val, NULL), &out3);
CAMLreturn(Val_graphene_plane_t(&out3));
}

CAMLexport CAMLprim value ml_graphene_plane_normalize(value self)
{
CAMLparam1(self);
graphene_plane_t out1;

graphene_plane_normalize(graphene_plane_t_val(self), &out1);
CAMLreturn(Val_graphene_plane_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_plane_negate(value self)
{
CAMLparam1(self);
graphene_plane_t out1;

graphene_plane_negate(graphene_plane_t_val(self), &out1);
CAMLreturn(Val_graphene_plane_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_plane_init_from_vec4(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_plane_t* result = graphene_plane_init_from_vec4(graphene_plane_t_val(self), graphene_vec4_t_val(arg1));
CAMLreturn(Val_graphene_plane_t(result));
}

CAMLexport CAMLprim value ml_graphene_plane_init_from_points(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

graphene_plane_t* result = graphene_plane_init_from_points(graphene_plane_t_val(self), graphene_point3d_t_val(arg1), graphene_point3d_t_val(arg2), graphene_point3d_t_val(arg3));
CAMLreturn(Val_graphene_plane_t(result));
}

CAMLexport CAMLprim value ml_graphene_plane_init_from_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

graphene_plane_t* result = graphene_plane_init_from_point(graphene_plane_t_val(self), graphene_vec3_t_val(arg1), graphene_point3d_t_val(arg2));
CAMLreturn(Val_graphene_plane_t(result));
}

CAMLexport CAMLprim value ml_graphene_plane_init_from_plane(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_plane_t* result = graphene_plane_init_from_plane(graphene_plane_t_val(self), graphene_plane_t_val(arg1));
CAMLreturn(Val_graphene_plane_t(result));
}

CAMLexport CAMLprim value ml_graphene_plane_init(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

graphene_plane_t* result = graphene_plane_init(graphene_plane_t_val(self), Option_val(arg1, graphene_vec3_t_val, NULL), Double_val(arg2));
CAMLreturn(Val_graphene_plane_t(result));
}

CAMLexport CAMLprim value ml_graphene_plane_get_normal(value self)
{
CAMLparam1(self);
graphene_vec3_t out1;

graphene_plane_get_normal(graphene_plane_t_val(self), &out1);
CAMLreturn(Val_graphene_vec3_t(&out1));
}

CAMLexport CAMLprim value ml_graphene_plane_get_constant(value self)
{
CAMLparam1(self);

float result = graphene_plane_get_constant(graphene_plane_t_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_graphene_plane_free(value self)
{
CAMLparam1(self);

graphene_plane_free(graphene_plane_t_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_graphene_plane_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_plane_equal(graphene_plane_t_val(self), graphene_plane_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_plane_distance(value self, value arg1)
{
CAMLparam2(self, arg1);

float result = graphene_plane_distance(graphene_plane_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(caml_copy_double(result));
}
