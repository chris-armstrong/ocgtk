/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DragSource */

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


CAMLexport CAMLprim value ml_gtk_drag_source_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_drag_source_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_drag_source_set_icon(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_drag_source_set_icon(GtkWidget_val(self), arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drag_source_set_content(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drag_source_set_content(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drag_source_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drag_source_set_actions(GtkWidget_val(self), GdkDragAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drag_source_get_actions(value self)
{
CAMLparam1(self);


    GdkDragAction result = gtk_drag_source_get_actions(GtkWidget_val(self));
CAMLreturn(Val_GdkDragAction(result));
}

CAMLexport CAMLprim value ml_gtk_drag_source_drag_cancel(value self)
{
CAMLparam1(self);


    gtk_drag_source_drag_cancel(GtkWidget_val(self));
CAMLreturn(Val_unit);
}
