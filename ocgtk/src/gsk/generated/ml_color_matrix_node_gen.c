/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorMatrixNode */

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


CAMLexport CAMLprim value ml_gsk_color_matrix_node_get_child(value self)
{
CAMLparam1(self);

GskRenderNode* result = gsk_color_matrix_node_get_child(GskColorMatrixNode_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GskRenderNode(result));
}
