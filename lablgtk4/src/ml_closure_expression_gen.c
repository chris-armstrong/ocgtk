/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ClosureExpression */

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

/* Type-specific conversion macros for GtkClosureExpression */
#define GtkClosureExpression_val(val) ((GtkClosureExpression*)ext_of_val(val))
#define Val_GtkClosureExpression(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_closure_expression_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkClosureExpression *obj = gtk_closure_expression_new(arg1, arg2, Int_val(arg3), arg4);
CAMLreturn(Val_GtkClosureExpression(obj));
}
