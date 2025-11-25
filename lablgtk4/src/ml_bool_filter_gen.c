/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BoolFilter */

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

/* Type-specific conversion macros for GtkBoolFilter */
#ifndef Val_GtkBoolFilter
#define GtkBoolFilter_val(val) ((GtkBoolFilter*)ext_of_val(val))
#define Val_GtkBoolFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBoolFilter */


CAMLexport CAMLprim value ml_gtk_bool_filter_new(value arg1)
{
CAMLparam1(arg1);
GtkBoolFilter *obj = gtk_bool_filter_new(Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_GtkBoolFilter(obj));
}

CAMLexport CAMLprim value ml_gtk_bool_filter_set_invert(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bool_filter_set_invert(GtkBoolFilter_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bool_filter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bool_filter_set_expression(GtkBoolFilter_val(self), Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bool_filter_get_invert(value self)
{
CAMLparam1(self);

gboolean result = gtk_bool_filter_get_invert(GtkBoolFilter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bool_filter_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_bool_filter_get_expression(GtkBoolFilter_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}
