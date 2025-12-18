/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridLayoutChild */

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

/* Type-specific conversion macros for GtkGridLayoutChild */
#ifndef Val_GtkGridLayoutChild
#define GtkGridLayoutChild_val(val) ((GtkGridLayoutChild*)ext_of_val(val))
#define Val_GtkGridLayoutChild(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGridLayoutChild */


CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_get_column: property 'column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_set_column: property 'column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column_span(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-span");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_get_column_span: property 'column-span' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "column-span", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column_span(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "column-span");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_set_column_span: property 'column-span' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "column-span", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_get_row: property 'row' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "row", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_set_row: property 'row' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "row", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row_span(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-span");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_get_row_span: property 'row-span' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "row-span", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row_span(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "row-span");
if (pspec == NULL) caml_failwith("ml_gtk_grid_layout_child_set_row_span: property 'row-span' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "row-span", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
