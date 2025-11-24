/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Expression */

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


CAMLexport CAMLprim value ml_gtk_expression_watch(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    GtkExpressionWatch* result = gtk_expression_watch(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_expression_unref(value self)
{
CAMLparam1(self);


    gtk_expression_unref(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expression_ref(value self)
{
CAMLparam1(self);


    GtkExpression* result = gtk_expression_ref(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_expression_is_static(value self)
{
CAMLparam1(self);


    gboolean result = gtk_expression_is_static(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_expression_evaluate(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_expression_evaluate(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_expression_bind(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    GtkExpressionWatch* result = gtk_expression_bind(GtkWidget_val(self), arg1, String_val(arg2), arg3);
CAMLreturn(Val_GtkWidget(result));
}
