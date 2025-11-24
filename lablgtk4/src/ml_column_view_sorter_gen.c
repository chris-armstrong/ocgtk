/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewSorter */

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


CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_primary_sort_order(value self)
{
CAMLparam1(self);


    GtkSortType result = gtk_column_view_sorter_get_primary_sort_order(GtkWidget_val(self));
CAMLreturn(Val_GtkSortType(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_primary_sort_column(value self)
{
CAMLparam1(self);


    GtkColumnViewColumn* result = gtk_column_view_sorter_get_primary_sort_column(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_nth_sort_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkColumnViewColumn* result = gtk_column_view_sorter_get_nth_sort_column(GtkWidget_val(self), Int_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_sorter_get_n_sort_columns(value self)
{
CAMLparam1(self);


    guint result = gtk_column_view_sorter_get_n_sort_columns(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}
