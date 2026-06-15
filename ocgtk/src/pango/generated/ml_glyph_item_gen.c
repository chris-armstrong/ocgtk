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
  return ml_gir_record_val_ptr_with_type(pango_glyph_item_get_type(), copy);
}


#if PANGO_VERSION_CHECK(1,2,0)

CAMLexport CAMLprim value ml_pango_glyph_item_split(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

PangoGlyphItem* result = pango_glyph_item_split(PangoGlyphItem_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_option(result, Val_PangoGlyphItem));
}

#else

CAMLexport CAMLprim value ml_pango_glyph_item_split(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
(void)self;
(void)arg1;
(void)arg2;
caml_failwith("GlyphItem requires Pango >= 1.2");
return Val_unit;
}
#endif

#if PANGO_VERSION_CHECK(1,2,0)

CAMLexport CAMLprim value ml_pango_glyph_item_apply_attrs(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

CAMLlocal3(result, item, cell);
    GList* c_result = pango_glyph_item_apply_attrs(PangoGlyphItem_val(self), String_val(arg1), PangoAttrList_val(arg2));
Val_GSList_with(c_result, result, item, cell, Val_PangoGlyphItem((gpointer)_tmp->data));
    g_slist_free(c_result);
    CAMLreturn(result);
}

#else

CAMLexport CAMLprim value ml_pango_glyph_item_apply_attrs(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
(void)self;
(void)arg1;
(void)arg2;
caml_failwith("GlyphItem requires Pango >= 1.2");
return Val_unit;
}
#endif
\
CAMLexport CAMLprim value ml_pango_glyph_item_get_item(value self)
{
    CAMLparam1(self);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    CAMLreturn(Val_PangoItem(rec->item));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_get_glyphs(value self)
{
    CAMLparam1(self);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    CAMLreturn(Val_PangoGlyphString(rec->glyphs));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_get_y_offset(value self)
{
    CAMLparam1(self);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    CAMLreturn(Val_int(rec->y_offset));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_get_start_x_offset(value self)
{
    CAMLparam1(self);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    CAMLreturn(Val_int(rec->start_x_offset));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_get_end_x_offset(value self)
{
    CAMLparam1(self);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    CAMLreturn(Val_int(rec->end_x_offset));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_set_item(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    rec->item = PangoItem_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_set_glyphs(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    rec->glyphs = PangoGlyphString_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_set_y_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    rec->y_offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_set_start_x_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    rec->start_x_offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_set_end_x_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItem *rec = PangoGlyphItem_val(self);
    rec->end_x_offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_make(value v_item, value v_glyphs, value v_y_offset, value v_start_x_offset, value v_end_x_offset)
{
    CAMLparam5(v_item, v_glyphs, v_y_offset, v_start_x_offset, v_end_x_offset);
    PangoGlyphItem *obj = g_new0(PangoGlyphItem, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->item = PangoItem_val(v_item);
    obj->glyphs = PangoGlyphString_val(v_glyphs);
    obj->y_offset = Int_val(v_y_offset);
    obj->start_x_offset = Int_val(v_start_x_offset);
    obj->end_x_offset = Int_val(v_end_x_offset);
    CAMLreturn(Val_PangoGlyphItem(obj));
}

