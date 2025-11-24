/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CenterLayout */

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


CAMLexport CAMLprim value ml_gtk_center_layout_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_center_layout_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_start_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_start_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_orientation(GtkWidget_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_end_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_end_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_center_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_baseline_position(GtkWidget_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_start_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_start_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_orientation(value self)
{
CAMLparam1(self);


    GtkOrientation result = gtk_center_layout_get_orientation(GtkWidget_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_end_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_end_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_center_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_center_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_baseline_position(value self)
{
CAMLparam1(self);


    GtkBaselinePosition result = gtk_center_layout_get_baseline_position(GtkWidget_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_shrink_center_last(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "shrink-center-last", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_shrink_center_last(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "shrink-center-last", c_value, NULL);
CAMLreturn(Val_unit);
}
