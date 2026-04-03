/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RadialGradientNode */

#include <gtk/gtk.h>
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


CAMLexport CAMLprim value ml_gsk_radial_gradient_node_get_vradius(value self)
{
CAMLparam1(self);

float result = gsk_radial_gradient_node_get_vradius(GskRadialGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_radial_gradient_node_get_start(value self)
{
CAMLparam1(self);

float result = gsk_radial_gradient_node_get_start(GskRadialGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_radial_gradient_node_get_hradius(value self)
{
CAMLparam1(self);

float result = gsk_radial_gradient_node_get_hradius(GskRadialGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_radial_gradient_node_get_end(value self)
{
CAMLparam1(self);

float result = gsk_radial_gradient_node_get_end(GskRadialGradientNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_radial_gradient_node_get_center(value self)
{
CAMLparam1(self);

const graphene_point_t* result = gsk_radial_gradient_node_get_center(GskRadialGradientNode_val(self));
CAMLreturn(Val_graphene_point_t(result));
}
