/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerMotion */

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

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_contains_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerMotion *obj = (GtkEventControllerMotion *)GtkEventControllerMotion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "contains-pointer");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_motion_get_contains_pointer: property 'contains-pointer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "contains-pointer", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_is_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerMotion *obj = (GtkEventControllerMotion *)GtkEventControllerMotion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "is-pointer");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_motion_get_is_pointer: property 'is-pointer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "is-pointer", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
