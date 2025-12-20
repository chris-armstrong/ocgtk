/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GesturePan */

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

/* Type-specific conversion macros for GtkGesturePan */
#ifndef Val_GtkGesturePan
#define GtkGesturePan_val(val) ((GtkGesturePan*)ext_of_val(val))
#define Val_GtkGesturePan(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGesturePan */


CAMLexport CAMLprim value ml_gtk_gesture_pan_new(value arg1)
{
CAMLparam1(arg1);
GtkGesturePan *obj = gtk_gesture_pan_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkGesturePan(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_pan_set_orientation(GtkGesturePan_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_get_orientation(value self)
{
CAMLparam1(self);

GtkOrientation result = gtk_gesture_pan_get_orientation(GtkGesturePan_val(self));
CAMLreturn(Val_GtkOrientation(result));
}
