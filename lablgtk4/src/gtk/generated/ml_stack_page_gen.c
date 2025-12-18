/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StackPage */

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

/* Type-specific conversion macros for GtkStackPage */
#ifndef Val_GtkStackPage
#define GtkStackPage_val(val) ((GtkStackPage*)ext_of_val(val))
#define Val_GtkStackPage(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStackPage */


CAMLexport CAMLprim value ml_gtk_stack_page_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_stack_page_get_child(GtkStackPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_needs_attention(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "needs-attention");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_needs_attention: property 'needs-attention' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "needs-attention", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_needs_attention(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "needs-attention");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_needs_attention: property 'needs-attention' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "needs-attention", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "title", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_title(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "title", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_get_visible: property 'visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "visible", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_visible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible");
if (pspec == NULL) caml_failwith("ml_gtk_stack_page_set_visible: property 'visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "visible", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
