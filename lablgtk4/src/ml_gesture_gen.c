/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Gesture */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_gesture_ungroup(value self)
{
CAMLparam1(self);


    gtk_gesture_ungroup(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_set_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_gesture_set_state(GtkWidget_val(self), GtkEventSequenceState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_set_sequence_state(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_set_sequence_state(GtkWidget_val(self), arg1, GtkEventSequenceState_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_recognized(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gesture_is_recognized(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_grouped_with(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_gesture_is_grouped_with(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_is_active(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gesture_is_active(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_handles_sequence(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_gesture_handles_sequence(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_group(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gesture_group(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_get_sequence_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkEventSequenceState result = gtk_gesture_get_sequence_state(GtkWidget_val(self), arg1);
CAMLreturn(Val_GtkEventSequenceState(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_get_point(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_gesture_get_point(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_get_last_event(value self, value arg1)
{
CAMLparam2(self, arg1);


    GdkEvent* result = gtk_gesture_get_last_event(GtkWidget_val(self), arg1);
CAMLreturn(Val_GdkEvent(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_get_bounding_box_center(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_get_bounding_box_center(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_get_bounding_box(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_gesture_get_bounding_box(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_get_n_points(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-points", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
