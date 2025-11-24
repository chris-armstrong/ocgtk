/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeSortable */

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


CAMLexport CAMLprim value ml_gtk_tree_sortable_sort_column_changed(value self)
{
CAMLparam1(self);


    gtk_tree_sortable_sort_column_changed(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_sort_func(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_sortable_set_sort_func(GtkWidget_val(self), Int_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_sort_column_id(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_sortable_set_sort_column_id(GtkWidget_val(self), Int_val(arg1), GtkSortType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_default_sort_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_sortable_set_default_sort_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_has_default_sort_func(value self)
{
CAMLparam1(self);


    gboolean result = gtk_tree_sortable_has_default_sort_func(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_get_sort_column_id(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_sortable_get_sort_column_id(GtkWidget_val(self), arg1, GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}
