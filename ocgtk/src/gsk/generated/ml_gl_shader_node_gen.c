/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLShaderNode */

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


CAMLexport CAMLprim value ml_gsk_gl_shader_node_get_shader(value self)
{
CAMLparam1(self);

GskGLShader* result = gsk_gl_shader_node_get_shader(GskGLShaderNode_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GskGLShader(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_node_get_n_children(value self)
{
CAMLparam1(self);

guint result = gsk_gl_shader_node_get_n_children(GskGLShaderNode_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_node_get_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GskRenderNode* result = gsk_gl_shader_node_get_child(GskGLShaderNode_val(self), Int_val(arg1));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GskRenderNode(result));
}
