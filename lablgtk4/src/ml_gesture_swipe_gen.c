/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureSwipe */

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


CAMLexport CAMLprim value ml_gtk_gesture_swipe_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_swipe_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_swipe_get_velocity(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_swipe_get_velocity(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}
