/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMContextSimple */

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


CAMLexport CAMLprim value ml_gtk_im_context_simple_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_im_context_simple_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_im_context_simple_add_table(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_im_context_simple_add_table(GtkWidget_val(self), arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_simple_add_compose_file(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_im_context_simple_add_compose_file(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
