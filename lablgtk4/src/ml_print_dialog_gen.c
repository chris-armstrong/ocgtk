/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintDialog */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkPrintDialog */
#ifndef Val_GtkPrintDialog
#define GtkPrintDialog_val(val) ((GtkPrintDialog*)ext_of_val(val))
#define Val_GtkPrintDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPrintDialog */


CAMLexport CAMLprim value ml_gtk_print_dialog_new(value unit)
{
CAMLparam1(unit);
GtkPrintDialog *obj = gtk_print_dialog_new();
CAMLreturn(Val_GtkPrintDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_dialog_set_title(GtkPrintDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_dialog_set_modal(GtkPrintDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_accept_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_dialog_set_accept_label(GtkPrintDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_print_dialog_get_title(GtkPrintDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_print_dialog_get_modal(GtkPrintDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_accept_label(value self)
{
CAMLparam1(self);

const char* result = gtk_print_dialog_get_accept_label(GtkPrintDialog_val(self));
CAMLreturn(caml_copy_string(result));
}
