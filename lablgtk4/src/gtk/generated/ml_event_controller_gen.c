/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventController */

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


CAMLexport CAMLprim value ml_gtk_event_controller_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_set_static_name(GtkEventController_val(self), String_option_val(arg1));
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
CAMLreturn(Val_option(result, Val_GdkEvent));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_get_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_set_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
