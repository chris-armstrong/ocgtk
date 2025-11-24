/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SizeGroup */

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


CAMLexport CAMLprim value ml_gtk_size_group_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_size_group_new(GtkSizeGroupMode_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_size_group_set_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_size_group_set_mode(GtkWidget_val(self), GtkSizeGroupMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_size_group_remove_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_size_group_remove_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_size_group_get_mode(value self)
{
CAMLparam1(self);


    GtkSizeGroupMode result = gtk_size_group_get_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSizeGroupMode(result));
}

CAMLexport CAMLprim value ml_gtk_size_group_add_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_size_group_add_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
