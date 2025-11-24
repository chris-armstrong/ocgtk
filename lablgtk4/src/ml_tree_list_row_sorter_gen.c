/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeListRowSorter */

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

/* Type-specific conversion macros for GtkTreeListRowSorter */
#define GtkTreeListRowSorter_val(val) ((GtkTreeListRowSorter*)ext_of_val(val))
#define Val_GtkTreeListRowSorter(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_list_row_sorter_new(value arg1)
{
CAMLparam1(arg1);
GtkTreeListRowSorter *obj = gtk_tree_list_row_sorter_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkTreeListRowSorter(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_sorter_set_sorter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_list_row_sorter_set_sorter(GtkTreeListRowSorter_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_sorter_get_sorter(value self)
{
CAMLparam1(self);

GtkSorter* result = gtk_tree_list_row_sorter_get_sorter(GtkTreeListRowSorter_val(self));
CAMLreturn(Val_GtkWidget(result));
}
