/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeExpander */

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

/* Type-specific conversion macros for GtkTreeExpander */
#ifndef Val_GtkTreeExpander
#define GtkTreeExpander_val(val) ((GtkTreeExpander*)ext_of_val(val))
#define Val_GtkTreeExpander(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeExpander */


CAMLexport CAMLprim value ml_gtk_tree_expander_new(value unit)
{
CAMLparam1(unit);
GtkTreeExpander *obj = gtk_tree_expander_new();
CAMLreturn(Val_GtkTreeExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_list_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_list_row(GtkTreeExpander_val(self), Option_val(arg1, GtkTreeListRow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_child(GtkTreeExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_list_row(value self)
{
CAMLparam1(self);

GtkTreeListRow* result = gtk_tree_expander_get_list_row(GtkTreeExpander_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_tree_expander_get_child(GtkTreeExpander_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_hide_expander(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hide-expander");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_get_hide_expander: property 'hide-expander' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "hide-expander", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_hide_expander(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hide-expander");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_set_hide_expander: property 'hide-expander' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "hide-expander", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_depth(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "indent-for-depth");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_get_indent_for_depth: property 'indent-for-depth' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "indent-for-depth", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_depth(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "indent-for-depth");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_set_indent_for_depth: property 'indent-for-depth' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "indent-for-depth", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "indent-for-icon");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_get_indent_for_icon: property 'indent-for-icon' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "indent-for-icon", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_icon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "indent-for-icon");
if (pspec == NULL) caml_failwith("ml_gtk_tree_expander_set_indent_for_icon: property 'indent-for-icon' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "indent-for-icon", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
