/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CenterLayout */

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

/* Type-specific conversion macros for GtkCenterLayout */
#ifndef Val_GtkCenterLayout
#define GtkCenterLayout_val(val) ((GtkCenterLayout*)ext_of_val(val))
#define Val_GtkCenterLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCenterLayout */


CAMLexport CAMLprim value ml_gtk_center_layout_new(value unit)
{
CAMLparam1(unit);
GtkCenterLayout *obj = gtk_center_layout_new();
CAMLreturn(Val_GtkCenterLayout(obj));
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_start_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_layout_set_start_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_layout_set_orientation(GtkCenterLayout_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_end_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_layout_set_end_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_layout_set_center_widget(GtkCenterLayout_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_layout_set_baseline_position(GtkCenterLayout_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_start_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_layout_get_start_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_orientation(value self)
{
CAMLparam1(self);

GtkOrientation result = gtk_center_layout_get_orientation(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_end_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_layout_get_end_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_center_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_layout_get_center_widget(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_center_layout_get_baseline_position(GtkCenterLayout_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_center_layout_get_shrink_center_last(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCenterLayout *obj = (GtkCenterLayout *)GtkCenterLayout_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shrink-center-last");
if (pspec == NULL) caml_failwith("ml_gtk_center_layout_get_shrink_center_last: property 'shrink-center-last' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "shrink-center-last", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_center_layout_set_shrink_center_last(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCenterLayout *obj = (GtkCenterLayout *)GtkCenterLayout_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shrink-center-last");
if (pspec == NULL) caml_failwith("ml_gtk_center_layout_set_shrink_center_last: property 'shrink-center-last' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "shrink-center-last", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
