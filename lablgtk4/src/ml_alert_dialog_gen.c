/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AlertDialog */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkAlertDialog */
#define GtkAlertDialog_val(val) ((GtkAlertDialog*)ext_of_val(val))
#define Val_GtkAlertDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_alert_dialog_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkAlertDialog *obj = gtk_alert_dialog_new(String_val(arg1), arg2);
CAMLreturn(Val_GtkAlertDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_show(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_show(GtkAlertDialog_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
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
g_object_get(G_OBJECT(obj), "cancel-button", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_cancel_button(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "cancel-button", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_default_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "default-button", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_default_button(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "default-button", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_detail(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "detail", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_detail(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "detail", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_message(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "message", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_message(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "message", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAlertDialog *obj = (GtkAlertDialog *)GtkAlertDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}
