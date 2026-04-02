/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextureScaleNode */

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


CAMLexport CAMLprim value ml_gsk_texture_scale_node_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);

GskTextureScaleNode *obj = gsk_texture_scale_node_new(GdkTexture_val(arg1), graphene_rect_t_val(arg2), GskScalingFilter_val(arg3));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskTextureScaleNode(obj));
}
CAMLexport CAMLprim value ml_gsk_texture_scale_node_get_texture(value self)
{
CAMLparam1(self);

GdkTexture* result = gsk_texture_scale_node_get_texture(GskTextureScaleNode_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkTexture(result));
}

CAMLexport CAMLprim value ml_gsk_texture_scale_node_get_filter(value self)
{
CAMLparam1(self);

GskScalingFilter result = gsk_texture_scale_node_get_filter(GskTextureScaleNode_val(self));
CAMLreturn(Val_GskScalingFilter(result));
}
