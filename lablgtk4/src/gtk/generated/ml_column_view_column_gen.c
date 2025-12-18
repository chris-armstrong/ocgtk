/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewColumn */

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

/* Type-specific conversion macros for GtkColumnViewColumn */
#ifndef Val_GtkColumnViewColumn
#define GtkColumnViewColumn_val(val) ((GtkColumnViewColumn*)ext_of_val(val))
#define Val_GtkColumnViewColumn(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewColumn */


CAMLexport CAMLprim value ml_gtk_column_view_column_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkColumnViewColumn *obj = gtk_column_view_column_new(String_option_val(arg1), Option_val(arg2, GtkListItemFactory_val, NULL));
CAMLreturn(Val_GtkColumnViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_sorter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_sorter(GtkColumnViewColumn_val(self), Option_val(arg1, GtkSorter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_factory(GtkColumnViewColumn_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_sorter(value self)
{
CAMLparam1(self);

GtkSorter* result = gtk_column_view_column_get_sorter(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkSorter));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_column_view_column_get_factory(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_column_view(value self)
{
CAMLparam1(self);

GtkColumnView* result = gtk_column_view_column_get_column_view(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkColumnView));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "expand");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_expand: property 'expand' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "expand", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_expand(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "expand");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_expand: property 'expand' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "expand", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_fixed_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fixed-width");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_fixed_width: property 'fixed-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "fixed-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_fixed_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fixed-width");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_fixed_width: property 'fixed-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "fixed-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "id");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_id: property 'id' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "id", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_id(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "id");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_id: property 'id' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "id", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_resizable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resizable");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_resizable: property 'resizable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "resizable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_resizable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resizable");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_resizable: property 'resizable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "resizable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "title", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_title(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "title", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_get_visible: property 'visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "visible", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_visible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible");
if (pspec == NULL) caml_failwith("ml_gtk_column_view_column_set_visible: property 'visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "visible", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
