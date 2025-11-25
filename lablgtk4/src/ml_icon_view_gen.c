/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconView */

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

/* Type-specific conversion macros for GtkIconView */
#ifndef Val_GtkIconView
#define GtkIconView_val(val) ((GtkIconView*)ext_of_val(val))
#define Val_GtkIconView(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIconView */


CAMLexport CAMLprim value ml_gtk_icon_view_new(value unit)
{
CAMLparam1(unit);
GtkIconView *obj = gtk_icon_view_new();
CAMLreturn(Val_GtkIconView(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_view_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkIconView *obj = gtk_icon_view_new_with_area(GtkCellArea_val(arg1));
CAMLreturn(Val_GtkIconView(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_view_new_with_model(value arg1)
{
CAMLparam1(arg1);
GtkIconView *obj = gtk_icon_view_new_with_model(GtkWidget_val(arg1));
CAMLreturn(Val_GtkIconView(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_view_unset_model_drag_source(value self)
{
CAMLparam1(self);

gtk_icon_view_unset_model_drag_source(GtkIconView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_unset_model_drag_dest(value self)
{
CAMLparam1(self);

gtk_icon_view_unset_model_drag_dest(GtkIconView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_unselect_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_unselect_path(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_unselect_all(value self)
{
CAMLparam1(self);

gtk_icon_view_unselect_all(GtkIconView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_icon_view_set_tooltip_item(GtkIconView_val(self), GtkTooltip_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_tooltip_column(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_cell(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_icon_view_set_tooltip_cell(GtkIconView_val(self), GtkTooltip_val(arg1), GtkWidget_val(arg2), Option_val(arg3, GtkCellRenderer_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_text_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_text_column(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_spacing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_spacing(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_selection_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_selection_mode(GtkIconView_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_row_spacing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_row_spacing(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_reorderable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_reorderable(GtkIconView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_pixbuf_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_pixbuf_column(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_model(GtkIconView_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_markup_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_markup_column(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_margin(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_margin(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_item_width(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_padding(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_item_padding(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_item_orientation(GtkIconView_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_drag_dest_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_icon_view_set_drag_dest_item(GtkIconView_val(self), Option_val(arg1, GtkWidget_val, NULL), GtkIconViewDropPosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_icon_view_set_cursor(GtkIconView_val(self), GtkWidget_val(arg1), Option_val(arg2, GtkCellRenderer_val, NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_columns(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_columns(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_column_spacing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_column_spacing(GtkIconView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_activate_on_single_click(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_set_activate_on_single_click(GtkIconView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_select_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_select_path(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_select_all(value self)
{
CAMLparam1(self);

gtk_icon_view_select_all(GtkIconView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_scroll_to_path(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_icon_view_scroll_to_path(GtkIconView_val(self), GtkWidget_val(arg1), Bool_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_path_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_icon_view_path_is_selected(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_item_activated(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_item_activated(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_visible_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_icon_view_get_visible_range(GtkIconView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_context_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

gboolean result = gtk_icon_view_get_tooltip_context(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3), GtkWidget_val(arg4), GtkWidget_val(arg5), GtkWidget_val(arg6));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_context_bytecode(value * argv, int argn)
{
return ml_gtk_icon_view_get_tooltip_context_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_column(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_tooltip_column(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_text_column(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_text_column(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_spacing(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_spacing(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_selection_mode(value self)
{
CAMLparam1(self);

GtkSelectionMode result = gtk_icon_view_get_selection_mode(GtkIconView_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_row_spacing(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_row_spacing(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_reorderable(value self)
{
CAMLparam1(self);

gboolean result = gtk_icon_view_get_reorderable(GtkIconView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_pixbuf_column(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_pixbuf_column(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_path_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkTreePath* result = gtk_icon_view_get_path_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_icon_view_get_model(GtkIconView_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_markup_column(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_markup_column(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_margin(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_margin(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_width(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_item_width(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_row(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_icon_view_get_item_row(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_padding(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_item_padding(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_orientation(value self)
{
CAMLparam1(self);

GtkOrientation result = gtk_icon_view_get_item_orientation(GtkIconView_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_column(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_icon_view_get_item_column(GtkIconView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_at_pos(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gboolean result = gtk_icon_view_get_item_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), GtkWidget_val(arg3), GtkWidget_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_drag_dest_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_icon_view_get_drag_dest_item(GtkIconView_val(self), Option_val(arg1, GtkWidget_val, NULL), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_dest_item_at_pos(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gboolean result = gtk_icon_view_get_dest_item_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), GtkWidget_val(arg3), GtkWidget_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_icon_view_get_cursor(GtkIconView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_columns(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_columns(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_column_spacing(value self)
{
CAMLparam1(self);

int result = gtk_icon_view_get_column_spacing(GtkIconView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_activate_on_single_click(value self)
{
CAMLparam1(self);

gboolean result = gtk_icon_view_get_activate_on_single_click(GtkIconView_val(self));
CAMLreturn(Val_bool(result));
}
