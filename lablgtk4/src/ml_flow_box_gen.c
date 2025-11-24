/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FlowBox */

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

/* Type-specific conversion macros for GtkFlowBox */
#define GtkFlowBox_val(val) ((GtkFlowBox*)ext_of_val(val))
#define Val_GtkFlowBox(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_flow_box_new(value unit)
{
CAMLparam1(unit);
GtkFlowBox *obj = gtk_flow_box_new();
CAMLreturn(Val_GtkFlowBox(obj));
}

CAMLexport CAMLprim value ml_gtk_flow_box_unselect_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_unselect_child(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_unselect_all(value self)
{
CAMLparam1(self);


    gtk_flow_box_unselect_all(GtkFlowBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_vadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_set_vadjustment(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_selection_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_set_selection_mode(GtkFlowBox_val(self), GtkSelectionMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_hadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_set_hadjustment(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_select_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_select_child(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_select_all(value self)
{
CAMLparam1(self);


    gtk_flow_box_select_all(GtkFlowBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_remove_all(value self)
{
CAMLparam1(self);


    gtk_flow_box_remove_all(GtkFlowBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_remove(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_prepend(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_invalidate_sort(value self)
{
CAMLparam1(self);


    gtk_flow_box_invalidate_sort(GtkFlowBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_invalidate_filter(value self)
{
CAMLparam1(self);


    gtk_flow_box_invalidate_filter(GtkFlowBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_insert(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_flow_box_insert(GtkFlowBox_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_selection_mode(value self)
{
CAMLparam1(self);


    GtkSelectionMode result = gtk_flow_box_get_selection_mode(GtkFlowBox_val(self));
CAMLreturn(Val_GtkSelectionMode(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_child_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkFlowBoxChild* result = gtk_flow_box_get_child_at_pos(GtkFlowBox_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_child_at_index(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkFlowBoxChild* result = gtk_flow_box_get_child_at_index(GtkFlowBox_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_append(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_append(GtkFlowBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_accept_unpaired_release(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accept-unpaired-release", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_accept_unpaired_release(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accept-unpaired-release", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_activate_on_single_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activate-on-single-click", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_activate_on_single_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activate-on-single-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_column_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "column-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_column_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "column-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "homogeneous", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_homogeneous(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "homogeneous", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_max_children_per_line(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "max-children-per-line", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_max_children_per_line(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-children-per-line", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_min_children_per_line(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "min-children-per-line", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_min_children_per_line(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-children-per-line", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_get_row_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "row-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_flow_box_set_row_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFlowBox *obj = (GtkFlowBox *)GtkFlowBox_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "row-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}
