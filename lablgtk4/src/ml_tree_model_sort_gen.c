/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeModelSort */

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

/* Type-specific conversion macros for GtkTreeModelSort */
#define GtkTreeModelSort_val(val) ((GtkTreeModelSort*)ext_of_val(val))
#define Val_GtkTreeModelSort(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_model_sort_new_with_model(value arg1)
{
CAMLparam1(arg1);
GtkTreeModelSort *obj = gtk_tree_model_sort_new_with_model(GtkWidget_val(arg1));
CAMLreturn(Val_GtkTreeModelSort(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_reset_default_sort_func(value self)
{
CAMLparam1(self);


    gtk_tree_model_sort_reset_default_sort_func(GtkTreeModelSort_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_iter_is_valid(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_sort_iter_is_valid(GtkTreeModelSort_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_get_model(value self)
{
CAMLparam1(self);


    GtkTreeModel* result = gtk_tree_model_sort_get_model(GtkTreeModelSort_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_convert_path_to_child_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreePath* result = gtk_tree_model_sort_convert_path_to_child_path(GtkTreeModelSort_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_convert_iter_to_child_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_sort_convert_iter_to_child_iter(GtkTreeModelSort_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_convert_child_path_to_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreePath* result = gtk_tree_model_sort_convert_child_path_to_path(GtkTreeModelSort_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_convert_child_iter_to_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_sort_convert_child_iter_to_iter(GtkTreeModelSort_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_sort_clear_cache(value self)
{
CAMLparam1(self);


    gtk_tree_model_sort_clear_cache(GtkTreeModelSort_val(self));
CAMLreturn(Val_unit);
}
