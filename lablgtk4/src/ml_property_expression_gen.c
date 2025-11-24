/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PropertyExpression */

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


CAMLexport CAMLprim value ml_gtk_property_expression_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_property_expression_new(arg1, (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), String_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_property_expression_new_for_pspec(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_property_expression_new_for_pspec((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_property_expression_get_expression(value self)
{
CAMLparam1(self);


    GtkExpression* result = gtk_property_expression_get_expression(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
