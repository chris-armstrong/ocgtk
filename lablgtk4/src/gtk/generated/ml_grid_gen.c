/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Grid */

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

/* Type-specific conversion macros for GtkGrid */
#ifndef Val_GtkGrid
#define GtkGrid_val(val) ((GtkGrid*)ext_of_val(val))
#define Val_GtkGrid(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGrid */


CAMLexport CAMLprim value ml_gtk_grid_new(value unit)
{
CAMLparam1(unit);
GtkGrid *obj = gtk_grid_new();
CAMLreturn(Val_GtkGrid(obj));
}

CAMLexport CAMLprim value ml_gtk_grid_set_row_baseline_position(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_grid_set_row_baseline_position(GtkGrid_val(self), Int_val(arg1), GtkBaselinePosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_remove_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_remove_row(GtkGrid_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_remove_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_remove_column(GtkGrid_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_remove(GtkGrid_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_insert_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_insert_row(GtkGrid_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_insert_next_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_grid_insert_next_to(GtkGrid_val(self), GtkWidget_val(arg1), GtkPositionType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_insert_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_insert_column(GtkGrid_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_get_row_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkBaselinePosition result = gtk_grid_get_row_baseline_position(GtkGrid_val(self), Int_val(arg1));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_grid_get_child_at(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkWidget* result = gtk_grid_get_child_at(GtkGrid_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_grid_attach_next_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_grid_attach_next_to(GtkGrid_val(self), GtkWidget_val(arg1), GtkWidget_option_val(arg2), GtkPositionType_val(arg3), Int_val(arg4), Int_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_attach_next_to_bytecode(value * argv, int argn)
{
return ml_gtk_grid_attach_next_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_grid_attach_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_grid_attach(GtkGrid_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4), Int_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_attach_bytecode(value * argv, int argn)
{
return ml_gtk_grid_attach_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_grid_get_baseline_row(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-row");
if (pspec == NULL) caml_failwith("ml_gtk_grid_get_baseline_row: property 'baseline-row' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "baseline-row", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_set_baseline_row(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-row");
if (pspec == NULL) caml_failwith("ml_gtk_grid_set_baseline_row: property 'baseline-row' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "baseline-row", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_get_column_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_grid_get_column_homogeneous: property 'column-homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "column-homogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_set_column_homogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_grid_set_column_homogeneous: property 'column-homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "column-homogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_get_column_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_grid_get_column_spacing: property 'column-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "column-spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_set_column_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_grid_set_column_spacing: property 'column-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "column-spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_get_row_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_grid_get_row_homogeneous: property 'row-homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "row-homogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_set_row_homogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_grid_set_row_homogeneous: property 'row-homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "row-homogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_get_row_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_grid_get_row_spacing: property 'row-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "row-spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_set_row_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGrid *obj = (GtkGrid *)GtkGrid_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-spacing");
if (pspec == NULL) caml_failwith("ml_gtk_grid_set_row_spacing: property 'row-spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "row-spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
