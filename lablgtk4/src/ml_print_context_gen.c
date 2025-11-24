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


CAMLexport CAMLprim value ml_gtk_print_context_set_cairo_context(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_print_context_set_cairo_context(GtkWidget_val(self), arg1, Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_context_get_width(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_width(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_page_setup(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_print_context_get_page_setup(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_height(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_height(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_hard_margins(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_print_context_get_hard_margins(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_dpi_y(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_dpi_y(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_dpi_x(value self)
{
CAMLparam1(self);


    double result = gtk_print_context_get_dpi_x(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}
