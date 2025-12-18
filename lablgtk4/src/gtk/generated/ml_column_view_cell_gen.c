/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewCell */

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

/* Type-specific conversion macros for GtkColumnViewCell */
#ifndef Val_GtkColumnViewCell
#define GtkColumnViewCell_val(val) ((GtkColumnViewCell*)ext_of_val(val))
#define Val_GtkColumnViewCell(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewCell */


CAMLexport CAMLprim value ml_gtk_column_view_cell_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_cell_set_child(GtkColumnViewCell_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_column_view_cell_get_child(GtkColumnViewCell_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_focusable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewCell *obj = (GtkColumnViewCell *)GtkColumnViewCell_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focusable");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_cell_get_focusable: property 'focusable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "focusable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_set_focusable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewCell *obj = (GtkColumnViewCell *)GtkColumnViewCell_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focusable");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_cell_set_focusable: property 'focusable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "focusable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewCell *obj = (GtkColumnViewCell *)GtkColumnViewCell_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "position");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_cell_get_position: property 'position' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "position", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_cell_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewCell *obj = (GtkColumnViewCell *)GtkColumnViewCell_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_cell_get_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selected", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
