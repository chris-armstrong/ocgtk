/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Button */

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

/* Type-specific conversion macros for GtkButton */
#ifndef Val_GtkButton
#define GtkButton_val(val) ((GtkButton*)ext_of_val(val))
#define Val_GtkButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkButton */


CAMLexport CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkButton *obj = gtk_button_new();
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_from_icon_name(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_child(GtkButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_button_get_child(GtkButton_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_button_get_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_can_shrink(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_button_set_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_button_get_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_button_set_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_button_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_button_set_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_button_get_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_button_set_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_button_get_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkButton *obj = (GtkButton *)GtkButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_button_set_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
