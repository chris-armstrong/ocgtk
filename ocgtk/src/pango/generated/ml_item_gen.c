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
  PangoItem *copy = g_boxed_copy(pango_item_get_type(), ptr);
  return ml_gir_record_val_ptr_with_type(pango_item_get_type(), copy);
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

#if PANGO_VERSION_CHECK(1,44,0)

CAMLexport CAMLprim value ml_pango_item_apply_attrs(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_item_apply_attrs(PangoItem_val(self), PangoAttrIterator_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_pango_item_apply_attrs(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Item requires Pango >= 1.44");
return Val_unit;
}
#endif
\
CAMLexport CAMLprim value ml_pango_item_get_offset(value self)
{
    CAMLparam1(self);
    PangoItem *rec = PangoItem_val(self);
    CAMLreturn(Val_int(rec->offset));
}

\
CAMLexport CAMLprim value ml_pango_item_get_length(value self)
{
    CAMLparam1(self);
    PangoItem *rec = PangoItem_val(self);
    CAMLreturn(Val_int(rec->length));
}

\
CAMLexport CAMLprim value ml_pango_item_get_num_chars(value self)
{
    CAMLparam1(self);
    PangoItem *rec = PangoItem_val(self);
    CAMLreturn(Val_int(rec->num_chars));
}

\
CAMLexport CAMLprim value ml_pango_item_get_analysis(value self)
{
    CAMLparam1(self);
    PangoItem *rec = PangoItem_val(self);
    CAMLreturn(Val_PangoAnalysis(&rec->analysis));
}

\
CAMLexport CAMLprim value ml_pango_item_set_offset(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoItem *rec = PangoItem_val(self);
    rec->offset = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_item_set_length(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoItem *rec = PangoItem_val(self);
    rec->length = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_item_set_num_chars(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoItem *rec = PangoItem_val(self);
    rec->num_chars = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_item_set_analysis(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoItem *rec = PangoItem_val(self);
    rec->analysis = *PangoAnalysis_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_item_make(value v_offset, value v_length, value v_num_chars, value v_analysis)
{
    CAMLparam4(v_offset, v_length, v_num_chars, v_analysis);
    PangoItem *obj = g_new0(PangoItem, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->offset = Int_val(v_offset);
    obj->length = Int_val(v_length);
    obj->num_chars = Int_val(v_num_chars);
    obj->analysis = *PangoAnalysis_val(v_analysis);
    CAMLreturn(Val_PangoItem(obj));
}


CAMLprim value ml_pango_item_get_type(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_long(pango_item_get_type()));
}
