/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeView */

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

/* Type-specific conversion macros for GtkTreeView */
#define GtkTreeView_val(val) ((GtkTreeView*)ext_of_val(val))
#define Val_GtkTreeView(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_view_new(value unit)
{
CAMLparam1(unit);
GtkTreeView *obj = gtk_tree_view_new();
CAMLreturn(Val_GtkTreeView(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_view_new_with_model(value arg1)
{
CAMLparam1(arg1);
GtkTreeView *obj = gtk_tree_view_new_with_model(GtkWidget_val(arg1));
CAMLreturn(Val_GtkTreeView(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_view_unset_rows_drag_source(value self)
{
CAMLparam1(self);

gtk_tree_view_unset_rows_drag_source(GtkTreeView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_unset_rows_drag_dest(value self)
{
CAMLparam1(self);

gtk_tree_view_unset_rows_drag_dest(GtkTreeView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_tooltip_row(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_set_tooltip_row(GtkTreeView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_tooltip_cell(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_tree_view_set_tooltip_cell(GtkTreeView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL), (Is_some(arg4) ? GtkWidget_val(Some_val(arg4)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_search_entry(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_search_entry(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_model(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_grid_lines(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_grid_lines(GtkTreeView_val(self), GtkTreeViewGridLines_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_expander_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_expander_column(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_drag_dest_row(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_set_drag_dest_row(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkTreeViewDropPosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_cursor_on_cell(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_tree_view_set_cursor_on_cell(GtkTreeView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_tree_view_set_cursor(GtkTreeView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_scroll_to_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_scroll_to_point(GtkTreeView_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_scroll_to_cell_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_tree_view_scroll_to_cell(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Bool_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_scroll_to_cell_bytecode(value * argv, int argn)
{
return ml_gtk_tree_view_scroll_to_cell_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_tree_view_row_expanded(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_view_row_expanded(GtkTreeView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_row_activated(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_row_activated(GtkTreeView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_remove_column(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_view_remove_column(GtkTreeView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_move_column_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_move_column_after(GtkTreeView_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_is_rubber_banding_active(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_is_rubber_banding_active(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_insert_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

int result = gtk_tree_view_insert_column(GtkTreeView_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_visible_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_tree_view_get_visible_range(GtkTreeView_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_tooltip_context_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

gboolean result = gtk_tree_view_get_tooltip_context(GtkTreeView_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3), (Is_some(arg4) ? GtkWidget_val(Some_val(arg4)) : NULL), GtkWidget_val(arg5), GtkWidget_val(arg6));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_tooltip_context_bytecode(value * argv, int argn)
{
return ml_gtk_tree_view_get_tooltip_context_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_selection(value self)
{
CAMLparam1(self);

GtkTreeSelection* result = gtk_tree_view_get_selection(GtkTreeView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_search_entry(value self)
{
CAMLparam1(self);

GtkEditable* result = gtk_tree_view_get_search_entry(GtkTreeView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_n_columns(value self)
{
CAMLparam1(self);

guint result = gtk_tree_view_get_n_columns(GtkTreeView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_tree_view_get_model(GtkTreeView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_grid_lines(value self)
{
CAMLparam1(self);

GtkTreeViewGridLines result = gtk_tree_view_get_grid_lines(GtkTreeView_val(self));
CAMLreturn(Val_GtkTreeViewGridLines(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_expander_column(value self)
{
CAMLparam1(self);

GtkTreeViewColumn* result = gtk_tree_view_get_expander_column(GtkTreeView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_drag_dest_row(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_get_drag_dest_row(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_dest_row_at_pos(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gboolean result = gtk_tree_view_get_dest_row_at_pos(GtkTreeView_val(self), Int_val(arg1), Int_val(arg2), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL), GtkWidget_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_get_cursor(GtkTreeView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_column(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeViewColumn* result = gtk_tree_view_get_column(GtkTreeView_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_expand_to_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_expand_to_path(GtkTreeView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_expand_row(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_tree_view_expand_row(GtkTreeView_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_expand_all(value self)
{
CAMLparam1(self);

gtk_tree_view_expand_all(GtkTreeView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_columns_autosize(value self)
{
CAMLparam1(self);

gtk_tree_view_columns_autosize(GtkTreeView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_collapse_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_view_collapse_row(GtkTreeView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_collapse_all(value self)
{
CAMLparam1(self);

gtk_tree_view_collapse_all(GtkTreeView_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_append_column(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_view_append_column(GtkTreeView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_activate_on_single_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activate-on-single-click", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_activate_on_single_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activate-on-single-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_enable_search(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-search", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_enable_search(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-search", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_enable_tree_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-tree-lines", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_enable_tree_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-tree-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_fixed_height_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "fixed-height-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_fixed_height_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "fixed-height-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_headers_clickable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "headers-clickable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_headers_clickable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "headers-clickable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_headers_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "headers-visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_headers_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "headers-visible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_hover_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "hover-expand", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_hover_expand(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "hover-expand", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_hover_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "hover-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_hover_selection(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "hover-selection", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_level_indentation(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "level-indentation", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_level_indentation(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "level-indentation", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_rubber_banding(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "rubber-banding", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_rubber_banding(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "rubber-banding", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_search_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "search-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_search_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "search-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_show_expanders(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-expanders", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_show_expanders(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-expanders", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_tooltip_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "tooltip-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_tooltip_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeView *obj = (GtkTreeView *)GtkTreeView_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "tooltip-column", c_value, NULL);
CAMLreturn(Val_unit);
}
