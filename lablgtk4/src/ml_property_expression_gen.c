/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PropertyExpression */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkPropertyExpression */
#ifndef Val_GtkPropertyExpression
#define GtkPropertyExpression_val(val) ((GtkPropertyExpression*)ext_of_val(val))
#define Val_GtkPropertyExpression(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPropertyExpression */


CAMLexport CAMLprim value ml_gtk_property_expression_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkPropertyExpression *obj = gtk_property_expression_new(arg1, Option_val(arg2, GtkExpression_val, NULL), String_val(arg3));
CAMLreturn(Val_GtkPropertyExpression(obj));
}

CAMLexport CAMLprim value ml_gtk_property_expression_new_for_pspec(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkPropertyExpression *obj = gtk_property_expression_new_for_pspec(Option_val(arg1, GtkExpression_val, NULL), arg2);
CAMLreturn(Val_GtkPropertyExpression(obj));
}

CAMLexport CAMLprim value ml_gtk_property_expression_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_property_expression_get_expression(GtkPropertyExpression_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}
