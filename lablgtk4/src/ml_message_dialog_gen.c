/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MessageDialog */

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

/* Type-specific conversion macros for GtkMessageDialog */
#ifndef Val_GtkMessageDialog
#define GtkMessageDialog_val(val) ((GtkMessageDialog*)ext_of_val(val))
#define Val_GtkMessageDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMessageDialog */


CAMLexport CAMLprim value ml_gtk_message_dialog_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GtkMessageDialog *obj = gtk_message_dialog_new(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), GtkMessageType_val(arg3), GtkButtonsType_val(arg4), String_option_val(arg5), arg6);
CAMLreturn(Val_GtkMessageDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_message_dialog_new_bytecode(value * argv, int argn)
{
return ml_gtk_message_dialog_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_message_dialog_new_with_markup_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GtkMessageDialog *obj = gtk_message_dialog_new_with_markup(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), GtkMessageType_val(arg3), GtkButtonsType_val(arg4), String_option_val(arg5), arg6);
CAMLreturn(Val_GtkMessageDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_message_dialog_new_with_markup_bytecode(value * argv, int argn)
{
return ml_gtk_message_dialog_new_with_markup_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_message_dialog_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_message_dialog_set_markup(GtkMessageDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_message_dialog_get_message_area(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_message_dialog_get_message_area(GtkMessageDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}
