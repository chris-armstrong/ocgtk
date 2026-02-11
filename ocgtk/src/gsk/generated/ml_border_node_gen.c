/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BorderNode */

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


CAMLexport CAMLprim value ml_gsk_border_node_get_widths(value self)
{
CAMLparam1(self);

const float* result = gsk_border_node_get_widths(GskBorderNode_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_double(result[i]));
    }
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gsk_border_node_get_outline(value self)
{
CAMLparam1(self);

const GskRoundedRect* result = gsk_border_node_get_outline(GskBorderNode_val(self));
CAMLreturn(Val_GskRoundedRect(result));
}
