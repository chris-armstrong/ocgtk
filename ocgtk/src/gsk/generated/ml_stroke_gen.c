/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Stroke */

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

/* Conversion functions for GskStroke (opaque record with hidden fields) */
GskStroke *GskStroke_val(value v) {
  return *(GskStroke **)Data_custom_val(v);
}

value Val_GskStroke(const GskStroke *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskStroke_option(const GskStroke *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskStroke(ptr));
}


CAMLexport CAMLprim value ml_gsk_stroke_new(value arg1)
{
CAMLparam1(arg1);

GskStroke *obj = gsk_stroke_new(Double_val(arg1));

CAMLreturn(Val_GskStroke(obj));
}
CAMLexport CAMLprim value ml_gsk_stroke_to_cairo(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_to_cairo(GskStroke_val(self), cairo_t_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_set_miter_limit(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_set_miter_limit(GskStroke_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_set_line_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_set_line_width(GskStroke_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_set_line_join(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_set_line_join(GskStroke_val(self), GskLineJoin_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_set_line_cap(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_set_line_cap(GskStroke_val(self), GskLineCap_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_set_dash_offset(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_stroke_set_dash_offset(GskStroke_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_get_miter_limit(value self)
{
CAMLparam1(self);

float result = gsk_stroke_get_miter_limit(GskStroke_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_get_line_width(value self)
{
CAMLparam1(self);

float result = gsk_stroke_get_line_width(GskStroke_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_get_line_join(value self)
{
CAMLparam1(self);

GskLineJoin result = gsk_stroke_get_line_join(GskStroke_val(self));
CAMLreturn(Val_GskLineJoin(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_get_line_cap(value self)
{
CAMLparam1(self);

GskLineCap result = gsk_stroke_get_line_cap(GskStroke_val(self));
CAMLreturn(Val_GskLineCap(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_get_dash_offset(value self)
{
CAMLparam1(self);

float result = gsk_stroke_get_dash_offset(GskStroke_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gsk_stroke_free(value self)
{
CAMLparam1(self);

gsk_stroke_free(GskStroke_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_stroke_copy(value self)
{
CAMLparam1(self);

GskStroke* result = gsk_stroke_copy(GskStroke_val(self));
CAMLreturn(Val_GskStroke(result));
}
