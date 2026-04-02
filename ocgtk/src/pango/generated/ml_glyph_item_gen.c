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

#if PANGO_VERSION_CHECK(1,6,0)

CAMLexport CAMLprim value ml_pango_glyph_item_free(value self)
{
CAMLparam1(self);

pango_glyph_item_free(PangoGlyphItem_val(self));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_pango_glyph_item_free(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItem requires Pango >= 1.6");
return Val_unit;
}
#endif

#if PANGO_VERSION_CHECK(1,20,0)

CAMLexport CAMLprim value ml_pango_glyph_item_copy(value self)
{
CAMLparam1(self);

PangoGlyphItem* result = pango_glyph_item_copy(PangoGlyphItem_val(self));
CAMLreturn(Val_option(result, Val_PangoGlyphItem));
}

#else

CAMLexport CAMLprim value ml_pango_glyph_item_copy(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItem requires Pango >= 1.20");
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
    g_slist_foreach(c_result, (GFunc)g_object_unref, NULL);
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
