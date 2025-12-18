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
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCssSection */
#ifndef Val_GtkCssSection
#define GtkCssSection_val(val) ((GtkCssSection*)ext_of_val(val))
#define Val_GtkCssSection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCssSection */


CAMLexport CAMLprim value ml_gtk_css_section_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCssSection *obj = gtk_css_section_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkCssSection(obj));
}

CAMLexport CAMLprim value ml_gtk_css_section_unref(value self)
{
CAMLparam1(self);

gtk_css_section_unref(GtkCssSection_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_section_ref(value self)
{
CAMLparam1(self);

GtkCssSection* result = gtk_css_section_ref(GtkCssSection_val(self));
CAMLreturn(Val_GtkCssSection(result));
}

CAMLexport CAMLprim value ml_gtk_css_section_get_parent(value self)
{
CAMLparam1(self);

GtkCssSection* result = gtk_css_section_get_parent(GtkCssSection_val(self));
CAMLreturn(Val_option(result, Val_GtkCssSection));
}
