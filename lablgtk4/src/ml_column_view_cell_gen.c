/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewCell */

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

/* Type-specific conversion macros for GtkColumnViewCell */
#ifndef Val_GtkColumnViewCell
#define GtkColumnViewCell_val(val) ((GtkColumnViewCell*)ext_of_val(val))
#define Val_GtkColumnViewCell(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewCell */


CAMLexport CAMLprim value ml_gtk_column_view_cell_set_focusable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_cell_set_focusable(GtkColumnViewCell_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_cell_set_child(GtkColumnViewCell_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_selected(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_cell_get_selected(GtkColumnViewCell_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_position(value self)
{
CAMLparam1(self);

guint result = gtk_column_view_cell_get_position(GtkColumnViewCell_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_focusable(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_cell_get_focusable(GtkColumnViewCell_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_column_view_cell_get_child(GtkColumnViewCell_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}
