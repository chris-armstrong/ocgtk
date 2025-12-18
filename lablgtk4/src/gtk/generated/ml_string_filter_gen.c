/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringFilter */

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

/* Type-specific conversion macros for GtkStringFilter */
#ifndef Val_GtkStringFilter
#define GtkStringFilter_val(val) ((GtkStringFilter*)ext_of_val(val))
#define Val_GtkStringFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStringFilter */


CAMLexport CAMLprim value ml_gtk_string_filter_new(value arg1)
{
CAMLparam1(arg1);
GtkStringFilter *obj = gtk_string_filter_new(Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_GtkStringFilter(obj));
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_match_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_filter_set_match_mode(GtkStringFilter_val(self), GtkStringFilterMatchMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_filter_set_expression(GtkStringFilter_val(self), Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_match_mode(value self)
{
CAMLparam1(self);

GtkStringFilterMatchMode result = gtk_string_filter_get_match_mode(GtkStringFilter_val(self));
CAMLreturn(Val_GtkStringFilterMatchMode(result));
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_string_filter_get_expression(GtkStringFilter_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_ignore_case(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStringFilter *obj = (GtkStringFilter *)GtkStringFilter_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ignore-case");
if (pspec == NULL) caml_failwith("ml_gtk_string_filter_get_ignore_case: property 'ignore-case' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "ignore-case", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_ignore_case(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStringFilter *obj = (GtkStringFilter *)GtkStringFilter_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ignore-case");
if (pspec == NULL) caml_failwith("ml_gtk_string_filter_set_ignore_case: property 'ignore-case' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "ignore-case", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_search(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStringFilter *obj = (GtkStringFilter *)GtkStringFilter_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "search");
if (pspec == NULL) caml_failwith("ml_gtk_string_filter_get_search: property 'search' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "search", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_search(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStringFilter *obj = (GtkStringFilter *)GtkStringFilter_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "search");
if (pspec == NULL) caml_failwith("ml_gtk_string_filter_set_search: property 'search' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "search", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
