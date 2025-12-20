/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeStore */

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

/* Type-specific conversion macros for GtkTreeStore */
#ifndef Val_GtkTreeStore
#define GtkTreeStore_val(val) ((GtkTreeStore*)ext_of_val(val))
#define Val_GtkTreeStore(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeStore */


CAMLexport CAMLprim value ml_gtk_tree_store_newv(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkTreeStore *obj = gtk_tree_store_newv(Int_val(arg1), arg2);
CAMLreturn(Val_GtkTreeStore(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_store_swap(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_store_swap(GtkTreeStore_val(self), GtkTreeIter_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_store_remove(GtkTreeStore_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gtk_tree_store_prepend(GtkTreeStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_tree_store_move_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_store_move_before(GtkTreeStore_val(self), GtkTreeIter_val(arg1), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_move_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_store_move_after(GtkTreeStore_val(self), GtkTreeIter_val(arg1), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_iter_is_valid(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_store_iter_is_valid(GtkTreeStore_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_iter_depth(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_store_iter_depth(GtkTreeStore_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_is_ancestor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_tree_store_is_ancestor(GtkTreeStore_val(self), GtkTreeIter_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreeIter out1;

gtk_tree_store_insert_before(GtkTreeStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreeIter out1;

gtk_tree_store_insert_after(GtkTreeStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreeIter out1;

gtk_tree_store_insert(GtkTreeStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL), Int_val(arg2));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_tree_store_clear(value self)
{
CAMLparam1(self);

gtk_tree_store_clear(GtkTreeStore_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_append(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gtk_tree_store_append(GtkTreeStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}
