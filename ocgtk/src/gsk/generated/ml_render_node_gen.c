/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RenderNode */

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


CAMLexport CAMLprim value ml_gsk_render_node_write_to_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gsk_render_node_write_to_file(GskRenderNode_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gsk_render_node_unref(value self)
{
CAMLparam1(self);

gsk_render_node_unref(GskRenderNode_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_render_node_ref(value self)
{
CAMLparam1(self);

GskRenderNode* result = gsk_render_node_ref(GskRenderNode_val(self));
CAMLreturn(Val_GskRenderNode(result));
}

CAMLexport CAMLprim value ml_gsk_render_node_get_node_type(value self)
{
CAMLparam1(self);

GskRenderNodeType result = gsk_render_node_get_node_type(GskRenderNode_val(self));
CAMLreturn(Val_GskRenderNodeType(result));
}
