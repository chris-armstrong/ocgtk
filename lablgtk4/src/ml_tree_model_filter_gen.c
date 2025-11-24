/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeModelFilter */

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

/* Type-specific conversion macros for GtkTreeModelFilter */
#define GtkTreeModelFilter_val(val) ((GtkTreeModelFilter*)ext_of_val(val))
#define Val_GtkTreeModelFilter(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_model_filter_set_visible_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_model_filter_set_visible_column(GtkTreeModelFilter_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_refilter(value self)
{
CAMLparam1(self);

gtk_tree_model_filter_refilter(GtkTreeModelFilter_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_tree_model_filter_get_model(GtkTreeModelFilter_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_convert_path_to_child_path(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreePath* result = gtk_tree_model_filter_convert_path_to_child_path(GtkTreeModelFilter_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_convert_iter_to_child_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_model_filter_convert_iter_to_child_iter(GtkTreeModelFilter_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_convert_child_path_to_path(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreePath* result = gtk_tree_model_filter_convert_child_path_to_path(GtkTreeModelFilter_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_convert_child_iter_to_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_tree_model_filter_convert_child_iter_to_iter(GtkTreeModelFilter_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_clear_cache(value self)
{
CAMLparam1(self);

gtk_tree_model_filter_clear_cache(GtkTreeModelFilter_val(self));
CAMLreturn(Val_unit);
}
