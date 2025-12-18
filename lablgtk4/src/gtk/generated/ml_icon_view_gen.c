/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconView */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
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
GtkIconView *obj = gtk_icon_view_new_with_model(GtkTreeModel_val(arg1));
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

gtk_icon_view_unselect_path(GtkIconView_val(self), GtkTreePath_val(arg1));
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

gtk_icon_view_set_tooltip_item(GtkIconView_val(self), GtkTooltip_val(arg1), GtkTreePath_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_cell(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_icon_view_set_tooltip_cell(GtkIconView_val(self), GtkTooltip_val(arg1), GtkTreePath_val(arg2), Option_val(arg3, GtkCellRenderer_val, NULL));
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

gtk_icon_view_set_model(GtkIconView_val(self), Option_val(arg1, GtkTreeModel_val, NULL));
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

gtk_icon_view_set_drag_dest_item(GtkIconView_val(self), Option_val(arg1, GtkTreePath_val, NULL), GtkIconViewDropPosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_icon_view_set_cursor(GtkIconView_val(self), GtkTreePath_val(arg1), Option_val(arg2, GtkCellRenderer_val, NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_select_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_select_path(GtkIconView_val(self), GtkTreePath_val(arg1));
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

gtk_icon_view_scroll_to_path(GtkIconView_val(self), GtkTreePath_val(arg1), Bool_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_path_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_icon_view_path_is_selected(GtkIconView_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_item_activated(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_view_item_activated(GtkIconView_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_visible_range(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkTreePath* out2;

gboolean result = gtk_icon_view_get_visible_range(GtkIconView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreePath(out1));
    Store_field(ret, 2, Val_GtkTreePath(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_context(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GtkTreeModel* out4;
GtkTreePath* out5;
GtkTreeIter out6;

gboolean result = gtk_icon_view_get_tooltip_context(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3), &out4, &out5, &out6);
CAMLlocal1(ret);
    ret = caml_alloc(4, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeModel(out4));
    Store_field(ret, 2, Val_GtkTreePath(out5));
    Store_field(ret, 3, Val_GtkTreeIter(out6));
    CAMLreturn(ret);
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
CAMLreturn(Val_option(result, Val_GtkTreePath));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_icon_view_get_model(GtkIconView_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeModel));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_row(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_icon_view_get_item_row(GtkIconView_val(self), GtkTreePath_val(arg1));
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

int result = gtk_icon_view_get_item_column(GtkIconView_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreePath* out3;
GtkCellRenderer* out4;

gboolean result = gtk_icon_view_get_item_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreePath(out3));
    Store_field(ret, 2, Val_GtkCellRenderer(out4));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_drag_dest_item(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkIconViewDropPosition out2;

gtk_icon_view_get_drag_dest_item(GtkIconView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GtkTreePath(out1));
    Store_field(ret, 1, Val_GtkIconViewDropPosition(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_dest_item_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreePath* out3;
GtkIconViewDropPosition out4;

gboolean result = gtk_icon_view_get_dest_item_at_pos(GtkIconView_val(self), Int_val(arg1), Int_val(arg2), &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreePath(out3));
    Store_field(ret, 2, Val_GtkIconViewDropPosition(out4));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_cursor(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkCellRenderer* out2;

gboolean result = gtk_icon_view_get_cursor(GtkIconView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreePath(out1));
    Store_field(ret, 2, Val_GtkCellRenderer(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_activate_on_single_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activate-on-single-click");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_activate_on_single_click: property 'activate-on-single-click' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "activate-on-single-click", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_activate_on_single_click(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activate-on-single-click");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_activate_on_single_click: property 'activate-on-single-click' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "activate-on-single-click", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_column_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_column_spacing: property 'column-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "column-spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_column_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_column_spacing: property 'column-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "column-spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "columns");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_columns: property 'columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "columns", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_columns(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "columns");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_columns: property 'columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "columns", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_padding(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "item-padding");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_item_padding: property 'item-padding' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "item-padding", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_padding(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "item-padding");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_item_padding: property 'item-padding' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "item-padding", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_item_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "item-width");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_item_width: property 'item-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "item-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_item_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "item-width");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_item_width: property 'item-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "item-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "margin");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_margin: property 'margin' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "margin", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "margin");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_margin: property 'margin' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "margin", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_markup_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_markup_column: property 'markup-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "markup-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_markup_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_markup_column: property 'markup-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "markup-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_pixbuf_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pixbuf-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_pixbuf_column: property 'pixbuf-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "pixbuf-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_pixbuf_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pixbuf-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_pixbuf_column: property 'pixbuf-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "pixbuf-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "reorderable");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_reorderable: property 'reorderable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "reorderable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_reorderable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "reorderable");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_reorderable: property 'reorderable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "reorderable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_row_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_row_spacing: property 'row-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "row-spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_row_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_row_spacing: property 'row-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "row-spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_text_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_view_get_tooltip_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "tooltip-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_get_tooltip_column: property 'tooltip-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "tooltip-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_view_set_tooltip_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconView *obj = (GtkIconView *)GtkIconView_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "tooltip-column");
if (pspec == NULL) caml_failwith("ml_gtk_icon_view_set_tooltip_column: property 'tooltip-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "tooltip-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
