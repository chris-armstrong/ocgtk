/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CheckButton */

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

/* Type-specific conversion macros for GtkCheckButton */
#ifndef Val_GtkCheckButton
#define GtkCheckButton_val(val) ((GtkCheckButton*)ext_of_val(val))
#define Val_GtkCheckButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCheckButton */


CAMLexport CAMLprim value ml_gtk_check_button_new(value unit)
{
CAMLparam1(unit);
GtkCheckButton *obj = gtk_check_button_new();
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkCheckButton *obj = gtk_check_button_new_with_label(String_option_val(arg1));
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkCheckButton *obj = gtk_check_button_new_with_mnemonic(String_option_val(arg1));
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_check_button_set_group(GtkCheckButton_val(self), Option_val(arg1, GtkCheckButton_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_check_button_set_child(GtkCheckButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_check_button_get_child(GtkCheckButton_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inconsistent");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_get_inconsistent: property 'inconsistent' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "inconsistent", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inconsistent");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_set_inconsistent: property 'inconsistent' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "inconsistent", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_get_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_set_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_get_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_check_button_set_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
