/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureStylus */

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

/* Type-specific conversion macros for GtkGestureStylus */
#ifndef Val_GtkGestureStylus
#define GtkGestureStylus_val(val) ((GtkGestureStylus*)ext_of_val(val))
#define Val_GtkGestureStylus(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureStylus */


CAMLexport CAMLprim value ml_gtk_gesture_stylus_new(value unit)
{
CAMLparam1(unit);
GtkGestureStylus *obj = gtk_gesture_stylus_new();
CAMLreturn(Val_GtkGestureStylus(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_set_stylus_only(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_stylus_set_stylus_only(GtkGestureStylus_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_stylus_only(value self)
{
CAMLparam1(self);

gboolean result = gtk_gesture_stylus_get_stylus_only(GtkGestureStylus_val(self));
CAMLreturn(Val_bool(result));
}
