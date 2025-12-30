/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorDialogButton */

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


CAMLexport CAMLprim value ml_gtk_color_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkColorDialogButton *obj = gtk_color_dialog_button_new(Option_val(arg1, GtkColorDialog_val, NULL));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkColorDialogButton(obj));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_dialog_button_set_dialog(GtkColorDialogButton_val(self), GtkColorDialog_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_get_dialog(value self)
{
CAMLparam1(self);

GtkColorDialog* result = gtk_color_dialog_button_get_dialog(GtkColorDialogButton_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkColorDialog));
}
