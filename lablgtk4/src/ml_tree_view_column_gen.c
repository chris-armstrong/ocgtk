/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeViewColumn */

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

/* Type-specific conversion macros for GtkTreeViewColumn */
#define GtkTreeViewColumn_val(val) ((GtkTreeViewColumn*)ext_of_val(val))
#define Val_GtkTreeViewColumn(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_view_column_new(value unit)
{
CAMLparam1(unit);
GtkTreeViewColumn *obj = gtk_tree_view_column_new();
CAMLreturn(Val_GtkTreeViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkTreeViewColumn *obj = gtk_tree_view_column_new_with_area(GtkWidget_val(arg1));
CAMLreturn(Val_GtkTreeViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_new_with_attributes(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkTreeViewColumn *obj = gtk_tree_view_column_new_with_attributes(String_val(arg1), GtkWidget_val(arg2), arg3);
CAMLreturn(Val_GtkTreeViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_column_set_widget(GtkTreeViewColumn_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_order(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_column_set_sort_order(GtkTreeViewColumn_val(self), GtkSortType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sizing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_column_set_sizing(GtkTreeViewColumn_val(self), GtkTreeViewColumnSizing_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_queue_resize(value self)
{
CAMLparam1(self);

gtk_tree_view_column_queue_resize(GtkTreeViewColumn_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_pack_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_column_pack_start(GtkTreeViewColumn_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_pack_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_tree_view_column_pack_end(GtkTreeViewColumn_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_tree_view_column_get_widget(GtkTreeViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_tree_view(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_tree_view_column_get_tree_view(GtkTreeViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_order(value self)
{
CAMLparam1(self);

GtkSortType result = gtk_tree_view_column_get_sort_order(GtkTreeViewColumn_val(self));
CAMLreturn(Val_GtkSortType(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sizing(value self)
{
CAMLparam1(self);

GtkTreeViewColumnSizing result = gtk_tree_view_column_get_sizing(GtkTreeViewColumn_val(self));
CAMLreturn(Val_GtkTreeViewColumnSizing(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_button(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_tree_view_column_get_button(GtkTreeViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_focus_cell(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_column_focus_cell(GtkTreeViewColumn_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clicked(value self)
{
CAMLparam1(self);

gtk_tree_view_column_clicked(GtkTreeViewColumn_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clear_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_view_column_clear_attributes(GtkTreeViewColumn_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clear(value self)
{
CAMLparam1(self);

gtk_tree_view_column_clear(GtkTreeViewColumn_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_set_cell_data(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_tree_view_column_cell_set_cell_data(GtkTreeViewColumn_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_is_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_view_column_cell_is_visible(GtkTreeViewColumn_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_add_attribute(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_tree_view_column_add_attribute(GtkTreeViewColumn_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_alignment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "alignment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_alignment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "alignment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_clickable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "clickable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_clickable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "clickable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "expand", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_expand(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "expand", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_fixed_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "fixed-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_fixed_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "fixed-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_max_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_max_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_min_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "min-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_min_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_resizable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "resizable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_resizable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "resizable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_column_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "sort-column-id", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_column_id(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "sort-column-id", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_indicator(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sort-indicator", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_indicator(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sort-indicator", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_x_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeViewColumn *obj = (GtkTreeViewColumn *)GtkTreeViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "x-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
