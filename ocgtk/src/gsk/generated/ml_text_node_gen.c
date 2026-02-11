/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextNode */

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


CAMLexport CAMLprim value ml_gsk_text_node_has_color_glyphs(value self)
{
CAMLparam1(self);

gboolean result = gsk_text_node_has_color_glyphs(GskTextNode_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_text_node_get_num_glyphs(value self)
{
CAMLparam1(self);

guint result = gsk_text_node_get_num_glyphs(GskTextNode_val(self));
CAMLreturn(Val_int(result));
}
