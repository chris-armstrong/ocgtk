/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuilderCScope */

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


CAMLexport CAMLprim value ml_gtk_builder_cscope_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_builder_cscope_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_builder_cscope_add_callback_symbol(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_builder_cscope_add_callback_symbol(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}
