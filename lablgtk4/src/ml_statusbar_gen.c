/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Statusbar */

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


CAMLexport CAMLprim value ml_gtk_statusbar_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_statusbar_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_statusbar_remove_all(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_statusbar_remove_all(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_statusbar_remove(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_statusbar_remove(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_statusbar_push(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    guint result = gtk_statusbar_push(GtkWidget_val(self), Int_val(arg1), String_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_statusbar_pop(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_statusbar_pop(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_statusbar_get_context_id(value self, value arg1)
{
CAMLparam2(self, arg1);


    guint result = gtk_statusbar_get_context_id(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}
