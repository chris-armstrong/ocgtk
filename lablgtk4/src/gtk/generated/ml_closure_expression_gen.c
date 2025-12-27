/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ClosureExpression */

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


CAMLexport CAMLprim value ml_gtk_closure_expression_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkClosureExpression *obj = gtk_closure_expression_new(arg1, arg2, Int_val(arg3), arg4);
CAMLreturn(Val_GtkClosureExpression(obj));
}
