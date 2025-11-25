/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellEditable */

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

/* Type-specific conversion macros for GtkCellEditable */
#ifndef Val_GtkCellEditable
#define GtkCellEditable_val(val) ((GtkCellEditable*)ext_of_val(val))
#define Val_GtkCellEditable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellEditable */


CAMLexport CAMLprim value ml_gtk_cell_editable_start_editing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_editable_start_editing(GtkCellEditable_val(self), Option_val(arg1, GdkEvent_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_remove_widget(value self)
{
CAMLparam1(self);

gtk_cell_editable_remove_widget(GtkCellEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_editing_done(value self)
{
CAMLparam1(self);

gtk_cell_editable_editing_done(GtkCellEditable_val(self));
CAMLreturn(Val_unit);
}
