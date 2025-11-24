/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeDragSource */

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

/* Type-specific conversion macros for GtkTreeDragSource */
#define GtkTreeDragSource_val(val) ((GtkTreeDragSource*)ext_of_val(val))
#define Val_GtkTreeDragSource(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_drag_source_row_draggable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_drag_source_row_draggable(GtkTreeDragSource_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_drag_source_drag_data_delete(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_drag_source_drag_data_delete(GtkTreeDragSource_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}
