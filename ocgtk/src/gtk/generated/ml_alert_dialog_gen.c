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
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_alert_dialog_show(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_show(GtkAlertDialog_val(self), Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_set_modal(GtkAlertDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_message(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_set_message(GtkAlertDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_detail(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_set_detail(GtkAlertDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_default_button(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_set_default_button(GtkAlertDialog_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_cancel_button(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_alert_dialog_set_cancel_button(GtkAlertDialog_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_set_buttons(value self, value arg1)
{
CAMLparam2(self, arg1);
    int arg1_length = Wosize_val(arg1);
    char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = String_val(Field(arg1, i));
    }
    c_arg1[arg1_length] = NULL;

gtk_alert_dialog_set_buttons(GtkAlertDialog_val(self), c_arg1);
    g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_alert_dialog_get_modal(GtkAlertDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_message(value self)
{
CAMLparam1(self);

const char* result = gtk_alert_dialog_get_message(GtkAlertDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_detail(value self)
{
CAMLparam1(self);

const char* result = gtk_alert_dialog_get_detail(GtkAlertDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_default_button(value self)
{
CAMLparam1(self);

int result = gtk_alert_dialog_get_default_button(GtkAlertDialog_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_cancel_button(value self)
{
CAMLparam1(self);

int result = gtk_alert_dialog_get_cancel_button(GtkAlertDialog_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_alert_dialog_get_buttons(value self)
{
CAMLparam1(self);

const char* const* result = gtk_alert_dialog_get_buttons(GtkAlertDialog_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
CAMLreturn(ml_result);
}
