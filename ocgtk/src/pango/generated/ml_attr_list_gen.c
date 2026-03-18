/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrList */

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

/* Conversion functions for PangoAttrList (opaque record with hidden fields) */
PangoAttrList *PangoAttrList_val(value v) {
  return *(PangoAttrList **)Data_custom_val(v);
}

value Val_PangoAttrList(const PangoAttrList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrList_option(const PangoAttrList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrList(ptr));
}


CAMLexport CAMLprim value ml_pango_attr_list_new(value unit)
{
CAMLparam1(unit);

PangoAttrList *obj = pango_attr_list_new();

CAMLreturn(Val_PangoAttrList(obj));
}
CAMLexport CAMLprim value ml_pango_attr_list_update(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

pango_attr_list_update(PangoAttrList_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attr_list_unref(value self)
{
CAMLparam1(self);

pango_attr_list_unref(PangoAttrList_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attr_list_to_string(value self)
{
CAMLparam1(self);

char* result = pango_attr_list_to_string(PangoAttrList_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_pango_attr_list_splice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

pango_attr_list_splice(PangoAttrList_val(self), PangoAttrList_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attr_list_ref(value self)
{
CAMLparam1(self);

PangoAttrList* result = pango_attr_list_ref(PangoAttrList_val(self));
CAMLreturn(Val_PangoAttrList(result));
}

CAMLexport CAMLprim value ml_pango_attr_list_insert_before(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_attr_list_insert_before(PangoAttrList_val(self), PangoAttribute_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attr_list_insert(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_attr_list_insert(PangoAttrList_val(self), PangoAttribute_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attr_list_get_iterator(value self)
{
CAMLparam1(self);

PangoAttrIterator* result = pango_attr_list_get_iterator(PangoAttrList_val(self));
CAMLreturn(Val_PangoAttrIterator(result));
}

CAMLexport CAMLprim value ml_pango_attr_list_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = pango_attr_list_equal(PangoAttrList_val(self), PangoAttrList_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_attr_list_copy(value self)
{
CAMLparam1(self);

PangoAttrList* result = pango_attr_list_copy(PangoAttrList_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrList));
}

CAMLexport CAMLprim value ml_pango_attr_list_change(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_attr_list_change(PangoAttrList_val(self), PangoAttribute_val(arg1));
CAMLreturn(Val_unit);
}
