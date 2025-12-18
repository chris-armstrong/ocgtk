/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CenterBox */

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

/* Type-specific conversion macros for GtkCenterBox */
#ifndef Val_GtkCenterBox
#define GtkCenterBox_val(val) ((GtkCenterBox*)ext_of_val(val))
#define Val_GtkCenterBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCenterBox */


CAMLexport CAMLprim value ml_gtk_center_box_new(value unit)
{
CAMLparam1(unit);
GtkCenterBox *obj = gtk_center_box_new();
CAMLreturn(Val_GtkCenterBox(obj));
}

CAMLexport CAMLprim value ml_gtk_center_box_set_start_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_start_widget(GtkCenterBox_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_end_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_end_widget(GtkCenterBox_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_center_widget(GtkCenterBox_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_baseline_position(GtkCenterBox_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_get_start_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_start_widget(GtkCenterBox_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_end_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_end_widget(GtkCenterBox_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_center_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_center_widget(GtkCenterBox_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_center_box_get_baseline_position(GtkCenterBox_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_shrink_center_last(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCenterBox *obj = (GtkCenterBox *)GtkCenterBox_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shrink-center-last");
if (pspec == NULL) caml_failwith("ml_gtk_center_box_get_shrink_center_last: property 'shrink-center-last' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "shrink-center-last", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_shrink_center_last(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCenterBox *obj = (GtkCenterBox *)GtkCenterBox_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shrink-center-last");
if (pspec == NULL) caml_failwith("ml_gtk_center_box_set_shrink_center_last: property 'shrink-center-last' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "shrink-center-last", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
