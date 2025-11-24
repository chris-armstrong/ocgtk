/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Scrollbar */

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


CAMLexport CAMLprim value ml_gtk_scrollbar_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_scrollbar_new(GtkOrientation_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_scrollbar_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollbar_set_adjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollbar_get_adjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scrollbar_get_adjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
