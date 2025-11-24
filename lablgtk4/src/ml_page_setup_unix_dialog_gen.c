/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PageSetupUnixDialog */

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


CAMLexport CAMLprim value ml_gtk_page_setup_unix_dialog_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_page_setup_unix_dialog_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_page_setup_unix_dialog_set_print_settings(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_page_setup_unix_dialog_set_print_settings(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_unix_dialog_set_page_setup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_page_setup_unix_dialog_set_page_setup(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_unix_dialog_get_print_settings(value self)
{
CAMLparam1(self);


    GtkPrintSettings* result = gtk_page_setup_unix_dialog_get_print_settings(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_unix_dialog_get_page_setup(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_page_setup_unix_dialog_get_page_setup(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
