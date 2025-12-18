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
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkTreeSortable */
#ifndef Val_GtkTreeSortable
#define GtkTreeSortable_val(val) ((GtkTreeSortable*)ext_of_val(val))
#define Val_GtkTreeSortable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeSortable */


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
