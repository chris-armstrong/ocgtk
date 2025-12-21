/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CClosureExpression */

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

/* Type-specific conversion macros for GtkCClosureExpression */
#ifndef Val_GtkCClosureExpression
#define GtkCClosureExpression_val(val) ((GtkCClosureExpression*)ext_of_val(val))
#define Val_GtkCClosureExpression(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCClosureExpression */


CAMLexport CAMLprim value ml_gtk_cclosure_expression_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam2(arg6, arg7);
GtkCClosureExpression *obj = gtk_cclosure_expression_new(arg1, arg2, Int_val(arg3), arg4, arg5, arg6, arg7);
CAMLreturn(Val_GtkCClosureExpression(obj));
}

CAMLexport CAMLprim value ml_gtk_cclosure_expression_new_bytecode(value * argv, int argn)
{
return ml_gtk_cclosure_expression_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}
