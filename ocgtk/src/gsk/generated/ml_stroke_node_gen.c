/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StrokeNode */

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


CAMLexport CAMLprim value ml_gsk_stroke_node_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);

GskStrokeNode *obj = gsk_stroke_node_new(GskRenderNode_val(arg1), GskPath_val(arg2), GskStroke_val(arg3));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskStrokeNode(obj));
}
CAMLexport CAMLprim value ml_gsk_stroke_node_get_stroke(value self)
{
CAMLparam1(self);

const GskStroke* result = gsk_stroke_node_get_stroke(GskStrokeNode_val(self));
CAMLreturn(Val_GskStroke(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_node_get_path(value self)
{
CAMLparam1(self);

GskPath* result = gsk_stroke_node_get_path(GskStrokeNode_val(self));
CAMLreturn(Val_GskPath(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_node_get_child(value self)
{
CAMLparam1(self);

GskRenderNode* result = gsk_stroke_node_get_child(GskStrokeNode_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GskRenderNode(result));
}
