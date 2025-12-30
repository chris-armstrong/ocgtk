/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Frame */

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


CAMLexport CAMLprim value ml_gtk_frame_new(value arg1)
{
CAMLparam1(arg1);
GtkFrame *obj = gtk_frame_new(String_option_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkFrame(obj));
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_widget(GtkFrame_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_align(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_align(GtkFrame_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label(GtkFrame_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_child(GtkFrame_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_label_widget(GtkFrame_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_align(value self)
{
CAMLparam1(self);

float result = gtk_frame_get_label_align(GtkFrame_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label(value self)
{
CAMLparam1(self);

const char* result = gtk_frame_get_label(GtkFrame_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_child(GtkFrame_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFrame *obj = (GtkFrame *)GtkFrame_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label-xalign");
if (pspec == NULL) caml_failwith("ml_gtk_frame_get_label_xalign: property 'label-xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label-xalign", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_xalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFrame *obj = (GtkFrame *)GtkFrame_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label-xalign");
if (pspec == NULL) caml_failwith("ml_gtk_frame_set_label_xalign: property 'label-xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label-xalign", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
