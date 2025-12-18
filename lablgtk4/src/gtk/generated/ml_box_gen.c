/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Box */

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

/* Type-specific conversion macros for GtkBox */
#ifndef Val_GtkBox
#define GtkBox_val(val) ((GtkBox*)ext_of_val(val))
#define Val_GtkBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBox */


CAMLexport CAMLprim value ml_gtk_box_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBox *obj = gtk_box_new(GtkOrientation_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkBox(obj));
}

CAMLexport CAMLprim value ml_gtk_box_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_set_baseline_position(GtkBox_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_reorder_child_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_box_reorder_child_after(GtkBox_val(self), GtkWidget_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_remove(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_prepend(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_insert_child_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_box_insert_child_after(GtkBox_val(self), GtkWidget_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_box_get_baseline_position(GtkBox_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_box_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_append(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_get_baseline_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-child");
if (pspec == NULL) caml_failwith("ml_gtk_box_get_baseline_child: property 'baseline-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "baseline-child", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_set_baseline_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-child");
if (pspec == NULL) caml_failwith("ml_gtk_box_set_baseline_child: property 'baseline-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "baseline-child", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_get_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_box_get_homogeneous: property 'homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "homogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_set_homogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_box_set_homogeneous: property 'homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "homogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_box_get_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_set_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBox *obj = (GtkBox *)GtkBox_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_box_set_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
