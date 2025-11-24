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
#define GtkCellEditable_val(val) ((GtkCellEditable*)ext_of_val(val))
#define Val_GtkCellEditable(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_editable_start_editing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_editable_start_editing(GtkCellEditable_val(self), (Is_some(arg1) ? GdkEvent_val(Some_val(arg1)) : NULL));
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

CAMLexport CAMLprim value ml_gtk_cell_editable_get_editing_canceled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellEditable *obj = (GtkCellEditable *)GtkCellEditable_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editing-canceled", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_set_editing_canceled(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellEditable *obj = (GtkCellEditable *)GtkCellEditable_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editing-canceled", c_value, NULL);
CAMLreturn(Val_unit);
}
