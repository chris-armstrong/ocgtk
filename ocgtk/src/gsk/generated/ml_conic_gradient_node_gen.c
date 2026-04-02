/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConicGradientNode */

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
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"


CAMLexport CAMLprim value ml_gsk_conic_gradient_node_get_rotation(value self)
{
CAMLparam1(self);

float result = gsk_conic_gradient_node_get_rotation(GskConicGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_conic_gradient_node_get_center(value self)
{
CAMLparam1(self);

const graphene_point_t* result = gsk_conic_gradient_node_get_center(GskConicGradientNode_val(self));
CAMLreturn(Val_graphene_point_t(result));
}

CAMLexport CAMLprim value ml_gsk_conic_gradient_node_get_angle(value self)
{
CAMLparam1(self);

float result = gsk_conic_gradient_node_get_angle(GskConicGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}
