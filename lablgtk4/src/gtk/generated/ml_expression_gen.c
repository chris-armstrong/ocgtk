/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Expression */

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

/* Type-specific conversion macros for GtkExpression */
#ifndef Val_GtkExpression
#define GtkExpression_val(val) ((GtkExpression*)ext_of_val(val))
#define Val_GtkExpression(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkExpression */


CAMLexport CAMLprim value ml_gtk_expression_unref(value self)
{
CAMLparam1(self);

gtk_expression_unref(GtkExpression_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expression_ref(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_expression_ref(GtkExpression_val(self));
CAMLreturn(Val_GtkExpression(result));
}

CAMLexport CAMLprim value ml_gtk_expression_is_static(value self)
{
CAMLparam1(self);

gboolean result = gtk_expression_is_static(GtkExpression_val(self));
CAMLreturn(Val_bool(result));
}
