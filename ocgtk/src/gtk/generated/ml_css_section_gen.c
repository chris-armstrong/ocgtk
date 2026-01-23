/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CssSection */

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

/* Conversion functions for GtkCssSection (opaque record with hidden fields) */
GtkCssSection *GtkCssSection_val(value v) {
  return *(GtkCssSection **)Data_custom_val(v);
}

value Val_GtkCssSection(const GtkCssSection *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkCssSection_option(const GtkCssSection *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCssSection(ptr));
}


CAMLexport CAMLprim value ml_gtk_css_section_unref(value self)
{
CAMLparam1(self);

gtk_css_section_unref(GtkCssSection_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_section_to_string(value self)
{
CAMLparam1(self);

char* result = gtk_css_section_to_string(GtkCssSection_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_css_section_ref(value self)
{
CAMLparam1(self);

GtkCssSection* result = gtk_css_section_ref(GtkCssSection_val(self));
CAMLreturn(Val_GtkCssSection(result));
}

CAMLexport CAMLprim value ml_gtk_css_section_get_start_location(value self)
{
CAMLparam1(self);

const GtkCssLocation* result = gtk_css_section_get_start_location(GtkCssSection_val(self));
CAMLreturn(Val_GtkCssLocation(result));
}

CAMLexport CAMLprim value ml_gtk_css_section_get_parent(value self)
{
CAMLparam1(self);

GtkCssSection* result = gtk_css_section_get_parent(GtkCssSection_val(self));
CAMLreturn(Val_option(result, Val_GtkCssSection));
}

CAMLexport CAMLprim value ml_gtk_css_section_get_end_location(value self)
{
CAMLparam1(self);

const GtkCssLocation* result = gtk_css_section_get_end_location(GtkCssSection_val(self));
CAMLreturn(Val_GtkCssLocation(result));
}
