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


CAMLexport CAMLprim value ml_gtk_list_box_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_list_box_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_list_box_unselect_row(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_unselect_row(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_unselect_all(value self)
{
CAMLparam1(self);


    gtk_list_box_unselect_all(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_sort_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_list_box_set_sort_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_selection_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_set_selection_mode(GtkWidget_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_placeholder(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_set_placeholder(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_header_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_list_box_set_header_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_filter_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_list_box_set_filter_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_set_adjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_selected_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_box_selected_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_select_row(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_select_row(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_select_all(value self)
{
CAMLparam1(self);


    gtk_list_box_select_all(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_remove_all(value self)
{
CAMLparam1(self);


    gtk_list_box_remove_all(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_prepend(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_sort(value self)
{
CAMLparam1(self);


    gtk_list_box_invalidate_sort(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_headers(value self)
{
CAMLparam1(self);


    gtk_list_box_invalidate_headers(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_invalidate_filter(value self)
{
CAMLparam1(self);


    gtk_list_box_invalidate_filter(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_insert(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_list_box_insert(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_get_selection_mode(value self)
{
CAMLparam1(self);


    GtkSelectionMode result = gtk_list_box_get_selection_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_selected_row(value self)
{
CAMLparam1(self);


    GtkListBoxRow* result = gtk_list_box_get_selected_row(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_row_at_y(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkListBoxRow* result = gtk_list_box_get_row_at_y(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_row_at_index(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkListBoxRow* result = gtk_list_box_get_row_at_index(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_get_adjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_list_box_get_adjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_drag_unhighlight_row(value self)
{
CAMLparam1(self);


    gtk_list_box_drag_unhighlight_row(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_drag_highlight_row(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_drag_highlight_row(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_bind_model(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_list_box_bind_model(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_append(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_list_box_append(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_get_accept_unpaired_release(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accept-unpaired-release", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_accept_unpaired_release(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accept-unpaired-release", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_get_activate_on_single_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activate-on-single-click", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_activate_on_single_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activate-on-single-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_get_show_separators(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-separators", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_set_show_separators(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-separators", c_value, NULL);
CAMLreturn(Val_unit);
}
