/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerMotion */

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


CAMLexport CAMLprim value ml_gtk_event_controller_motion_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_motion_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_is_pointer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_motion_is_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_contains_pointer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_motion_contains_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_contains_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_is_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
