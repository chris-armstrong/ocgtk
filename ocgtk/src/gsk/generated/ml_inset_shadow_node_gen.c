/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InsetShadowNode */

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


CAMLexport CAMLprim value ml_gsk_inset_shadow_node_get_spread(value self)
{
CAMLparam1(self);

float result = gsk_inset_shadow_node_get_spread(GskInsetShadowNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_inset_shadow_node_get_outline(value self)
{
CAMLparam1(self);

const GskRoundedRect* result = gsk_inset_shadow_node_get_outline(GskInsetShadowNode_val(self));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_inset_shadow_node_get_dy(value self)
{
CAMLparam1(self);

float result = gsk_inset_shadow_node_get_dy(GskInsetShadowNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_inset_shadow_node_get_dx(value self)
{
CAMLparam1(self);

float result = gsk_inset_shadow_node_get_dx(GskInsetShadowNode_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_inset_shadow_node_get_blur_radius(value self)
{
CAMLparam1(self);

float result = gsk_inset_shadow_node_get_blur_radius(GskInsetShadowNode_val(self));
CAMLreturn(caml_copy_double(result));
}
