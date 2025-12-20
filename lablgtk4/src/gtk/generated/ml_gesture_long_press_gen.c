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
#include "converters.h"

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

CAMLexport CAMLprim value ml_gtk_gesture_long_press_set_delay_factor(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_long_press_set_delay_factor(GtkGestureLongPress_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_get_delay_factor(value self)
{
CAMLparam1(self);

double result = gtk_gesture_long_press_get_delay_factor(GtkGestureLongPress_val(self));
CAMLreturn(caml_copy_double(result));
}
