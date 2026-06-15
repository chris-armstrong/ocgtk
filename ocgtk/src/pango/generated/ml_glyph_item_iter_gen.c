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
  return ml_gir_record_val_ptr_with_type(pango_glyph_item_iter_get_type(), copy);
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
\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_glyph_item(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_PangoGlyphItem(rec->glyph_item));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_text(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(caml_copy_string(rec->text));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_start_glyph(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->start_glyph));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_start_index(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->start_index));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_start_char(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->start_char));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_end_glyph(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->end_glyph));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_end_index(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->end_index));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_get_end_char(value self)
{
    CAMLparam1(self);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    CAMLreturn(Val_int(rec->end_char));
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_glyph_item(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->glyph_item = PangoGlyphItem_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_text(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    g_free(rec->text);
    rec->text = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_start_glyph(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->start_glyph = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_start_index(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->start_index = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_start_char(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->start_char = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_end_glyph(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->end_glyph = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_end_index(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->end_index = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_set_end_char(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphItemIter *rec = PangoGlyphItemIter_val(self);
    rec->end_char = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_make_native(value v_glyph_item, value v_text, value v_start_glyph, value v_start_index, value v_start_char, value v_end_glyph, value v_end_index, value v_end_char)
{
    CAMLparam5(v_glyph_item, v_text, v_start_glyph, v_start_index, v_start_char);
CAMLxparam3(v_end_glyph, v_end_index, v_end_char);

    PangoGlyphItemIter *obj = g_new0(PangoGlyphItemIter, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->glyph_item = PangoGlyphItem_val(v_glyph_item);
    obj->text = g_strdup(String_val(v_text));
    obj->start_glyph = Int_val(v_start_glyph);
    obj->start_index = Int_val(v_start_index);
    obj->start_char = Int_val(v_start_char);
    obj->end_glyph = Int_val(v_end_glyph);
    obj->end_index = Int_val(v_end_index);
    obj->end_char = Int_val(v_end_char);
    CAMLreturn(Val_PangoGlyphItemIter(obj));
}
\
CAMLexport CAMLprim value ml_pango_glyph_item_iter_make_bytecode(value * argv, int argn)
{
    return ml_pango_glyph_item_iter_make_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}


#else


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
