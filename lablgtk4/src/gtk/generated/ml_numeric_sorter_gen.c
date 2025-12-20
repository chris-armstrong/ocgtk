/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NumericSorter */

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

/* Type-specific conversion macros for GtkNumericSorter */
#ifndef Val_GtkNumericSorter
#define GtkNumericSorter_val(val) ((GtkNumericSorter*)ext_of_val(val))
#define Val_GtkNumericSorter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkNumericSorter */


CAMLexport CAMLprim value ml_gtk_numeric_sorter_new(value arg1)
{
CAMLparam1(arg1);
GtkNumericSorter *obj = gtk_numeric_sorter_new(Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_GtkNumericSorter(obj));
}

CAMLexport CAMLprim value ml_gtk_numeric_sorter_set_sort_order(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_numeric_sorter_set_sort_order(GtkNumericSorter_val(self), GtkSortType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_numeric_sorter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_numeric_sorter_set_expression(GtkNumericSorter_val(self), Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_numeric_sorter_get_sort_order(value self)
{
CAMLparam1(self);

GtkSortType result = gtk_numeric_sorter_get_sort_order(GtkNumericSorter_val(self));
CAMLreturn(Val_GtkSortType(result));
}

CAMLexport CAMLprim value ml_gtk_numeric_sorter_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_numeric_sorter_get_expression(GtkNumericSorter_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}
