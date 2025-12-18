/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerFocus */

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

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_contains_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerFocus *obj = (GtkEventControllerFocus *)GtkEventControllerFocus_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "contains-focus");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_focus_get_contains_focus: property 'contains-focus' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "contains-focus", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_is_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventControllerFocus *obj = (GtkEventControllerFocus *)GtkEventControllerFocus_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "is-focus");
if (pspec == NULL) caml_failwith("ml_gtk_event_controller_focus_get_is_focus: property 'is-focus' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "is-focus", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
