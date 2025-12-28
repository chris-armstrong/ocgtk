/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ObjectExpression */

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


CAMLexport CAMLprim value ml_gtk_object_expression_new(value arg1)
{
CAMLparam1(arg1);
GtkObjectExpression *obj = gtk_object_expression_new(arg1);
CAMLreturn(Val_GtkObjectExpression(obj));
}
