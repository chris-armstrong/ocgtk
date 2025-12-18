/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AlertDialog */

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

/* Type-specific conversion macros for GtkAlertDialog */
#ifndef Val_GtkAlertDialog
#define GtkAlertDialog_val(val) ((GtkAlertDialog*)ext_of_val(val))
#define Val_GtkAlertDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAlertDialog */


CAMLexport CAMLprim value ml_gtk_alert_dialog_show(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_show(GtkAlertDialog_val(self), Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_buttons(value self)
{
CAMLparam1(self);

gtk_alert_dialog_get_buttons(GtkAlertDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_cancel_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cancel-button");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_get_cancel_button: property 'cancel-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "cancel-button", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_cancel_button(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cancel-button");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_set_cancel_button: property 'cancel-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "cancel-button", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_default_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-button");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_get_default_button: property 'default-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "default-button", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_default_button(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-button");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_set_default_button: property 'default-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "default-button", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_detail(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "detail");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_get_detail: property 'detail' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "detail", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_detail(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "detail");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_set_detail: property 'detail' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "detail", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_message(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "message");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_get_message: property 'message' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "message", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_message(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "message");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_set_message: property 'message' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "message", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_get_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "modal", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_modal(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_alert_dialog_set_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "modal", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
