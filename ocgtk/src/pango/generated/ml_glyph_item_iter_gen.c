/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphItemIter */

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

#if PANGO_VERSION_CHECK(1,22,0)
/* Copy function for PangoGlyphItemIter (value-like record with copy method) */
value copy_PangoGlyphItemIter(const PangoGlyphItemIter *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoGlyphItemIter *copy = pango_glyph_item_iter_copy((PangoGlyphItemIter*)ptr);
  return ml_gir_record_val_ptr(copy);
}
#endif

#if PANGO_VERSION_CHECK(1,22,0)


CAMLexport CAMLprim value ml_pango_glyph_item_iter_prev_cluster(value self)
{
CAMLparam1(self);

gboolean result = pango_glyph_item_iter_prev_cluster(PangoGlyphItemIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_glyph_item_iter_next_cluster(value self)
{
CAMLparam1(self);

gboolean result = pango_glyph_item_iter_next_cluster(PangoGlyphItemIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_glyph_item_iter_init_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = pango_glyph_item_iter_init_start(PangoGlyphItemIter_val(self), PangoGlyphItem_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_glyph_item_iter_init_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = pango_glyph_item_iter_init_end(PangoGlyphItemIter_val(self), PangoGlyphItem_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_glyph_item_iter_free(value self)
{
CAMLparam1(self);

pango_glyph_item_iter_free(PangoGlyphItemIter_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_glyph_item_iter_copy(value self)
{
CAMLparam1(self);

PangoGlyphItemIter* result = pango_glyph_item_iter_copy(PangoGlyphItemIter_val(self));
CAMLreturn(Val_option(result, Val_PangoGlyphItemIter));
}

#else


CAMLexport CAMLprim value ml_pango_glyph_item_iter_copy(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_pango_glyph_item_iter_free(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_pango_glyph_item_iter_init_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
(void)self;
(void)arg1;
(void)arg2;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_pango_glyph_item_iter_init_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
(void)self;
(void)arg1;
(void)arg2;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_pango_glyph_item_iter_next_cluster(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_pango_glyph_item_iter_prev_cluster(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("GlyphItemIter requires Pango >= 1.22");
return Val_unit;
}


#endif
