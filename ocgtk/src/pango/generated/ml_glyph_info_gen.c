/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphInfo */

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

/* Conversion functions for PangoGlyphInfo (opaque record with hidden fields) */
PangoGlyphInfo *PangoGlyphInfo_val(value v) {
  return (PangoGlyphInfo *)ml_gir_record_ptr_val(v, "PangoGlyphInfo");
}

value Val_PangoGlyphInfo(const PangoGlyphInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoGlyphInfo_option(const PangoGlyphInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoGlyphInfo(ptr));
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_get_glyph(value self)
{
    CAMLparam1(self);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    CAMLreturn(Val_int(rec->glyph));
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_get_geometry(value self)
{
    CAMLparam1(self);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    CAMLreturn(Val_PangoGlyphGeometry(&rec->geometry));
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_get_attr(value self)
{
    CAMLparam1(self);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    CAMLreturn(Val_PangoGlyphVisAttr(&rec->attr));
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_set_glyph(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    rec->glyph = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_set_geometry(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    rec->geometry = *PangoGlyphGeometry_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_set_attr(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphInfo *rec = PangoGlyphInfo_val(self);
    rec->attr = *PangoGlyphVisAttr_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_info_make(value v_glyph, value v_geometry, value v_attr)
{
    CAMLparam3(v_glyph, v_geometry, v_attr);
    PangoGlyphInfo *obj = g_new0(PangoGlyphInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->glyph = Int_val(v_glyph);
    obj->geometry = *PangoGlyphGeometry_val(v_geometry);
    obj->attr = *PangoGlyphVisAttr_val(v_attr);
    CAMLreturn(Val_PangoGlyphInfo(obj));
}

