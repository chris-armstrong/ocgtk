/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ExpressionWatch */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkExpressionWatch */
#ifndef Val_GtkExpressionWatch
#define GtkExpressionWatch_val(val) ((GtkExpressionWatch*)ext_of_val(val))
#define Val_GtkExpressionWatch(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkExpressionWatch */


CAMLexport CAMLprim value ml_gtk_expression_watch_unwatch(value self)
{
CAMLparam1(self);

gtk_expression_watch_unwatch(GtkExpressionWatch_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expression_watch_unref(value self)
{
CAMLparam1(self);

gtk_expression_watch_unref(GtkExpressionWatch_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expression_watch_ref(value self)
{
CAMLparam1(self);

GtkExpressionWatch* result = gtk_expression_watch_ref(GtkExpressionWatch_val(self));
CAMLreturn(Val_GtkExpressionWatch(result));
}
