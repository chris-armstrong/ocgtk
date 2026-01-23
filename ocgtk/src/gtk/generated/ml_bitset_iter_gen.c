/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BitsetIter */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GtkBitsetIter (opaque record with hidden fields) */
GtkBitsetIter *GtkBitsetIter_val(value v) {
  return *(GtkBitsetIter **)Data_custom_val(v);
}

value Val_GtkBitsetIter(const GtkBitsetIter *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkBitsetIter_option(const GtkBitsetIter *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkBitsetIter(ptr));
}


CAMLexport CAMLprim value ml_gtk_bitset_iter_previous(value self)
{
CAMLparam1(self);
guint out1;

gboolean result = gtk_bitset_iter_previous(GtkBitsetIter_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_int(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_bitset_iter_next(value self)
{
CAMLparam1(self);
guint out1;

gboolean result = gtk_bitset_iter_next(GtkBitsetIter_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_int(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_bitset_iter_is_valid(value self)
{
CAMLparam1(self);

gboolean result = gtk_bitset_iter_is_valid(GtkBitsetIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_iter_get_value(value self)
{
CAMLparam1(self);

guint result = gtk_bitset_iter_get_value(GtkBitsetIter_val(self));
CAMLreturn(Val_int(result));
}
