/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeDragDest */

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


CAMLexport CAMLprim value ml_gtk_tree_drag_dest_row_drop_possible(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_drag_dest_row_drop_possible(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_drag_dest_drag_data_received(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_drag_dest_drag_data_received(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}
