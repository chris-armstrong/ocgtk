/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ProgressBar */

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

/* Type-specific conversion macros for GtkProgressBar */
#ifndef Val_GtkProgressBar
#define GtkProgressBar_val(val) ((GtkProgressBar*)ext_of_val(val))
#define Val_GtkProgressBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkProgressBar */


CAMLexport CAMLprim value ml_gtk_progress_bar_new(value unit)
{
CAMLparam1(unit);
GtkProgressBar *obj = gtk_progress_bar_new();
CAMLreturn(Val_GtkProgressBar(obj));
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_ellipsize(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_progress_bar_set_ellipsize(GtkProgressBar_val(self), PangoEllipsizeMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_pulse(value self)
{
CAMLparam1(self);

gtk_progress_bar_pulse(GtkProgressBar_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_ellipsize(value self)
{
CAMLparam1(self);

PangoEllipsizeMode result = gtk_progress_bar_get_ellipsize(GtkProgressBar_val(self));
CAMLreturn(Val_PangoEllipsizeMode(result));
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fraction");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_get_fraction: property 'fraction' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "fraction", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_fraction(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fraction");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_set_fraction: property 'fraction' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "fraction", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inverted");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_get_inverted: property 'inverted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "inverted", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_inverted(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inverted");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_set_inverted: property 'inverted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "inverted", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pulse-step");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_get_pulse_step: property 'pulse-step' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "pulse-step", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_pulse_step(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pulse-step");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_set_pulse_step: property 'pulse-step' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "pulse-step", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_show_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-text");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_get_show_text: property 'show-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-text", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_show_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-text");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_set_show_text: property 'show-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_get_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_progress_bar_set_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
