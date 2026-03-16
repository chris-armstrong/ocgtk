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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gsk_texture_scale_node_get_filter(value self)
{
CAMLparam1(self);

GskScalingFilter result = gsk_texture_scale_node_get_filter(GskTextureScaleNode_val(self));
CAMLreturn(Val_GskScalingFilter(result));
}
