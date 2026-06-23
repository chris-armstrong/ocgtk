/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleTextRange */

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

#if GTK_CHECK_VERSION(4,14,0)
/* Conversion functions for GtkAccessibleTextRange (opaque record with hidden fields) */
GtkAccessibleTextRange *GtkAccessibleTextRange_val(value v) {
  return (GtkAccessibleTextRange *)ml_gir_record_ptr_val(v, "GtkAccessibleTextRange");
}

value Val_GtkAccessibleTextRange(const GtkAccessibleTextRange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkAccessibleTextRange_option(const GtkAccessibleTextRange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleTextRange(ptr));
}
#endif

#if GTK_CHECK_VERSION(4,14,0)

\
CAMLexport CAMLprim value ml_gtk_accessible_text_range_get_start(value self)
{
    CAMLparam1(self);
    GtkAccessibleTextRange *rec = GtkAccessibleTextRange_val(self);
    CAMLreturn(Val_gsize(rec->start));
}

\
CAMLexport CAMLprim value ml_gtk_accessible_text_range_get_length(value self)
{
    CAMLparam1(self);
    GtkAccessibleTextRange *rec = GtkAccessibleTextRange_val(self);
    CAMLreturn(Val_gsize(rec->length));
}

\
CAMLexport CAMLprim value ml_gtk_accessible_text_range_set_start(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkAccessibleTextRange *rec = GtkAccessibleTextRange_val(self);
    rec->start = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_accessible_text_range_set_length(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkAccessibleTextRange *rec = GtkAccessibleTextRange_val(self);
    rec->length = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_accessible_text_range_make(value v_start, value v_length)
{
    CAMLparam2(v_start, v_length);
    GtkAccessibleTextRange *obj = g_new0(GtkAccessibleTextRange, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->start = Gsize_val(v_start);
    obj->length = Gsize_val(v_length);
    CAMLreturn(Val_GtkAccessibleTextRange(obj));
}


#else


#endif
