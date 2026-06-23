/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphGeometry */

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

/* Conversion functions for PangoGlyphGeometry (opaque record with hidden fields) */
PangoGlyphGeometry *PangoGlyphGeometry_val(value v) {
  return (PangoGlyphGeometry *)ml_gir_record_ptr_val(v, "PangoGlyphGeometry");
}

value Val_PangoGlyphGeometry(const PangoGlyphGeometry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoGlyphGeometry_option(const PangoGlyphGeometry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoGlyphGeometry(ptr));
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_get_width(value self)
{
    CAMLparam1(self);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    CAMLreturn(Val_int(rec->width));
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_get_x_offset(value self)
{
    CAMLparam1(self);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    CAMLreturn(Val_int(rec->x_offset));
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_get_y_offset(value self)
{
    CAMLparam1(self);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    CAMLreturn(Val_int(rec->y_offset));
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_set_width(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    rec->width = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_set_x_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    rec->x_offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_set_y_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphGeometry *rec = PangoGlyphGeometry_val(self);
    rec->y_offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_geometry_make(value v_width, value v_x_offset, value v_y_offset)
{
    CAMLparam3(v_width, v_x_offset, v_y_offset);
    PangoGlyphGeometry *obj = g_new0(PangoGlyphGeometry, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->width = Int_val(v_width);
    obj->x_offset = Int_val(v_x_offset);
    obj->y_offset = Int_val(v_y_offset);
    CAMLreturn(Val_PangoGlyphGeometry(obj));
}

