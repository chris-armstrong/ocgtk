/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RoundedRect */

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

/* Copy function for GskRoundedRect (value-like record with copy method) */
value copy_GskRoundedRect(const GskRoundedRect *ptr) {
  if (ptr == NULL) return Val_none;
  GskRoundedRect *copy = g_malloc(sizeof(GskRoundedRect));
  memcpy(copy, ptr, sizeof(GskRoundedRect));
  return ml_gir_record_val_ptr(copy));
}


CAMLexport CAMLprim value ml_gsk_rounded_rect_shrink(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

GskRoundedRect* result = gsk_rounded_rect_shrink(GskRoundedRect_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GskRoundedRect* result = gsk_rounded_rect_offset(GskRoundedRect_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_normalize(value self)
{
CAMLparam1(self);

GskRoundedRect* result = gsk_rounded_rect_normalize(GskRoundedRect_val(self));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_is_rectilinear(value self)
{
CAMLparam1(self);

gboolean result = gsk_rounded_rect_is_rectilinear(GskRoundedRect_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_init_copy(value self, value arg1)
{
CAMLparam2(self, arg1);

GskRoundedRect* result = gsk_rounded_rect_init_copy(GskRoundedRect_val(self), GskRoundedRect_val(arg1));
CAMLreturn(Val_GskRoundedRect(result));
}
