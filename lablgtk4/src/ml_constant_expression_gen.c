/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConstantExpression */

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


CAMLexport CAMLprim value ml_gtk_constant_expression_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_constant_expression_new(arg1, arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_constant_expression_new_for_value(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_constant_expression_new_for_value(arg1);
CAMLreturn(Val_GtkWidget(widget));
}
