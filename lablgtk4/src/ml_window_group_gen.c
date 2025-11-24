/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WindowGroup */

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


CAMLexport CAMLprim value ml_gtk_window_group_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_window_group_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_window_group_remove_window(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_window_group_remove_window(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_group_add_window(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_window_group_add_window(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
