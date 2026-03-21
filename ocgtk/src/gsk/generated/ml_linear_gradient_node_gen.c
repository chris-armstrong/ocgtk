/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LinearGradientNode */

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


CAMLexport CAMLprim value ml_gsk_linear_gradient_node_get_start(value self)
{
CAMLparam1(self);

const graphene_point_t* result = gsk_linear_gradient_node_get_start(GskLinearGradientNode_val(self));
CAMLreturn(Val_graphene_point_t(result));
}

CAMLexport CAMLprim value ml_gsk_linear_gradient_node_get_end(value self)
{
CAMLparam1(self);

const graphene_point_t* result = gsk_linear_gradient_node_get_end(GskLinearGradientNode_val(self));
CAMLreturn(Val_graphene_point_t(result));
}
