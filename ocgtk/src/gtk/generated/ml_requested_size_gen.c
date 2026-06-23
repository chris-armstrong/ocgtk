/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RequestedSize */

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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Conversion functions for GtkRequestedSize (opaque record with hidden fields) */
GtkRequestedSize *GtkRequestedSize_val(value v) {
  return (GtkRequestedSize *)ml_gir_record_ptr_val(v, "GtkRequestedSize");
}

value Val_GtkRequestedSize(const GtkRequestedSize *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkRequestedSize_option(const GtkRequestedSize *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkRequestedSize(ptr));
}

\
CAMLexport CAMLprim value ml_gtk_requested_size_get_minimum_size(value self)
{
    CAMLparam1(self);
    GtkRequestedSize *rec = GtkRequestedSize_val(self);
    CAMLreturn(Val_int(rec->minimum_size));
}

\
CAMLexport CAMLprim value ml_gtk_requested_size_get_natural_size(value self)
{
    CAMLparam1(self);
    GtkRequestedSize *rec = GtkRequestedSize_val(self);
    CAMLreturn(Val_int(rec->natural_size));
}

\
CAMLexport CAMLprim value ml_gtk_requested_size_set_minimum_size(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRequestedSize *rec = GtkRequestedSize_val(self);
    rec->minimum_size = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_requested_size_set_natural_size(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRequestedSize *rec = GtkRequestedSize_val(self);
    rec->natural_size = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_requested_size_make(value v_minimum_size, value v_natural_size)
{
    CAMLparam2(v_minimum_size, v_natural_size);
    GtkRequestedSize *obj = g_new0(GtkRequestedSize, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->minimum_size = Int_val(v_minimum_size);
    obj->natural_size = Int_val(v_natural_size);
    CAMLreturn(Val_GtkRequestedSize(obj));
}

