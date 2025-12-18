/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureLongPress */

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

/* Type-specific conversion macros for GtkGestureLongPress */
#ifndef Val_GtkGestureLongPress
#define GtkGestureLongPress_val(val) ((GtkGestureLongPress*)ext_of_val(val))
#define Val_GtkGestureLongPress(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureLongPress */


CAMLexport CAMLprim value ml_gtk_gesture_long_press_new(value unit)
{
CAMLparam1(unit);
GtkGestureLongPress *obj = gtk_gesture_long_press_new();
CAMLreturn(Val_GtkGestureLongPress(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_get_delay_factor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureLongPress *obj = (GtkGestureLongPress *)GtkGestureLongPress_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "delay-factor");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_long_press_get_delay_factor: property 'delay-factor' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "delay-factor", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_set_delay_factor(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGestureLongPress *obj = (GtkGestureLongPress *)GtkGestureLongPress_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "delay-factor");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_long_press_set_delay_factor: property 'delay-factor' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "delay-factor", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
