/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PageRange */

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

/* Conversion functions for GtkPageRange (opaque record with hidden fields) */
GtkPageRange *GtkPageRange_val(value v) {
  return (GtkPageRange *)ml_gir_record_ptr_val(v, "GtkPageRange");
}

value Val_GtkPageRange(const GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkPageRange_option(const GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPageRange(ptr));
}

\
CAMLexport CAMLprim value ml_gtk_page_range_get_start(value self)
{
    CAMLparam1(self);
    GtkPageRange *rec = GtkPageRange_val(self);
    CAMLreturn(Val_int(rec->start));
}

\
CAMLexport CAMLprim value ml_gtk_page_range_get_end(value self)
{
    CAMLparam1(self);
    GtkPageRange *rec = GtkPageRange_val(self);
    CAMLreturn(Val_int(rec->end));
}

\
CAMLexport CAMLprim value ml_gtk_page_range_set_start(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPageRange *rec = GtkPageRange_val(self);
    rec->start = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_page_range_set_end(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPageRange *rec = GtkPageRange_val(self);
    rec->end = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_page_range_make(value v_start, value v_end)
{
    CAMLparam2(v_start, v_end);
    GtkPageRange *obj = g_new0(GtkPageRange, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->start = Int_val(v_start);
    obj->end = Int_val(v_end);
    CAMLreturn(Val_GtkPageRange(obj));
}

