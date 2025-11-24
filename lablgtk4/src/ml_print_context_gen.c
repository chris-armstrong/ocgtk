/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintContext */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkPrintContext */
#define GtkPrintContext_val(val) ((GtkPrintContext*)ext_of_val(val))
#define Val_GtkPrintContext(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_print_context_get_width(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_width(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_page_setup(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_print_context_get_page_setup(GtkPrintContext_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_height(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_height(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_dpi_y(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_dpi_y(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_dpi_x(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_dpi_x(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}
