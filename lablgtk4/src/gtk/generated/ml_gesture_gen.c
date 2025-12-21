/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Gesture */

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

/* Type-specific conversion macros for GtkGesture */
#ifndef Val_GtkGesture
#define GtkGesture_val(val) ((GtkGesture*)ext_of_val(val))
#define Val_GtkGesture(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGesture */


CAMLexport CAMLprim value ml_gtk_gesture_ungroup(value self)
{
CAMLparam1(self);

gtk_gesture_ungroup(GtkGesture_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_set_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_gesture_set_state(GtkGesture_val(self), GtkEventSequenceState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_recognized(value self)
{
CAMLparam1(self);

gboolean result = gtk_gesture_is_recognized(GtkGesture_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_grouped_with(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_gesture_is_grouped_with(GtkGesture_val(self), GtkGesture_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_active(value self)
{
CAMLparam1(self);

gboolean result = gtk_gesture_is_active(GtkGesture_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_group(GtkGesture_val(self), GtkGesture_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_get_bounding_box_center(value self)
{
CAMLparam1(self);
double out1;
double out2;

gboolean result = gtk_gesture_get_bounding_box_center(GtkGesture_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_double(out1));
    Store_field(ret, 2, caml_copy_double(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_gesture_get_n_points(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGesture *obj = (GtkGesture *)GtkGesture_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-points");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_get_n_points: property 'n-points' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-points", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
