/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureZoom */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkGestureZoom */
#ifndef Val_GtkGestureZoom
#define GtkGestureZoom_val(val) ((GtkGestureZoom*)ext_of_val(val))
#define Val_GtkGestureZoom(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureZoom */


CAMLexport CAMLprim value ml_gtk_gesture_zoom_new(value unit)
{
CAMLparam1(unit);
GtkGestureZoom *obj = gtk_gesture_zoom_new();
CAMLreturn(Val_GtkGestureZoom(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_zoom_get_scale_delta(value self)
{
CAMLparam1(self);

double result = gtk_gesture_zoom_get_scale_delta(GtkGestureZoom_val(self));
CAMLreturn(caml_copy_double(result));
}
