/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeSelection */

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


CAMLexport CAMLprim value ml_gtk_tree_selection_unselect_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_selection_unselect_range(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_unselect_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_selection_unselect_path(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_unselect_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_selection_unselect_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_unselect_all(value self)
{
CAMLparam1(self);


    gtk_tree_selection_unselect_all(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_set_select_function(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_selection_set_select_function(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_set_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_selection_set_mode(GtkWidget_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_selected_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_selection_selected_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_select_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_selection_select_range(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_select_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_selection_select_path(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_select_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_selection_select_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_select_all(value self)
{
CAMLparam1(self);


    gtk_tree_selection_select_all(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_selection_path_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_selection_path_is_selected(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_selection_iter_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_selection_iter_is_selected(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_selection_get_tree_view(value self)
{
CAMLparam1(self);


    GtkTreeView* result = gtk_tree_selection_get_tree_view(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_selection_get_selected(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_selection_get_selected(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_selection_get_mode(value self)
{
CAMLparam1(self);


    GtkSelectionMode result = gtk_tree_selection_get_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_tree_selection_count_selected_rows(value self)
{
CAMLparam1(self);


    int result = gtk_tree_selection_count_selected_rows(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}
