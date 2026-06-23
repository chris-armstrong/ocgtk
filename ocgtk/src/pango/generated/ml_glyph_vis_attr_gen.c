/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphVisAttr */

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

/* Conversion functions for PangoGlyphVisAttr (opaque record with hidden fields) */
PangoGlyphVisAttr *PangoGlyphVisAttr_val(value v) {
  return (PangoGlyphVisAttr *)ml_gir_record_ptr_val(v, "PangoGlyphVisAttr");
}

value Val_PangoGlyphVisAttr(const PangoGlyphVisAttr *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoGlyphVisAttr_option(const PangoGlyphVisAttr *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoGlyphVisAttr(ptr));
}

\
CAMLexport CAMLprim value ml_pango_glyph_vis_attr_get_is_cluster_start(value self)
{
    CAMLparam1(self);
    PangoGlyphVisAttr *rec = PangoGlyphVisAttr_val(self);
    CAMLreturn(Val_int(rec->is_cluster_start));
}

\
CAMLexport CAMLprim value ml_pango_glyph_vis_attr_get_is_color(value self)
{
    CAMLparam1(self);
    PangoGlyphVisAttr *rec = PangoGlyphVisAttr_val(self);
    CAMLreturn(Val_int(rec->is_color));
}

\
CAMLexport CAMLprim value ml_pango_glyph_vis_attr_set_is_cluster_start(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphVisAttr *rec = PangoGlyphVisAttr_val(self);
    rec->is_cluster_start = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_vis_attr_set_is_color(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoGlyphVisAttr *rec = PangoGlyphVisAttr_val(self);
    rec->is_color = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_glyph_vis_attr_make(value v_is_cluster_start, value v_is_color)
{
    CAMLparam2(v_is_cluster_start, v_is_color);
    PangoGlyphVisAttr *obj = g_new0(PangoGlyphVisAttr, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->is_cluster_start = Int_val(v_is_cluster_start);
    obj->is_color = Int_val(v_is_color);
    CAMLreturn(Val_PangoGlyphVisAttr(obj));
}

