/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphItem */

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

/* Copy function for PangoGlyphItem (value-like record with copy method) */
value copy_PangoGlyphItem(const PangoGlyphItem *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoGlyphItem *copy = pango_glyph_item_copy((PangoGlyphItem*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_pango_glyph_item_split(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

PangoGlyphItem* result = pango_glyph_item_split(PangoGlyphItem_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_option(result, Val_PangoGlyphItem));
}

CAMLexport CAMLprim value ml_pango_glyph_item_letter_space(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
    int arg2_length = Wosize_val(arg2);
    PangoLogAttr* c_arg2 = (PangoLogAttr*)g_malloc(sizeof(PangoLogAttr) * arg2_length);
    for (int i = 0; i < arg2_length; i++) {
      c_arg2[i] = *PangoLogAttr_val(Field(arg2, i));
    }

pango_glyph_item_letter_space(PangoGlyphItem_val(self), String_val(arg1), c_arg2, Int_val(arg3));
    g_free(c_arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_item_get_logical_widths(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
    int arg2_length = Wosize_val(arg2);
    int* c_arg2 = (int*)g_malloc(sizeof(int) * arg2_length);
    for (int i = 0; i < arg2_length; i++) {
      c_arg2[i] = Int_val(Field(arg2, i));
    }

pango_glyph_item_get_logical_widths(PangoGlyphItem_val(self), String_val(arg1), c_arg2);
    g_free(c_arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_item_free(value self)
{
CAMLparam1(self);

pango_glyph_item_free(PangoGlyphItem_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_item_copy(value self)
{
CAMLparam1(self);

PangoGlyphItem* result = pango_glyph_item_copy(PangoGlyphItem_val(self));
CAMLreturn(Val_option(result, Val_PangoGlyphItem));
}
