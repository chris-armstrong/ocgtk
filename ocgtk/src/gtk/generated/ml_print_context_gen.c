/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintContext */

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


CAMLexport CAMLprim value ml_gtk_print_context_get_width(value self)
{
CAMLparam1(self);

double result = gtk_print_context_get_width(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_height(value self)
{
CAMLparam1(self);

double result = gtk_print_context_get_height(GtkPrintContext_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_context_get_hard_margins(value self)
{
CAMLparam1(self);
double out1;
double out2;
double out3;
double out4;

gboolean result = gtk_print_context_get_hard_margins(GtkPrintContext_val(self), &out1, &out2, &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(5, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_double(out1));
    Store_field(ret, 2, caml_copy_double(out2));
    Store_field(ret, 3, caml_copy_double(out3));
    Store_field(ret, 4, caml_copy_double(out4));
    CAMLreturn(ret);
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
