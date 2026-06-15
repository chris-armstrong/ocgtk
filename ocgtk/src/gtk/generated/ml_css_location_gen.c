/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CssLocation */

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

/* Conversion functions for GtkCssLocation (opaque record with hidden fields) */
GtkCssLocation *GtkCssLocation_val(value v) {
  return (GtkCssLocation *)ml_gir_record_ptr_val(v, "GtkCssLocation");
}

value Val_GtkCssLocation(const GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkCssLocation_option(const GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCssLocation(ptr));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_get_bytes(value self)
{
    CAMLparam1(self);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    CAMLreturn(Val_gsize(rec->bytes));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_get_chars(value self)
{
    CAMLparam1(self);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    CAMLreturn(Val_gsize(rec->chars));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_get_lines(value self)
{
    CAMLparam1(self);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    CAMLreturn(Val_gsize(rec->lines));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_get_line_bytes(value self)
{
    CAMLparam1(self);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    CAMLreturn(Val_gsize(rec->line_bytes));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_get_line_chars(value self)
{
    CAMLparam1(self);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    CAMLreturn(Val_gsize(rec->line_chars));
}

\
CAMLexport CAMLprim value ml_gtk_css_location_set_bytes(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    rec->bytes = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_css_location_set_chars(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    rec->chars = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_css_location_set_lines(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    rec->lines = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_css_location_set_line_bytes(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    rec->line_bytes = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_css_location_set_line_chars(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkCssLocation *rec = GtkCssLocation_val(self);
    rec->line_chars = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_css_location_make(value v_bytes, value v_chars, value v_lines, value v_line_bytes, value v_line_chars)
{
    CAMLparam5(v_bytes, v_chars, v_lines, v_line_bytes, v_line_chars);
    GtkCssLocation *obj = g_new0(GtkCssLocation, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->bytes = Gsize_val(v_bytes);
    obj->chars = Gsize_val(v_chars);
    obj->lines = Gsize_val(v_lines);
    obj->line_bytes = Gsize_val(v_line_bytes);
    obj->line_chars = Gsize_val(v_line_chars);
    CAMLreturn(Val_GtkCssLocation(obj));
}

