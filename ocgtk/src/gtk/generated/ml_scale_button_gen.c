/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScaleButton */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_scale_button_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
    int arg4_length = Wosize_val(arg4);
    char** c_arg4 = (char**)g_malloc(sizeof(char*) * (arg4_length + 1));
    for (int i = 0; i < arg4_length; i++) {
      c_arg4[i] = String_val(Field(arg4, i));
    }
    c_arg4[arg4_length] = NULL;

GtkScaleButton *obj = gtk_scale_button_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), c_arg4);
if (obj) g_object_ref_sink(obj);

    g_free(c_arg4);
CAMLreturn(Val_GtkScaleButton(obj));
}
CAMLexport CAMLprim value ml_gtk_scale_button_set_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_button_set_value(GtkScaleButton_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_icons(value self, value arg1)
{
CAMLparam2(self, arg1);
    int arg1_length = Wosize_val(arg1);
    char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = String_val(Field(arg1, i));
    }
    c_arg1[arg1_length] = NULL;

gtk_scale_button_set_icons(GtkScaleButton_val(self), c_arg1);
    g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_has_frame(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_button_set_has_frame(GtkScaleButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_button_set_adjustment(GtkScaleButton_val(self), GtkAdjustment_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_value(value self)
{
CAMLparam1(self);

double result = gtk_scale_button_get_value(GtkScaleButton_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_popup(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scale_button_get_popup(GtkScaleButton_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_plus_button(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scale_button_get_plus_button(GtkScaleButton_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_minus_button(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scale_button_get_minus_button(GtkScaleButton_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_has_frame(value self)
{
CAMLparam1(self);

gboolean result = gtk_scale_button_get_has_frame(GtkScaleButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_adjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_scale_button_get_adjustment(GtkScaleButton_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_active(value self)
{
CAMLparam1(self);

gboolean result = gtk_scale_button_get_active(GtkScaleButton_val(self));
CAMLreturn(Val_bool(result));
}
