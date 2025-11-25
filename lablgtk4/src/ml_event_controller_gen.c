/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventController */

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


CAMLexport CAMLprim value ml_gtk_event_controller_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_set_static_name(GtkEventController_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_propagation_phase(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_set_propagation_phase(GtkEventController_val(self), GtkPropagationPhase_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_propagation_limit(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_set_propagation_limit(GtkEventController_val(self), GtkPropagationLimit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_set_name(GtkEventController_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_reset(value self)
{
CAMLparam1(self);

gtk_event_controller_reset(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_event_controller_get_widget(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_propagation_phase(value self)
{
CAMLparam1(self);

GtkPropagationPhase result = gtk_event_controller_get_propagation_phase(GtkEventController_val(self));
CAMLreturn(Val_GtkPropagationPhase(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_propagation_limit(value self)
{
CAMLparam1(self);

GtkPropagationLimit result = gtk_event_controller_get_propagation_limit(GtkEventController_val(self));
CAMLreturn(Val_GtkPropagationLimit(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_name(value self)
{
CAMLparam1(self);

const char* result = gtk_event_controller_get_name(GtkEventController_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event_state(value self)
{
CAMLparam1(self);

GdkModifierType result = gtk_event_controller_get_current_event_state(GtkEventController_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event(value self)
{
CAMLparam1(self);

GdkEvent* result = gtk_event_controller_get_current_event(GtkEventController_val(self));
CAMLreturn(Val_GdkEvent(result));
}
