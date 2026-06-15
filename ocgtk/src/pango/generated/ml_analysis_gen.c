/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Analysis */

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

/* Conversion functions for PangoAnalysis (opaque record with hidden fields) */
PangoAnalysis *PangoAnalysis_val(value v) {
  return (PangoAnalysis *)ml_gir_record_ptr_val(v, "PangoAnalysis");
}

value Val_PangoAnalysis(const PangoAnalysis *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAnalysis_option(const PangoAnalysis *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAnalysis(ptr));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_font(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_PangoFont(rec->font));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_level(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_int(rec->level));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_gravity(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_int(rec->gravity));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_flags(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_int(rec->flags));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_script(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_int(rec->script));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_language(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_PangoLanguage(rec->language));
}

\
CAMLexport CAMLprim value ml_pango_analysis_get_extra_attrs(value self)
{
    CAMLparam1(self);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    CAMLreturn(Val_int(rec->extra_attrs));
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_font(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->font = PangoFont_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_level(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->level = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_gravity(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->gravity = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_flags(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->flags = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_script(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->script = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_language(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->language = PangoLanguage_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_set_extra_attrs(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAnalysis *rec = PangoAnalysis_val(self);
    rec->extra_attrs = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_analysis_make_native(value v_font, value v_level, value v_gravity, value v_flags, value v_script, value v_language, value v_extra_attrs)
{
    CAMLparam5(v_font, v_level, v_gravity, v_flags, v_script);
CAMLxparam2(v_language, v_extra_attrs);

    PangoAnalysis *obj = g_new0(PangoAnalysis, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->font = PangoFont_val(v_font);
    obj->level = Int_val(v_level);
    obj->gravity = Int_val(v_gravity);
    obj->flags = Int_val(v_flags);
    obj->script = Int_val(v_script);
    obj->language = PangoLanguage_val(v_language);
    obj->extra_attrs = Int_val(v_extra_attrs);
    CAMLreturn(Val_PangoAnalysis(obj));
}
\
CAMLexport CAMLprim value ml_pango_analysis_make_bytecode(value * argv, int argn)
{
    return ml_pango_analysis_make_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

