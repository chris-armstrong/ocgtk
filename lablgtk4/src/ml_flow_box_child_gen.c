/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FlowBoxChild */

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


CAMLexport CAMLprim value ml_gtk_flow_box_child_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_flow_box_child_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_flow_box_child_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_is_selected(value self)
{
CAMLparam1(self);


    gboolean result = gtk_flow_box_child_is_selected(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_get_index(value self)
{
CAMLparam1(self);


    int result = gtk_flow_box_child_get_index(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_flow_box_child_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_changed(value self)
{
CAMLparam1(self);


    gtk_flow_box_child_changed(GtkWidget_val(self));
CAMLreturn(Val_unit);
}
