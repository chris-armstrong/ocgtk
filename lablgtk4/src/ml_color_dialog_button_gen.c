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

/* Type-specific conversion macros for GtkColorDialogButton */
#define GtkColorDialogButton_val(val) ((GtkColorDialogButton*)ext_of_val(val))
#define Val_GtkColorDialogButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_color_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkColorDialogButton *obj = gtk_color_dialog_button_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkColorDialogButton(obj));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_dialog_button_set_dialog(GtkColorDialogButton_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_button_get_dialog(value self)
{
CAMLparam1(self);


    GtkColorDialog* result = gtk_color_dialog_button_get_dialog(GtkColorDialogButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}
