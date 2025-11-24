/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScaleButton */

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

/* Type-specific conversion macros for GtkScaleButton */
#define GtkScaleButton_val(val) ((GtkScaleButton*)ext_of_val(val))
#define Val_GtkScaleButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_scale_button_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkScaleButton *obj = gtk_scale_button_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), arg4);
CAMLreturn(Val_GtkScaleButton(obj));
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scale_button_set_adjustment(GtkScaleButton_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_popup(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_scale_button_get_popup(GtkScaleButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_plus_button(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_scale_button_get_plus_button(GtkScaleButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_minus_button(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_scale_button_get_minus_button(GtkScaleButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_adjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scale_button_get_adjustment(GtkScaleButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}
