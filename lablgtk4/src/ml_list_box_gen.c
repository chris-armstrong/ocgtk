/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListBox */

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

/* Type-specific conversion macros for GtkListBox */
#ifndef Val_GtkListBox
#define GtkListBox_val(val) ((GtkListBox*)ext_of_val(val))
#define Val_GtkListBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListBox */


CAMLexport CAMLprim value ml_gtk_list_box_new(value unit)
{
CAMLparam1(unit);
GtkListBox *obj = gtk_list_box_new();
CAMLreturn(Val_GtkListBox(obj));
}

CAMLexport CAMLprim value ml_gtk_list_box_unselect_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_unselect_row(GtkListBox_val(self), GtkListBoxRow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_unselect_all(value self)
{
CAMLparam1(self);

gtk_list_box_unselect_all(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_show_separators(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_set_show_separators(GtkListBox_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_selection_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_set_selection_mode(GtkListBox_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_placeholder(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_set_placeholder(GtkListBox_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_set_adjustment(GtkListBox_val(self), (Is_some(arg1) ? GtkAdjustment_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_activate_on_single_click(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_set_activate_on_single_click(GtkListBox_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_select_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_select_row(GtkListBox_val(self), (Is_some(arg1) ? GtkListBoxRow_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_select_all(value self)
{
CAMLparam1(self);

gtk_list_box_select_all(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_remove_all(value self)
{
CAMLparam1(self);

gtk_list_box_remove_all(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_remove(GtkListBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_prepend(GtkListBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_sort(value self)
{
CAMLparam1(self);

gtk_list_box_invalidate_sort(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_headers(value self)
{
CAMLparam1(self);

gtk_list_box_invalidate_headers(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_filter(value self)
{
CAMLparam1(self);

gtk_list_box_invalidate_filter(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_insert(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_list_box_insert(GtkListBox_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_get_show_separators(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_box_get_show_separators(GtkListBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_selection_mode(value self)
{
CAMLparam1(self);

GtkSelectionMode result = gtk_list_box_get_selection_mode(GtkListBox_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_selected_row(value self)
{
CAMLparam1(self);

GtkListBoxRow* result = gtk_list_box_get_selected_row(GtkListBox_val(self));
CAMLreturn(Val_GtkListBoxRow(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_row_at_y(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkListBoxRow* result = gtk_list_box_get_row_at_y(GtkListBox_val(self), Int_val(arg1));
CAMLreturn(Val_GtkListBoxRow(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_row_at_index(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkListBoxRow* result = gtk_list_box_get_row_at_index(GtkListBox_val(self), Int_val(arg1));
CAMLreturn(Val_GtkListBoxRow(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_adjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_list_box_get_adjustment(GtkListBox_val(self));
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_activate_on_single_click(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_box_get_activate_on_single_click(GtkListBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_drag_unhighlight_row(value self)
{
CAMLparam1(self);

gtk_list_box_drag_unhighlight_row(GtkListBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_drag_highlight_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_drag_highlight_row(GtkListBox_val(self), GtkListBoxRow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_append(GtkListBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
