/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MessageDialog */

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

/* Type-specific conversion macros for GtkMessageDialog */
#ifndef Val_GtkMessageDialog
#define GtkMessageDialog_val(val) ((GtkMessageDialog*)ext_of_val(val))
#define Val_GtkMessageDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMessageDialog */


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
