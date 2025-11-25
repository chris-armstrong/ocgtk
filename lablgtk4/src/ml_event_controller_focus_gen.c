/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerFocus */

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

/* Type-specific conversion macros for GtkEventControllerFocus */
#ifndef Val_GtkEventControllerFocus
#define GtkEventControllerFocus_val(val) ((GtkEventControllerFocus*)ext_of_val(val))
#define Val_GtkEventControllerFocus(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEventControllerFocus */


CAMLexport CAMLprim value ml_gtk_event_controller_focus_new(value unit)
{
CAMLparam1(unit);
GtkEventControllerFocus *obj = gtk_event_controller_focus_new();
CAMLreturn(Val_GtkEventControllerFocus(obj));
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_is_focus(value self)
{
CAMLparam1(self);

gboolean result = gtk_event_controller_focus_is_focus(GtkEventControllerFocus_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_contains_focus(value self)
{
CAMLparam1(self);

gboolean result = gtk_event_controller_focus_contains_focus(GtkEventControllerFocus_val(self));
CAMLreturn(Val_bool(result));
}
