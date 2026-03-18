/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Item */

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

/* Copy function for PangoItem (value-like record with copy method) */
value copy_PangoItem(const PangoItem *ptr)
{
  if (ptr == NULL) return Val_none;
  PangoItem *copy = pango_item_copy((PangoItem*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_pango_item_new(value unit)
{
CAMLparam1(unit);

PangoItem *obj = pango_item_new();

CAMLreturn(Val_PangoItem(obj));
}
CAMLexport CAMLprim value ml_pango_item_split(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

PangoItem* result = pango_item_split(PangoItem_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_PangoItem(result));
}

CAMLexport CAMLprim value ml_pango_item_free(value self)
{
CAMLparam1(self);

pango_item_free(PangoItem_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_item_copy(value self)
{
CAMLparam1(self);

PangoItem* result = pango_item_copy(PangoItem_val(self));
CAMLreturn(Val_option(result, Val_PangoItem));
}

CAMLexport CAMLprim value ml_pango_item_apply_attrs(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_item_apply_attrs(PangoItem_val(self), PangoAttrIterator_val(arg1));
CAMLreturn(Val_unit);
}
