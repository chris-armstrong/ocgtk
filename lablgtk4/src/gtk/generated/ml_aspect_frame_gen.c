/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AspectFrame */

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

/* Type-specific conversion macros for GtkAspectFrame */
#ifndef Val_GtkAspectFrame
#define GtkAspectFrame_val(val) ((GtkAspectFrame*)ext_of_val(val))
#define Val_GtkAspectFrame(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAspectFrame */


CAMLexport CAMLprim value ml_gtk_aspect_frame_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkAspectFrame *obj = gtk_aspect_frame_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), Bool_val(arg4));
CAMLreturn(Val_GtkAspectFrame(obj));
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_aspect_frame_set_child(GtkAspectFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_aspect_frame_get_child(GtkAspectFrame_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_obey_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "obey-child");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_get_obey_child: property 'obey-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "obey-child", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_obey_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "obey-child");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_set_obey_child: property 'obey-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "obey-child", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_ratio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ratio");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_get_ratio: property 'ratio' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "ratio", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_ratio(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ratio");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_set_ratio: property 'ratio' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "ratio", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "xalign");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_get_xalign: property 'xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "xalign", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_xalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "xalign");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_set_xalign: property 'xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "xalign", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "yalign");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_get_yalign: property 'yalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "yalign", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_yalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "yalign");
if (pspec == NULL) caml_failwith("ml_gtk_aspect_frame_set_yalign: property 'yalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "yalign", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
