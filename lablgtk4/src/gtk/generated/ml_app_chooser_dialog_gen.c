/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserDialog */

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


CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkAppChooserDialog *obj = gtk_app_chooser_dialog_new(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), arg3);
CAMLreturn(Val_GtkAppChooserDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new_for_content_type(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkAppChooserDialog *obj = gtk_app_chooser_dialog_new_for_content_type(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), String_val(arg3));
CAMLreturn(Val_GtkAppChooserDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_set_heading(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_app_chooser_dialog_set_heading(GtkAppChooserDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_app_chooser_dialog_get_widget(GtkAppChooserDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_heading(value self)
{
CAMLparam1(self);

const char* result = gtk_app_chooser_dialog_get_heading(GtkAppChooserDialog_val(self));
CAMLreturn(Val_option_string(result));
}
