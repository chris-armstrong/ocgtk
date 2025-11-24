/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnView */

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

/* Type-specific conversion macros for GtkColumnView */
#define GtkColumnView_val(val) ((GtkColumnView*)ext_of_val(val))
#define Val_GtkColumnView(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_column_view_new(value arg1)
{
CAMLparam1(arg1);
GtkColumnView *obj = gtk_column_view_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkColumnView(obj));
}

CAMLexport CAMLprim value ml_gtk_column_view_sort_by_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_column_view_sort_by_column(GtkColumnView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkSortType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_tab_behavior(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_set_tab_behavior(GtkColumnView_val(self), GtkListTabBehavior_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_row_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_set_row_factory(GtkColumnView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_set_model(GtkColumnView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_header_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_set_header_factory(GtkColumnView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_scroll_to(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_column_view_scroll_to(GtkColumnView_val(self), Int_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), GtkListScrollFlags_val(arg3), (Is_some(arg4) ? GtkWidget_val(Some_val(arg4)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_remove_column(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_remove_column(GtkColumnView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_insert_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_column_view_insert_column(GtkColumnView_val(self), Int_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_tab_behavior(value self)
{
CAMLparam1(self);


    GtkListTabBehavior result = gtk_column_view_get_tab_behavior(GtkColumnView_val(self));
CAMLreturn(Val_GtkListTabBehavior(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_get_sorter(value self)
{
CAMLparam1(self);


    GtkSorter* result = gtk_column_view_get_sorter(GtkColumnView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_get_row_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_column_view_get_row_factory(GtkColumnView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_get_model(value self)
{
CAMLparam1(self);


    GtkSelectionModel* result = gtk_column_view_get_model(GtkColumnView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_get_header_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_column_view_get_header_factory(GtkColumnView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_append_column(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_column_view_append_column(GtkColumnView_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_enable_rubberband(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-rubberband", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_enable_rubberband(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-rubberband", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_show_column_separators(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-column-separators", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_show_column_separators(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-column-separators", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_show_row_separators(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-row-separators", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_show_row_separators(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-row-separators", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_get_single_click_activate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-click-activate", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_set_single_click_activate(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnView *obj = (GtkColumnView *)GtkColumnView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-click-activate", c_value, NULL);
CAMLreturn(Val_unit);
}
