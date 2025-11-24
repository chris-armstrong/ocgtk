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
#define GtkIconView_val(val) ((GtkIconView*)ext_of_val(val))
#define Val_GtkIconView(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_icon_view_new(value unit)
{
CAMLparam1(unit);
GtkIconView *obj = gtk_icon_view_new();
CAMLreturn(Val_GtkIconView(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_view_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkIconView *obj = gtk_icon_view_new_with_area(GtkWidget_val(arg1));
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


    gtk_icon_view_set_tooltip_item(GtkIconView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_cell(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_icon_view_set_tooltip_cell(GtkIconView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_selection_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_view_set_selection_mode(GtkIconView_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_view_set_model(GtkIconView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
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


    gtk_icon_view_set_drag_dest_item(GtkIconView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkIconViewDropPosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_icon_view_set_cursor(GtkIconView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Bool_val(arg3));
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

CAMLexport CAMLprim value ml_gtk_icon_view_get_selection_mode(value self)
{
CAMLparam1(self);


    GtkSelectionMode result = gtk_icon_view_get_selection_mode(GtkIconView_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_path_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkTreePath* result = gtk_icon_view_get_path_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_model(value self)
{
CAMLparam1(self);


    GtkTreeModel* result = gtk_icon_view_get_model(GtkIconView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_row(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_icon_view_get_item_row(GtkIconView_val(self), GtkWidget_val(arg1));
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


    gtk_icon_view_get_drag_dest_item(GtkIconView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkWidget_val(arg2));
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

CAMLexport CAMLprim value ml_gtk_icon_view_get_activate_on_single_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activate-on-single-click", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_activate_on_single_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activate-on-single-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_column_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "column-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_column_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "column-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "columns", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_columns(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "columns", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_padding(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "item-padding", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_padding(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "item-padding", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "item-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "item-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_markup_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "markup-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_markup_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "markup-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_pixbuf_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixbuf-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_pixbuf_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixbuf-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_row_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "row-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_row_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "row-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "text-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_text_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "text-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "tooltip-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "tooltip-column", c_value, NULL);
CAMLreturn(Val_unit);
}
