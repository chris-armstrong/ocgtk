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
#ifndef Val_GtkTreeView
#define GtkTreeView_val(val) ((GtkTreeView*)ext_of_val(val))
#define Val_GtkTreeView(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeView */


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

gtk_tree_view_set_tooltip_row(GtkTreeView_val(self), GtkTooltip_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_tooltip_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_tooltip_column(GtkTreeView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_tooltip_cell(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_tree_view_set_tooltip_cell(GtkTreeView_val(self), GtkTooltip_val(arg1), Option_val(arg2, GtkWidget_val, NULL), Option_val(arg3, GtkTreeViewColumn_val, NULL), Option_val(arg4, GtkCellRenderer_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_show_expanders(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_show_expanders(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_search_entry(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_search_entry(GtkTreeView_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_search_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_search_column(GtkTreeView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_rubber_banding(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_rubber_banding(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_reorderable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_reorderable(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_model(GtkTreeView_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_level_indentation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_level_indentation(GtkTreeView_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_hover_selection(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_hover_selection(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_hover_expand(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_hover_expand(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_headers_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_headers_visible(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_headers_clickable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_headers_clickable(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_grid_lines(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_grid_lines(GtkTreeView_val(self), GtkTreeViewGridLines_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_fixed_height_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_fixed_height_mode(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_expander_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_expander_column(GtkTreeView_val(self), Option_val(arg1, GtkTreeViewColumn_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_enable_tree_lines(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_enable_tree_lines(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_enable_search(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_enable_search(GtkTreeView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_drag_dest_row(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_set_drag_dest_row(GtkTreeView_val(self), Option_val(arg1, GtkWidget_val, NULL), GtkTreeViewDropPosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_cursor_on_cell(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_tree_view_set_cursor_on_cell(GtkTreeView_val(self), GtkWidget_val(arg1), Option_val(arg2, GtkTreeViewColumn_val, NULL), Option_val(arg3, GtkCellRenderer_val, NULL), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_tree_view_set_cursor(GtkTreeView_val(self), GtkWidget_val(arg1), Option_val(arg2, GtkTreeViewColumn_val, NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_set_activate_on_single_click(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_set_activate_on_single_click(GtkTreeView_val(self), Bool_val(arg1));
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

gtk_tree_view_scroll_to_cell(GtkTreeView_val(self), Option_val(arg1, GtkWidget_val, NULL), Option_val(arg2, GtkTreeViewColumn_val, NULL), Bool_val(arg3), Double_val(arg4), Double_val(arg5));
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

gtk_tree_view_row_activated(GtkTreeView_val(self), GtkWidget_val(arg1), Option_val(arg2, GtkTreeViewColumn_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_remove_column(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_view_remove_column(GtkTreeView_val(self), GtkTreeViewColumn_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_move_column_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_move_column_after(GtkTreeView_val(self), GtkTreeViewColumn_val(arg1), Option_val(arg2, GtkTreeViewColumn_val, NULL));
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

int result = gtk_tree_view_insert_column(GtkTreeView_val(self), GtkTreeViewColumn_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_visible_range(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkTreePath* out2;

gboolean result = gtk_tree_view_get_visible_range(GtkTreeView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkWidget(out1));
    Store_field(ret, 2, Val_GtkWidget(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_tooltip_context(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GtkTreeModel* out4;
GtkTreePath* out5;
GtkTreeIter out6;

gboolean result = gtk_tree_view_get_tooltip_context(GtkTreeView_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3), &out4, &out5, &out6);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkWidget(out4));
    Store_field(ret, 2, Val_GtkWidget(out5));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_tooltip_column(value self)
{
CAMLparam1(self);

int result = gtk_tree_view_get_tooltip_column(GtkTreeView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_show_expanders(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_show_expanders(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_selection(value self)
{
CAMLparam1(self);

GtkTreeSelection* result = gtk_tree_view_get_selection(GtkTreeView_val(self));
CAMLreturn(Val_GtkTreeSelection(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_search_entry(value self)
{
CAMLparam1(self);

GtkEditable* result = gtk_tree_view_get_search_entry(GtkTreeView_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_search_column(value self)
{
CAMLparam1(self);

int result = gtk_tree_view_get_search_column(GtkTreeView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_rubber_banding(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_rubber_banding(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_reorderable(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_reorderable(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
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
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_level_indentation(value self)
{
CAMLparam1(self);

int result = gtk_tree_view_get_level_indentation(GtkTreeView_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_hover_selection(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_hover_selection(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_hover_expand(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_hover_expand(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_headers_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_headers_visible(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_headers_clickable(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_headers_clickable(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_grid_lines(value self)
{
CAMLparam1(self);

GtkTreeViewGridLines result = gtk_tree_view_get_grid_lines(GtkTreeView_val(self));
CAMLreturn(Val_GtkTreeViewGridLines(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_fixed_height_mode(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_fixed_height_mode(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_expander_column(value self)
{
CAMLparam1(self);

GtkTreeViewColumn* result = gtk_tree_view_get_expander_column(GtkTreeView_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeViewColumn));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_enable_tree_lines(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_enable_tree_lines(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_enable_search(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_enable_search(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_drag_dest_row(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkTreeViewDropPosition out2;

gtk_tree_view_get_drag_dest_row(GtkTreeView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GtkWidget(out1));
    Store_field(ret, 1, Val_GtkTreeViewDropPosition(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_dest_row_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GtkTreePath* out3;
GtkTreeViewDropPosition out4;

gboolean result = gtk_tree_view_get_dest_row_at_pos(GtkTreeView_val(self), Int_val(arg1), Int_val(arg2), &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkWidget(out3));
    Store_field(ret, 2, Val_GtkTreeViewDropPosition(out4));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_cursor(value self)
{
CAMLparam1(self);
GtkTreePath* out1;
GtkTreeViewColumn* out2;

gtk_tree_view_get_cursor(GtkTreeView_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GtkWidget(out1));
    Store_field(ret, 1, Val_GtkTreeViewColumn(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_column(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeViewColumn* result = gtk_tree_view_get_column(GtkTreeView_val(self), Int_val(arg1));
CAMLreturn(Val_option(result, Val_GtkTreeViewColumn));
}

CAMLexport CAMLprim value ml_gtk_tree_view_get_activate_on_single_click(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_get_activate_on_single_click(GtkTreeView_val(self));
CAMLreturn(Val_bool(result));
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

int result = gtk_tree_view_append_column(GtkTreeView_val(self), GtkTreeViewColumn_val(arg1));
CAMLreturn(Val_int(result));
}
