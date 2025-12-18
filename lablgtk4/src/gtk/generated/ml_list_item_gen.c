/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListItem */

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

/* Type-specific conversion macros for GtkListItem */
#ifndef Val_GtkListItem
#define GtkListItem_val(val) ((GtkListItem*)ext_of_val(val))
#define Val_GtkListItem(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListItem */


CAMLexport CAMLprim value ml_gtk_list_item_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_item_set_child(GtkListItem_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_item_get_child(GtkListItem_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_list_item_get_accessible_description(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accessible-description");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_accessible_description: property 'accessible-description' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "accessible-description", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_set_accessible_description(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accessible-description");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_set_accessible_description: property 'accessible-description' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "accessible-description", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_accessible_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accessible-label");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_accessible_label: property 'accessible-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "accessible-label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_set_accessible_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accessible-label");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_set_accessible_label: property 'accessible-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "accessible-label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activatable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_activatable: property 'activatable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "activatable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_set_activatable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "activatable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_set_activatable: property 'activatable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "activatable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_focusable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focusable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_focusable: property 'focusable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "focusable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_set_focusable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focusable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_set_focusable: property 'focusable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "focusable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "position");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_position: property 'position' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "position", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selectable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_selectable: property 'selectable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selectable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_item_set_selectable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selectable");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_set_selectable: property 'selectable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "selectable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_item_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListItem *obj = (GtkListItem *)GtkListItem_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_list_item_get_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selected", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
