/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ProgressBar */

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

/* Type-specific conversion macros for GtkProgressBar */
#define GtkProgressBar_val(val) ((GtkProgressBar*)ext_of_val(val))
#define Val_GtkProgressBar(obj) ((value)(val_of_ext(obj)))


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
g_object_get(G_OBJECT(obj), "fraction", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_fraction(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "fraction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "pulse-step", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_pulse_step(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "pulse-step", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_show_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-text", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_show_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkProgressBar *obj = (GtkProgressBar *)GtkProgressBar_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}
