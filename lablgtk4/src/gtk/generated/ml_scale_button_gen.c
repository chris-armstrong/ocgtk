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
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkScaleButton */
#ifndef Val_GtkScaleButton
#define GtkScaleButton_val(val) ((GtkScaleButton*)ext_of_val(val))
#define Val_GtkScaleButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkScaleButton */


CAMLexport CAMLprim value ml_gtk_scale_button_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkScaleButton *obj = gtk_scale_button_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), arg4);
CAMLreturn(Val_GtkScaleButton(obj));
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_button_set_adjustment(GtkScaleButton_val(self), GtkAdjustment_val(arg1));
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
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_scale_button_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_scale_button_get_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_scale_button_set_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_button_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "value");
if (pspec == NULL) caml_failwith("ml_gtk_scale_button_get_value: property 'value' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "value", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_button_set_value(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScaleButton *obj = (GtkScaleButton *)GtkScaleButton_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "value");
if (pspec == NULL) caml_failwith("ml_gtk_scale_button_set_value: property 'value' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "value", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
