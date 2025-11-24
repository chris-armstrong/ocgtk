/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropTargetAsync */

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


CAMLexport CAMLprim value ml_gtk_drop_target_async_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_drop_target_async_new(arg1, GdkDragAction_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_set_formats(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_target_async_set_formats(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_target_async_set_actions(GtkWidget_val(self), GdkDragAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_reject_drop(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_target_async_reject_drop(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_async_get_actions(value self)
{
CAMLparam1(self);


    GdkDragAction result = gtk_drop_target_async_get_actions(GtkWidget_val(self));
CAMLreturn(Val_GdkDragAction(result));
}
