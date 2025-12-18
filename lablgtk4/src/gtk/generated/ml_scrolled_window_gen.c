/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScrolledWindow */

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

/* Type-specific conversion macros for GtkScrolledWindow */
#ifndef Val_GtkScrolledWindow
#define GtkScrolledWindow_val(val) ((GtkScrolledWindow*)ext_of_val(val))
#define Val_GtkScrolledWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkScrolledWindow */


CAMLexport CAMLprim value ml_gtk_scrolled_window_new(value unit)
{
CAMLparam1(unit);
GtkScrolledWindow *obj = gtk_scrolled_window_new();
CAMLreturn(Val_GtkScrolledWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_unset_placement(value self)
{
CAMLparam1(self);

gtk_scrolled_window_unset_placement(GtkScrolledWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_vadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scrolled_window_set_vadjustment(GtkScrolledWindow_val(self), Option_val(arg1, GtkAdjustment_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_policy(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_scrolled_window_set_policy(GtkScrolledWindow_val(self), GtkPolicyType_val(arg1), GtkPolicyType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_placement(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scrolled_window_set_placement(GtkScrolledWindow_val(self), GtkCornerType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_hadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scrolled_window_set_hadjustment(GtkScrolledWindow_val(self), Option_val(arg1, GtkAdjustment_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scrolled_window_set_child(GtkScrolledWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_vscrollbar(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scrolled_window_get_vscrollbar(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_vadjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_scrolled_window_get_vadjustment(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_policy(value self)
{
CAMLparam1(self);
GtkPolicyType out1;
GtkPolicyType out2;

gtk_scrolled_window_get_policy(GtkScrolledWindow_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GtkPolicyType(out1));
    Store_field(ret, 1, Val_GtkPolicyType(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_placement(value self)
{
CAMLparam1(self);

GtkCornerType result = gtk_scrolled_window_get_placement(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkCornerType(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_hscrollbar(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scrolled_window_get_hscrollbar(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_hadjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_scrolled_window_get_hadjustment(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_scrolled_window_get_child(GtkScrolledWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_kinetic_scrolling(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "kinetic-scrolling");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_kinetic_scrolling: property 'kinetic-scrolling' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "kinetic-scrolling", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_kinetic_scrolling(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "kinetic-scrolling");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_kinetic_scrolling: property 'kinetic-scrolling' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "kinetic-scrolling", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_max_content_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-content-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_max_content_height: property 'max-content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-content-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_max_content_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-content-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_max_content_height: property 'max-content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-content-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_max_content_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-content-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_max_content_width: property 'max-content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-content-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_max_content_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-content-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_max_content_width: property 'max-content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-content-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_min_content_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-content-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_min_content_height: property 'min-content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-content-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_min_content_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-content-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_min_content_height: property 'min-content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-content-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_min_content_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-content-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_min_content_width: property 'min-content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-content-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_min_content_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-content-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_min_content_width: property 'min-content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-content-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_overlay_scrolling(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "overlay-scrolling");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_overlay_scrolling: property 'overlay-scrolling' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "overlay-scrolling", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_overlay_scrolling(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "overlay-scrolling");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_overlay_scrolling: property 'overlay-scrolling' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "overlay-scrolling", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_propagate_natural_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "propagate-natural-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_propagate_natural_height: property 'propagate-natural-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "propagate-natural-height", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_propagate_natural_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "propagate-natural-height");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_propagate_natural_height: property 'propagate-natural-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "propagate-natural-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_get_propagate_natural_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "propagate-natural-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_get_propagate_natural_width: property 'propagate-natural-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "propagate-natural-width", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scrolled_window_set_propagate_natural_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkScrolledWindow *obj = (GtkScrolledWindow *)GtkScrolledWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "propagate-natural-width");
if (pspec == NULL) caml_failwith("ml_gtk_scrolled_window_set_propagate_natural_width: property 'propagate-natural-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "propagate-natural-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
