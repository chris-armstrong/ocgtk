/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrLanguage */

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

/* Conversion functions for PangoAttrLanguage (opaque record with hidden fields) */
PangoAttrLanguage *PangoAttrLanguage_val(value v) {
  return (PangoAttrLanguage *)ml_gir_record_ptr_val(v, "PangoAttrLanguage");
}

value Val_PangoAttrLanguage(const PangoAttrLanguage *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrLanguage_option(const PangoAttrLanguage *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrLanguage(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_language_get_value(value self)
{
    CAMLparam1(self);
    PangoAttrLanguage *rec = PangoAttrLanguage_val(self);
    CAMLreturn(Val_PangoLanguage(rec->value));
}

\
CAMLexport CAMLprim value ml_pango_attr_language_set_value(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrLanguage *rec = PangoAttrLanguage_val(self);
    rec->value = PangoLanguage_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_language_make(value v_value)
{
    CAMLparam1(v_value);
    PangoAttrLanguage *obj = g_new0(PangoAttrLanguage, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->value = PangoLanguage_val(v_value);
    CAMLreturn(Val_PangoAttrLanguage(obj));
}

