/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeModel */

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

/* Type-specific conversion macros for GtkTreeModel */
#ifndef Val_GtkTreeModel
#define GtkTreeModel_val(val) ((GtkTreeModel*)ext_of_val(val))
#define Val_GtkTreeModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeModel */


CAMLexport CAMLprim value ml_gtk_tree_model_unref_node(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_model_unref_node(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_rows_reordered(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_tree_model_rows_reordered(GtkTreeModel_val(self), GtkTreePath_val(arg1), GtkTreeIter_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_inserted(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_model_row_inserted(GtkTreeModel_val(self), GtkTreePath_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_has_child_toggled(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_model_row_has_child_toggled(GtkTreeModel_val(self), GtkTreePath_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_deleted(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_model_row_deleted(GtkTreeModel_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_model_row_changed(GtkTreeModel_val(self), GtkTreePath_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_ref_node(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_model_ref_node(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_previous(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_model_iter_previous(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_parent(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gboolean result = gtk_tree_model_iter_parent(GtkTreeModel_val(self), &out1, GtkTreeIter_val(arg1));
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_nth_child(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreeIter out1;

gboolean result = gtk_tree_model_iter_nth_child(GtkTreeModel_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL), Int_val(arg2));
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_next(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_model_iter_next(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_n_children(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_model_iter_n_children(GtkTreeModel_val(self), Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_has_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_model_iter_has_child(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_children(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gboolean result = gtk_tree_model_iter_children(GtkTreeModel_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL));
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_string_from_iter(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = gtk_tree_model_get_string_from_iter(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_path(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreePath* result = gtk_tree_model_get_path(GtkTreeModel_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_GtkTreePath(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_n_columns(value self)
{
CAMLparam1(self);

int result = gtk_tree_model_get_n_columns(GtkTreeModel_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_from_string(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gboolean result = gtk_tree_model_get_iter_from_string(GtkTreeModel_val(self), &out1, String_val(arg1));
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_first(value self)
{
CAMLparam1(self);
GtkTreeIter out1;

gboolean result = gtk_tree_model_get_iter_first(GtkTreeModel_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gboolean result = gtk_tree_model_get_iter(GtkTreeModel_val(self), &out1, GtkTreePath_val(arg1));
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_flags(value self)
{
CAMLparam1(self);

GtkTreeModelFlags result = gtk_tree_model_get_flags(GtkTreeModel_val(self));
CAMLreturn(Val_GtkTreeModelFlags(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_new(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeModel* result = gtk_tree_model_filter_new(GtkTreeModel_val(self), Option_val(arg1, GtkTreePath_val, NULL));
CAMLreturn(Val_GtkTreeModel(result));
}
