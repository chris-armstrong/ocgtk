/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListStore */

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

/* Type-specific conversion macros for GtkListStore */
#ifndef Val_GtkListStore
#define GtkListStore_val(val) ((GtkListStore*)ext_of_val(val))
#define Val_GtkListStore(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListStore */


CAMLexport CAMLprim value ml_gtk_list_store_newv(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkListStore *obj = gtk_list_store_newv(Int_val(arg1), arg2);
CAMLreturn(Val_GtkListStore(obj));
}

CAMLexport CAMLprim value ml_gtk_list_store_swap(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_list_store_swap(GtkListStore_val(self), GtkTreeIter_val(arg1), GtkTreeIter_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_list_store_remove(GtkListStore_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_store_prepend(value self)
{
CAMLparam1(self);
GtkTreeIter out1;

gtk_list_store_prepend(GtkListStore_val(self), &out1);
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_list_store_move_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_list_store_move_before(GtkListStore_val(self), GtkTreeIter_val(arg1), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_move_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_list_store_move_after(GtkListStore_val(self), GtkTreeIter_val(arg1), Option_val(arg2, GtkTreeIter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_iter_is_valid(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_list_store_iter_is_valid(GtkListStore_val(self), GtkTreeIter_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_before(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gtk_list_store_insert_before(GtkListStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_list_store_insert_after(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gtk_list_store_insert_after(GtkListStore_val(self), &out1, Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_list_store_insert(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTreeIter out1;

gtk_list_store_insert(GtkListStore_val(self), &out1, Int_val(arg1));
CAMLreturn(Val_GtkTreeIter(out1));
}

CAMLexport CAMLprim value ml_gtk_list_store_clear(value self)
{
CAMLparam1(self);

gtk_list_store_clear(GtkListStore_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_store_append(value self)
{
CAMLparam1(self);
GtkTreeIter out1;

gtk_list_store_append(GtkListStore_val(self), &out1);
CAMLreturn(Val_GtkTreeIter(out1));
}
