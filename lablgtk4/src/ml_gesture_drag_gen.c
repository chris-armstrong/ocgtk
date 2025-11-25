/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureDrag */

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

/* Type-specific conversion macros for GtkGestureDrag */
#ifndef Val_GtkGestureDrag
#define GtkGestureDrag_val(val) ((GtkGestureDrag*)ext_of_val(val))
#define Val_GtkGestureDrag(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureDrag */


CAMLexport CAMLprim value ml_gtk_gesture_drag_new(value unit)
{
CAMLparam1(unit);
GtkGestureDrag *obj = gtk_gesture_drag_new();
CAMLreturn(Val_GtkGestureDrag(obj));
}
