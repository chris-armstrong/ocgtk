/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellView */

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

/* Type-specific conversion macros for GtkCellView */
#ifndef Val_GtkCellView
#define GtkCellView_val(val) ((GtkCellView*)ext_of_val(val))
#define Val_GtkCellView(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellView */


CAMLexport CAMLprim value ml_gtk_cell_view_new(value unit)
{
CAMLparam1(unit);
GtkCellView *obj = gtk_cell_view_new();
CAMLreturn(Val_GtkCellView(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_view_new_with_context(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkCellView *obj = gtk_cell_view_new_with_context(GtkCellArea_val(arg1), GtkCellAreaContext_val(arg2));
CAMLreturn(Val_GtkCellView(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_view_new_with_markup(value arg1)
{
CAMLparam1(arg1);
GtkCellView *obj = gtk_cell_view_new_with_markup(String_val(arg1));
CAMLreturn(Val_GtkCellView(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_view_new_with_text(value arg1)
{
CAMLparam1(arg1);
GtkCellView *obj = gtk_cell_view_new_with_text(String_val(arg1));
CAMLreturn(Val_GtkCellView(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_view_new_with_texture(value arg1)
{
CAMLparam1(arg1);
GtkCellView *obj = gtk_cell_view_new_with_texture(arg1);
CAMLreturn(Val_GtkCellView(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_view_set_model(GtkCellView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_view_set_fit_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_view_set_fit_model(GtkCellView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_view_set_draw_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_view_set_draw_sensitive(GtkCellView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_view_set_displayed_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_view_set_displayed_row(GtkCellView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_view_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_cell_view_get_model(GtkCellView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_view_get_fit_model(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_view_get_fit_model(GtkCellView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_view_get_draw_sensitive(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_view_get_draw_sensitive(GtkCellView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_view_get_displayed_row(value self)
{
CAMLparam1(self);

GtkTreePath* result = gtk_cell_view_get_displayed_row(GtkCellView_val(self));
CAMLreturn(Val_GtkWidget(result));
}
