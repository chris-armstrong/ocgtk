/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewSorter */

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

/* Type-specific conversion macros for GtkColumnViewSorter */
#ifndef Val_GtkColumnViewSorter
#define GtkColumnViewSorter_val(val) ((GtkColumnViewSorter*)ext_of_val(val))
#define Val_GtkColumnViewSorter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewSorter */


CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_primary_sort_order(value self)
{
CAMLparam1(self);

GtkSortType result = gtk_column_view_sorter_get_primary_sort_order(GtkColumnViewSorter_val(self));
CAMLreturn(Val_GtkSortType(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_primary_sort_column(value self)
{
CAMLparam1(self);

GtkColumnViewColumn* result = gtk_column_view_sorter_get_primary_sort_column(GtkColumnViewSorter_val(self));
CAMLreturn(Val_option(result, Val_GtkColumnViewColumn));
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_nth_sort_column(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkSortType out2;

GtkColumnViewColumn* result = gtk_column_view_sorter_get_nth_sort_column(GtkColumnViewSorter_val(self), Int_val(arg1), &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_option(result, Val_GtkColumnViewColumn));
    Store_field(ret, 1, Val_GtkSortType(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_n_sort_columns(value self)
{
CAMLparam1(self);

guint result = gtk_column_view_sorter_get_n_sort_columns(GtkColumnViewSorter_val(self));
CAMLreturn(Val_int(result));
}
