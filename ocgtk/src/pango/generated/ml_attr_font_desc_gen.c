/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFontDesc */

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

/* Conversion functions for PangoAttrFontDesc (opaque record with hidden fields) */
PangoAttrFontDesc *PangoAttrFontDesc_val(value v) {
  return (PangoAttrFontDesc *)ml_gir_record_ptr_val(v, "PangoAttrFontDesc");
}

value Val_PangoAttrFontDesc(const PangoAttrFontDesc *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFontDesc_option(const PangoAttrFontDesc *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFontDesc(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_font_desc_get_attr(value self)
{
    CAMLparam1(self);
    PangoAttrFontDesc *rec = PangoAttrFontDesc_val(self);
    CAMLreturn(Val_PangoAttribute(&rec->attr));
}

\
CAMLexport CAMLprim value ml_pango_attr_font_desc_get_desc(value self)
{
    CAMLparam1(self);
    PangoAttrFontDesc *rec = PangoAttrFontDesc_val(self);
    CAMLreturn(Val_PangoFontDescription(rec->desc));
}

\
CAMLexport CAMLprim value ml_pango_attr_font_desc_set_attr(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrFontDesc *rec = PangoAttrFontDesc_val(self);
    rec->attr = *PangoAttribute_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_font_desc_set_desc(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrFontDesc *rec = PangoAttrFontDesc_val(self);
    rec->desc = PangoFontDescription_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_font_desc_make(value v_attr, value v_desc)
{
    CAMLparam2(v_attr, v_desc);
    PangoAttrFontDesc *obj = g_new0(PangoAttrFontDesc, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->attr = *PangoAttribute_val(v_attr);
    obj->desc = PangoFontDescription_val(v_desc);
    CAMLreturn(Val_PangoAttrFontDesc(obj));
}

