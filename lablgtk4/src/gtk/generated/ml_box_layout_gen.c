/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BoxLayout */

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

/* Type-specific conversion macros for GtkBoxLayout */
#ifndef Val_GtkBoxLayout
#define GtkBoxLayout_val(val) ((GtkBoxLayout*)ext_of_val(val))
#define Val_GtkBoxLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBoxLayout */


CAMLexport CAMLprim value ml_gtk_box_layout_new(value arg1)
{
CAMLparam1(arg1);
GtkBoxLayout *obj = gtk_box_layout_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkBoxLayout(obj));
}

CAMLexport CAMLprim value ml_gtk_box_layout_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_layout_set_baseline_position(GtkBoxLayout_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_layout_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_box_layout_get_baseline_position(GtkBoxLayout_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_box_layout_get_baseline_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-child");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_get_baseline_child: property 'baseline-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "baseline-child", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_layout_set_baseline_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "baseline-child");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_set_baseline_child: property 'baseline-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "baseline-child", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_layout_get_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_get_homogeneous: property 'homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "homogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_layout_set_homogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "homogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_set_homogeneous: property 'homogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "homogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_layout_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_get_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_box_layout_set_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBoxLayout *obj = (GtkBoxLayout *)GtkBoxLayout_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_box_layout_set_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
