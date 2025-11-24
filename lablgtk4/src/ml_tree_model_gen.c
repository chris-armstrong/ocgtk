/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeModel */

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


CAMLexport CAMLprim value ml_gtk_tree_model_unref_node(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_unref_node(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_rows_reordered_with_length(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_model_rows_reordered_with_length(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), arg3, Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_rows_reordered(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_model_rows_reordered(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_inserted(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_inserted(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_has_child_toggled(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_has_child_toggled(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_deleted(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_row_deleted(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_changed(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_ref_node(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_ref_node(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_previous(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_previous(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_parent(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_iter_parent(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_nth_child(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_tree_model_iter_nth_child(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_next(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_next(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_n_children(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_tree_model_iter_n_children(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_has_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_has_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_children(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_iter_children(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_model_get_value(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_valist(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_get_valist(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreePath* result = gtk_tree_model_get_path(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_n_columns(value self)
{
CAMLparam1(self);


    int result = gtk_tree_model_get_n_columns(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_from_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_get_iter_from_string(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_first(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_get_iter_first(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_get_iter(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_flags(value self)
{
CAMLparam1(self);


    GtkTreeModelFlags result = gtk_tree_model_get_flags(GtkWidget_val(self));
CAMLreturn(Val_GtkTreeModelFlags(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_new(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreeModel* result = gtk_tree_model_filter_new(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(result));
}
