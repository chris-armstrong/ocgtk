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
#define GtkEventControllerFocus_val(val) ((GtkEventControllerFocus*)ext_of_val(val))
#define Val_GtkEventControllerFocus(obj) ((value)(val_of_ext(obj)))


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

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_contains_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerFocus *obj = (GtkEventControllerFocus *)GtkEventControllerFocus_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_is_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerFocus *obj = (GtkEventControllerFocus *)GtkEventControllerFocus_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
