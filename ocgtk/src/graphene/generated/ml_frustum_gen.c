/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Frustum */

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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for graphene_frustum_t (opaque record with hidden fields) */
graphene_frustum_t *graphene_frustum_t_val(value v) {
  return *(graphene_frustum_t **)Data_custom_val(v);
}

value Val_graphene_frustum_t(const graphene_frustum_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_graphene_frustum_t_option(const graphene_frustum_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_graphene_frustum_t(ptr));
}


CAMLexport CAMLprim value ml_graphene_frustum_alloc(value unit)
{
CAMLparam1(unit);

graphene_frustum_t *obj = graphene_frustum_alloc();

CAMLreturn(Val_graphene_frustum_t(obj));
}
CAMLexport CAMLprim value ml_graphene_frustum_intersects_sphere(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_frustum_intersects_sphere(graphene_frustum_t_val(self), graphene_sphere_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_frustum_intersects_box(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_frustum_intersects_box(graphene_frustum_t_val(self), graphene_box_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_frustum_init_from_matrix(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_frustum_t* result = graphene_frustum_init_from_matrix(graphene_frustum_t_val(self), graphene_matrix_t_val(arg1));
CAMLreturn(Val_graphene_frustum_t(result));
}

CAMLexport CAMLprim value ml_graphene_frustum_init_from_frustum(value self, value arg1)
{
CAMLparam2(self, arg1);

graphene_frustum_t* result = graphene_frustum_init_from_frustum(graphene_frustum_t_val(self), graphene_frustum_t_val(arg1));
CAMLreturn(Val_graphene_frustum_t(result));
}

CAMLexport CAMLprim value ml_graphene_frustum_init_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

graphene_frustum_t* result = graphene_frustum_init(graphene_frustum_t_val(self), graphene_plane_t_val(arg1), graphene_plane_t_val(arg2), graphene_plane_t_val(arg3), graphene_plane_t_val(arg4), graphene_plane_t_val(arg5), graphene_plane_t_val(arg6));
CAMLreturn(Val_graphene_frustum_t(result));}

CAMLexport CAMLprim value ml_graphene_frustum_init_bytecode(value * argv, int argn)
{
return ml_graphene_frustum_init_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_graphene_frustum_get_planes(value self)
{
CAMLparam1(self);
graphene_plane_t out1[6];

graphene_frustum_get_planes(graphene_frustum_t_val(self), out1);
    int out1_length = 6;
    CAMLlocal1(ml_out1);
    ml_out1 = caml_alloc(out1_length, 0);
    for (int i = 0; i < out1_length; i++) {
      Store_field(ml_out1, i, Val_graphene_plane_t(&out1[i]));
    }

CAMLreturn(ml_out1);
}

CAMLexport CAMLprim value ml_graphene_frustum_free(value self)
{
CAMLparam1(self);

graphene_frustum_free(graphene_frustum_t_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_graphene_frustum_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_frustum_equal(graphene_frustum_t_val(self), graphene_frustum_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_graphene_frustum_contains_point(value self, value arg1)
{
CAMLparam2(self, arg1);

_Bool result = graphene_frustum_contains_point(graphene_frustum_t_val(self), graphene_point3d_t_val(arg1));
CAMLreturn(Val_bool(result));
}
