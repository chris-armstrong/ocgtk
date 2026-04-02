/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Matrix */

#include <pango/pango.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pango.h>
/* Include library-specific type conversions and forward declarations */
#include "pango_decls.h"

/* Copy function for PangoMatrix (value-like record with copy method) */
value copy_PangoMatrix(const PangoMatrix *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoMatrix *copy = pango_matrix_copy((PangoMatrix*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_pango_matrix_translate(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

pango_matrix_translate(PangoMatrix_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_matrix_transform_rectangle(value self, value arg1)
{
CAMLparam2(self, arg1);
PangoRectangle inout1_val = *PangoRectangle_val(arg1);
PangoRectangle *inout1 = &inout1_val;

pango_matrix_transform_rectangle(PangoMatrix_val(self), inout1);
CAMLreturn(Val_PangoRectangle(&inout1));
}

CAMLexport CAMLprim value ml_pango_matrix_transform_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
double inout1 = Double_val(arg1);
double inout2 = Double_val(arg2);

pango_matrix_transform_point(PangoMatrix_val(self), &inout1, &inout2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(inout1));
    Store_field(ret, 1, caml_copy_double(inout2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_matrix_transform_pixel_rectangle(value self, value arg1)
{
CAMLparam2(self, arg1);
PangoRectangle inout1_val = *PangoRectangle_val(arg1);
PangoRectangle *inout1 = &inout1_val;

pango_matrix_transform_pixel_rectangle(PangoMatrix_val(self), inout1);
CAMLreturn(Val_PangoRectangle(&inout1));
}

CAMLexport CAMLprim value ml_pango_matrix_transform_distance(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
double inout1 = Double_val(arg1);
double inout2 = Double_val(arg2);

pango_matrix_transform_distance(PangoMatrix_val(self), &inout1, &inout2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(inout1));
    Store_field(ret, 1, caml_copy_double(inout2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_matrix_scale(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

pango_matrix_scale(PangoMatrix_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_matrix_rotate(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_matrix_rotate(PangoMatrix_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_matrix_get_slant_ratio(value self)
{
CAMLparam1(self);

double result = pango_matrix_get_slant_ratio(PangoMatrix_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_pango_matrix_get_font_scale_factors(value self)
{
CAMLparam1(self);
double out1;
double out2;

pango_matrix_get_font_scale_factors(PangoMatrix_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_matrix_get_font_scale_factor(value self)
{
CAMLparam1(self);

double result = pango_matrix_get_font_scale_factor(PangoMatrix_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_pango_matrix_free(value self)
{
CAMLparam1(self);

pango_matrix_free(PangoMatrix_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_matrix_copy(value self)
{
CAMLparam1(self);

PangoMatrix* result = pango_matrix_copy(PangoMatrix_val(self));
CAMLreturn(Val_option(result, Val_PangoMatrix));
}

CAMLexport CAMLprim value ml_pango_matrix_concat(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_matrix_concat(PangoMatrix_val(self), PangoMatrix_val(arg1));
CAMLreturn(Val_unit);
}
