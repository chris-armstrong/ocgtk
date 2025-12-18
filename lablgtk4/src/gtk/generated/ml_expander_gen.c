/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Expander */

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

/* Type-specific conversion macros for GtkExpander */
#ifndef Val_GtkExpander
#define GtkExpander_val(val) ((GtkExpander*)ext_of_val(val))
#define Val_GtkExpander(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkExpander */


CAMLexport CAMLprim value ml_gtk_expander_new(value arg1)
{
CAMLparam1(arg1);
GtkExpander *obj = gtk_expander_new(String_option_val(arg1));
CAMLreturn(Val_GtkExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_expander_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkExpander *obj = gtk_expander_new_with_mnemonic(String_option_val(arg1));
CAMLreturn(Val_GtkExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_expander_set_label_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_expander_set_label_widget(GtkExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_expander_set_child(GtkExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_label_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_expander_get_label_widget(GtkExpander_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_expander_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_expander_get_child(GtkExpander_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_expander_get_expanded(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "expanded");
if (pspec == NULL) caml_failwith("ml_gtk_expander_get_expanded: property 'expanded' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "expanded", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_expanded(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "expanded");
if (pspec == NULL) caml_failwith("ml_gtk_expander_set_expanded: property 'expanded' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "expanded", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_expander_get_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_expander_set_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_resize_toplevel(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resize-toplevel");
if (pspec == NULL) caml_failwith("ml_gtk_expander_get_resize_toplevel: property 'resize-toplevel' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "resize-toplevel", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_resize_toplevel(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resize-toplevel");
if (pspec == NULL) caml_failwith("ml_gtk_expander_set_resize_toplevel: property 'resize-toplevel' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "resize-toplevel", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-markup");
if (pspec == NULL) caml_failwith("ml_gtk_expander_get_use_markup: property 'use-markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-markup", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_use_markup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-markup");
if (pspec == NULL) caml_failwith("ml_gtk_expander_set_use_markup: property 'use-markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-markup", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_expander_get_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_expander_set_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
