/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreePath */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkTreePath */
#ifndef Val_GtkTreePath
#define GtkTreePath_val(val) ((GtkTreePath*)ext_of_val(val))
#define Val_GtkTreePath(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreePath */


CAMLexport CAMLprim value ml_gtk_tree_path_new(value unit)
{
CAMLparam1(unit);
GtkTreePath *obj = gtk_tree_path_new();
CAMLreturn(Val_GtkTreePath(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_path_new_first(value unit)
{
CAMLparam1(unit);
GtkTreePath *obj = gtk_tree_path_new_first();
CAMLreturn(Val_GtkTreePath(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_path_new_from_indicesv(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkTreePath *obj = gtk_tree_path_new_from_indicesv(arg1, arg2);
CAMLreturn(Val_GtkTreePath(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_path_new_from_string(value arg1)
{
CAMLparam1(arg1);
GtkTreePath *obj = gtk_tree_path_new_from_string(String_val(arg1));
CAMLreturn(Val_GtkTreePath(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_path_up(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_path_up(GtkTreePath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_prev(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_path_prev(GtkTreePath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_prepend_index(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_path_prepend_index(GtkTreePath_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_next(value self)
{
CAMLparam1(self);

gtk_tree_path_next(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_is_descendant(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_path_is_descendant(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_is_ancestor(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_path_is_ancestor(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_get_depth(value self)
{
CAMLparam1(self);

int result = gtk_tree_path_get_depth(GtkTreePath_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_free(value self)
{
CAMLparam1(self);

gtk_tree_path_free(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_down(value self)
{
CAMLparam1(self);

gtk_tree_path_down(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_copy(value self)
{
CAMLparam1(self);

GtkTreePath* result = gtk_tree_path_copy(GtkTreePath_val(self));
CAMLreturn(Val_GtkTreePath(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_compare(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_path_compare(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_append_index(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_path_append_index(GtkTreePath_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}
