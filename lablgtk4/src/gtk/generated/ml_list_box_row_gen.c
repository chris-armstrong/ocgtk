/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListBoxRow */

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

/* Type-specific conversion macros for GtkListBoxRow */
#ifndef Val_GtkListBoxRow
#define GtkListBoxRow_val(val) ((GtkListBoxRow*)ext_of_val(val))
#define Val_GtkListBoxRow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListBoxRow */


CAMLexport CAMLprim value ml_gtk_list_box_row_new(value unit)
{
CAMLparam1(unit);
GtkListBoxRow *obj = gtk_list_box_row_new();
CAMLreturn(Val_GtkListBoxRow(obj));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_header(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_row_set_header(GtkListBoxRow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_row_set_child(GtkListBoxRow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_is_selected(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_box_row_is_selected(GtkListBoxRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_index(value self)
{
CAMLparam1(self);

int result = gtk_list_box_row_get_index(GtkListBoxRow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_header(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_box_row_get_header(GtkListBoxRow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_box_row_get_child(GtkListBoxRow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_changed(value self)
{
CAMLparam1(self);

gtk_list_box_row_changed(GtkListBoxRow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activatable");
if (pspec == NULL) caml_failwith("ml_gtk_list_box_row_get_activatable: property 'activatable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "activatable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_activatable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activatable");
if (pspec == NULL) caml_failwith("ml_gtk_list_box_row_set_activatable: property 'activatable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "activatable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selectable");
if (pspec == NULL) caml_failwith("ml_gtk_list_box_row_get_selectable: property 'selectable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selectable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_selectable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selectable");
if (pspec == NULL) caml_failwith("ml_gtk_list_box_row_set_selectable: property 'selectable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "selectable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
