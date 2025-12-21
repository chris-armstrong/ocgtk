/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureClick */

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

/* Type-specific conversion macros for GtkGestureClick */
#ifndef Val_GtkGestureClick
#define GtkGestureClick_val(val) ((GtkGestureClick*)ext_of_val(val))
#define Val_GtkGestureClick(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureClick */


CAMLexport CAMLprim value ml_gtk_gesture_click_new(value unit)
{
CAMLparam1(unit);
GtkGestureClick *obj = gtk_gesture_click_new();
CAMLreturn(Val_GtkGestureClick(obj));
}
