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
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkFrame */
#ifndef Val_GtkFrame
#define GtkFrame_val(val) ((GtkFrame*)ext_of_val(val))
#define Val_GtkFrame(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFrame */


CAMLexport CAMLprim value ml_gtk_frame_new(value arg1)
{
CAMLparam1(arg1);
GtkFrame *obj = gtk_frame_new(String_option_val(arg1));
CAMLreturn(Val_GtkFrame(obj));
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_widget(GtkFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label_align(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_label_align(GtkFrame_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_frame_set_child(GtkFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_label_widget(GtkFrame_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label_align(value self)
{
CAMLparam1(self);

float result = gtk_frame_get_label_align(GtkFrame_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_frame_get_child(GtkFrame_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_frame_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFrame *obj = (GtkFrame *)GtkFrame_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_frame_get_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_frame_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFrame *obj = (GtkFrame *)GtkFrame_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_frame_set_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
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
