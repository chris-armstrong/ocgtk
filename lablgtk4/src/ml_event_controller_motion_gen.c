/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerMotion */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkEventControllerMotion */
#ifndef Val_GtkEventControllerMotion
#define GtkEventControllerMotion_val(val) ((GtkEventControllerMotion*)ext_of_val(val))
#define Val_GtkEventControllerMotion(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEventControllerMotion */


CAMLexport CAMLprim value ml_gtk_event_controller_motion_new(value unit)
{
CAMLparam1(unit);
GtkEventControllerMotion *obj = gtk_event_controller_motion_new();
CAMLreturn(Val_GtkEventControllerMotion(obj));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_is_pointer(value self)
{
CAMLparam1(self);

gboolean result = gtk_event_controller_motion_is_pointer(GtkEventControllerMotion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_contains_pointer(value self)
{
CAMLparam1(self);

gboolean result = gtk_event_controller_motion_contains_pointer(GtkEventControllerMotion_val(self));
CAMLreturn(Val_bool(result));
}
