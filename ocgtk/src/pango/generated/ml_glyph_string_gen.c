/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphString */

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

/* Copy function for PangoGlyphString (value-like record with copy method) */
value copy_PangoGlyphString(const PangoGlyphString *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoGlyphString *copy = pango_glyph_string_copy((PangoGlyphString*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_pango_glyph_string_new(value unit)
{
CAMLparam1(unit);

PangoGlyphString *obj = pango_glyph_string_new();

CAMLreturn(Val_PangoGlyphString(obj));
}
CAMLexport CAMLprim value ml_pango_glyph_string_x_to_index(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
int out5;
int out6;

pango_glyph_string_x_to_index(PangoGlyphString_val(self), String_val(arg1), Int_val(arg2), PangoAnalysis_val(arg3), Int_val(arg4), &out5, &out6);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out5));
    Store_field(ret, 1, Val_int(out6));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_glyph_string_set_size(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_glyph_string_set_size(PangoGlyphString_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_string_index_to_x_full_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);
int out7;

pango_glyph_string_index_to_x_full(PangoGlyphString_val(self), String_val(arg1), Int_val(arg2), PangoAnalysis_val(arg3), Option_val(arg4, PangoLogAttr_val, NULL), Int_val(arg5), Bool_val(arg6), &out7);
CAMLreturn(Val_int(out7));}

CAMLexport CAMLprim value ml_pango_glyph_string_index_to_x_full_bytecode(value * argv, int argn)
{
return ml_pango_glyph_string_index_to_x_full_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_pango_glyph_string_index_to_x_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);
int out6;

pango_glyph_string_index_to_x(PangoGlyphString_val(self), String_val(arg1), Int_val(arg2), PangoAnalysis_val(arg3), Int_val(arg4), Bool_val(arg5), &out6);
CAMLreturn(Val_int(out6));}

CAMLexport CAMLprim value ml_pango_glyph_string_index_to_x_bytecode(value * argv, int argn)
{
return ml_pango_glyph_string_index_to_x_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_pango_glyph_string_get_width(value self)
{
CAMLparam1(self);

int result = pango_glyph_string_get_width(PangoGlyphString_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_pango_glyph_string_free(value self)
{
CAMLparam1(self);

pango_glyph_string_free(PangoGlyphString_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_string_extents_range(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
PangoRectangle out4;
PangoRectangle out5;

pango_glyph_string_extents_range(PangoGlyphString_val(self), Int_val(arg1), Int_val(arg2), PangoFont_val(arg3), &out4, &out5);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_PangoRectangle(&out4));
    Store_field(ret, 1, Val_PangoRectangle(&out5));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_glyph_string_extents(value self, value arg1)
{
CAMLparam2(self, arg1);
PangoRectangle out2;
PangoRectangle out3;

pango_glyph_string_extents(PangoGlyphString_val(self), PangoFont_val(arg1), &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_PangoRectangle(&out2));
    Store_field(ret, 1, Val_PangoRectangle(&out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_glyph_string_copy(value self)
{
CAMLparam1(self);

PangoGlyphString* result = pango_glyph_string_copy(PangoGlyphString_val(self));
CAMLreturn(Val_option(result, Val_PangoGlyphString));
}
