/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureRotate */

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


CAMLexport CAMLprim value ml_gtk_gesture_rotate_new(value unit)
{
CAMLparam1(unit);
GtkGestureRotate *obj = gtk_gesture_rotate_new();
CAMLreturn(Val_GtkGestureRotate(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_rotate_get_angle_delta(value self)
{
CAMLparam1(self);

double result = gtk_gesture_rotate_get_angle_delta(GtkGestureRotate_val(self));
CAMLreturn(caml_copy_double(result));
}
