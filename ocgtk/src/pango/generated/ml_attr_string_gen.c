/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrString */

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

/* Conversion functions for PangoAttrString (opaque record with hidden fields) */
PangoAttrString *PangoAttrString_val(value v) {
  return (PangoAttrString *)ml_gir_record_ptr_val(v, "PangoAttrString");
}

value Val_PangoAttrString(const PangoAttrString *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrString_option(const PangoAttrString *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrString(ptr));
}

\
CAMLexport CAMLprim value ml_pango_attr_string_get_value(value self)
{
    CAMLparam1(self);
    PangoAttrString *rec = PangoAttrString_val(self);
    CAMLreturn(caml_copy_string(rec->value));
}

\
CAMLexport CAMLprim value ml_pango_attr_string_set_value(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrString *rec = PangoAttrString_val(self);
    g_free(rec->value);
    rec->value = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_string_make(value v_value)
{
    CAMLparam1(v_value);
    PangoAttrString *obj = g_new0(PangoAttrString, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->value = g_strdup(String_val(v_value));
    CAMLreturn(Val_PangoAttrString(obj));
}

