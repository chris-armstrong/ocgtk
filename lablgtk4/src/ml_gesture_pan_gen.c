/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GesturePan */

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


CAMLexport CAMLprim value ml_gtk_gesture_pan_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_gesture_pan_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gesture_pan_set_orientation(GtkEventController_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_get_orientation(value self)
{
CAMLparam1(self);


    GtkOrientation result = gtk_gesture_pan_get_orientation(GtkEventController_val(self));
CAMLreturn(Val_GtkOrientation(result));
}
