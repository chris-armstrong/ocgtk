/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeSortable */

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


CAMLexport CAMLprim value ml_gtk_tree_sortable_sort_column_changed(value self)
{
CAMLparam1(self);

gtk_tree_sortable_sort_column_changed(GtkTreeSortable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_sort_column_id(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_sortable_set_sort_column_id(GtkTreeSortable_val(self), Int_val(arg1), GtkSortType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_has_default_sort_func(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_sortable_has_default_sort_func(GtkTreeSortable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_get_sort_column_id(value self)
{
CAMLparam1(self);
int out1;
GtkSortType out2;

gboolean result = gtk_tree_sortable_get_sort_column_id(GtkTreeSortable_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_int(out1));
    Store_field(ret, 2, Val_GtkSortType(out2));
    CAMLreturn(ret);
}
