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
#include "ml_gobject.h"

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
