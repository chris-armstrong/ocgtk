/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserButton */

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

/* Type-specific conversion macros for GtkAppChooserButton */
#ifndef Val_GtkAppChooserButton
#define GtkAppChooserButton_val(val) ((GtkAppChooserButton*)ext_of_val(val))
#define Val_GtkAppChooserButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAppChooserButton */


CAMLexport CAMLprim value ml_gtk_app_chooser_button_new(value arg1)
{
CAMLparam1(arg1);
GtkAppChooserButton *obj = gtk_app_chooser_button_new(String_val(arg1));
CAMLreturn(Val_GtkAppChooserButton(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_set_active_custom_item(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_app_chooser_button_set_active_custom_item(GtkAppChooserButton_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_append_separator(value self)
{
CAMLparam1(self);

gtk_app_chooser_button_append_separator(GtkAppChooserButton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_get_heading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "heading");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_get_heading: property 'heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "heading", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_set_heading(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "heading");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_set_heading: property 'heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "heading", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_get_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "modal", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_set_modal(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_set_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "modal", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_get_show_default_item(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-default-item");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_get_show_default_item: property 'show-default-item' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-default-item", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_set_show_default_item(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-default-item");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_set_show_default_item: property 'show-default-item' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-default-item", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_get_show_dialog_item(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-dialog-item");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_get_show_dialog_item: property 'show-dialog-item' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-dialog-item", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_button_set_show_dialog_item(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserButton *obj = (GtkAppChooserButton *)GtkAppChooserButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-dialog-item");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_button_set_show_dialog_item: property 'show-dialog-item' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-dialog-item", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
