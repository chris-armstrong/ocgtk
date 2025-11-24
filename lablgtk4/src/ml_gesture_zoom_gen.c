/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureZoom */

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


CAMLexport CAMLprim value ml_gtk_gesture_zoom_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_zoom_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_zoom_get_scale_delta(value self)
{
CAMLparam1(self);


    double result = gtk_gesture_zoom_get_scale_delta(GtkEventController_val(self));
CAMLreturn(caml_copy_double(result));
}
