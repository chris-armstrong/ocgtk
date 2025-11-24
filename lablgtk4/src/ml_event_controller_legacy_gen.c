/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerLegacy */

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


CAMLexport CAMLprim value ml_gtk_event_controller_legacy_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_legacy_new();
CAMLreturn(Val_GtkEventController(controller));
}
