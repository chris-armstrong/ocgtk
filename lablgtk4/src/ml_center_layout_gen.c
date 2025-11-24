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

/* Type-specific conversion macros for GtkCenterLayout */
#define GtkCenterLayout_val(val) ((GtkCenterLayout*)ext_of_val(val))
#define Val_GtkCenterLayout(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_center_layout_new(value unit)
{
CAMLparam1(unit);
GtkCenterLayout *obj = gtk_center_layout_new();
CAMLreturn(Val_GtkCenterLayout(obj));
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_start_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_start_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_orientation(GtkCenterLayout_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_end_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_end_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_center_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_center_layout_set_baseline_position(GtkCenterLayout_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_start_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_start_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_orientation(value self)
{
CAMLparam1(self);


    GtkOrientation result = gtk_center_layout_get_orientation(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_end_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_end_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_center_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_center_layout_get_center_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_baseline_position(value self)
{
CAMLparam1(self);


    GtkBaselinePosition result = gtk_center_layout_get_baseline_position(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_shrink_center_last(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCenterLayout *obj = (GtkCenterLayout *)GtkCenterLayout_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "shrink-center-last", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_shrink_center_last(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCenterLayout *obj = (GtkCenterLayout *)GtkCenterLayout_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "shrink-center-last", c_value, NULL);
CAMLreturn(Val_unit);
}
