/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Overlay */

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


CAMLexport CAMLprim value ml_gtk_overlay_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_overlay_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_overlay_set_measure_overlay(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_overlay_set_measure_overlay(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_set_clip_overlay(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_overlay_set_clip_overlay(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_overlay_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_remove_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_overlay_remove_overlay(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_get_measure_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_overlay_get_measure_overlay(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_overlay_get_clip_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_overlay_get_clip_overlay(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_overlay_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_overlay_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_overlay_add_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_overlay_add_overlay(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
