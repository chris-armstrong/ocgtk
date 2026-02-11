/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScriptIter */

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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for PangoScriptIter (opaque record with hidden fields) */
PangoScriptIter *PangoScriptIter_val(value v) {
  return *(PangoScriptIter **)Data_custom_val(v);
}

value Val_PangoScriptIter(const PangoScriptIter *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoScriptIter_option(const PangoScriptIter *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoScriptIter(ptr));
}


CAMLexport CAMLprim value ml_pango_script_iter_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

PangoScriptIter *obj = pango_script_iter_new(String_val(arg1), Int_val(arg2));

CAMLreturn(Val_PangoScriptIter(obj));
}
CAMLexport CAMLprim value ml_pango_script_iter_next(value self)
{
CAMLparam1(self);

gboolean result = pango_script_iter_next(PangoScriptIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_script_iter_get_range(value self)
{
CAMLparam1(self);
const char* out1;
const char* out2;
PangoScript out3;

pango_script_iter_get_range(PangoScriptIter_val(self), &out1, &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, caml_copy_string(out1));
    Store_field(ret, 1, caml_copy_string(out2));
    Store_field(ret, 2, Val_PangoScript(out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_pango_script_iter_free(value self)
{
CAMLparam1(self);

pango_script_iter_free(PangoScriptIter_val(self));
CAMLreturn(Val_unit);
}
