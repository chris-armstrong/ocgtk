/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ObjectExpression */

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

/* Type-specific conversion macros for GtkObjectExpression */
#ifndef Val_GtkObjectExpression
#define GtkObjectExpression_val(val) ((GtkObjectExpression*)ext_of_val(val))
#define Val_GtkObjectExpression(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkObjectExpression */


CAMLexport CAMLprim value ml_gtk_object_expression_new(value arg1)
{
CAMLparam1(arg1);
GtkObjectExpression *obj = gtk_object_expression_new(arg1);
CAMLreturn(Val_GtkObjectExpression(obj));
}
