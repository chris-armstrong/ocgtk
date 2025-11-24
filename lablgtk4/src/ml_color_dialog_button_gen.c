/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorDialogButton */

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


CAMLexport CAMLprim value ml_gtk_color_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_color_dialog_button_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_set_rgba(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_dialog_button_set_rgba(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_dialog_button_set_dialog(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_get_dialog(value self)
{
CAMLparam1(self);


    GtkColorDialog* result = gtk_color_dialog_button_get_dialog(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
