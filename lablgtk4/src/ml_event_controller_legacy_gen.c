/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerLegacy */

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

/* Type-specific conversion macros for GtkEventControllerLegacy */
#ifndef Val_GtkEventControllerLegacy
#define GtkEventControllerLegacy_val(val) ((GtkEventControllerLegacy*)ext_of_val(val))
#define Val_GtkEventControllerLegacy(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEventControllerLegacy */


CAMLexport CAMLprim value ml_gtk_event_controller_legacy_new(value unit)
{
CAMLparam1(unit);
GtkEventControllerLegacy *obj = gtk_event_controller_legacy_new();
CAMLreturn(Val_GtkEventControllerLegacy(obj));
}
