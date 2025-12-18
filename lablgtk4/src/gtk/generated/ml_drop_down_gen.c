/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropDown */

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

/* Type-specific conversion macros for GtkDropDown */
#ifndef Val_GtkDropDown
#define GtkDropDown_val(val) ((GtkDropDown*)ext_of_val(val))
#define Val_GtkDropDown(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDropDown */


CAMLexport CAMLprim value ml_gtk_drop_down_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDropDown *obj = gtk_drop_down_new(arg1, Option_val(arg2, GtkExpression_val, NULL));
CAMLreturn(Val_GtkDropDown(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_down_new_from_strings(value arg1)
{
CAMLparam1(arg1);
GtkDropDown *obj = gtk_drop_down_new_from_strings(arg1);
CAMLreturn(Val_GtkDropDown(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_search_match_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_down_set_search_match_mode(GtkDropDown_val(self), GtkStringFilterMatchMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_list_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_down_set_list_factory(GtkDropDown_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_header_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_down_set_header_factory(GtkDropDown_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_down_set_factory(GtkDropDown_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_down_set_expression(GtkDropDown_val(self), Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_search_match_mode(value self)
{
CAMLparam1(self);

GtkStringFilterMatchMode result = gtk_drop_down_get_search_match_mode(GtkDropDown_val(self));
CAMLreturn(Val_GtkStringFilterMatchMode(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_list_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_drop_down_get_list_factory(GtkDropDown_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_header_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_drop_down_get_header_factory(GtkDropDown_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_drop_down_get_factory(GtkDropDown_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_drop_down_get_expression(GtkDropDown_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_enable_search(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "enable-search");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_get_enable_search: property 'enable-search' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "enable-search", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_enable_search(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "enable-search");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_set_enable_search: property 'enable-search' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "enable-search", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_get_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selected", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_selected(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_set_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "selected", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_show_arrow(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-arrow");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_get_show_arrow: property 'show-arrow' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-arrow", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_show_arrow(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDropDown *obj = (GtkDropDown *)GtkDropDown_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-arrow");
if (pspec == NULL) caml_failwith("ml_gtk_drop_down_set_show_arrow: property 'show-arrow' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-arrow", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
