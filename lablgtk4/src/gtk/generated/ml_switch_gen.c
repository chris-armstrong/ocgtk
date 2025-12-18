/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Switch */

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

/* Type-specific conversion macros for GtkSwitch */
#ifndef Val_GtkSwitch
#define GtkSwitch_val(val) ((GtkSwitch*)ext_of_val(val))
#define Val_GtkSwitch(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSwitch */


CAMLexport CAMLprim value ml_gtk_switch_new(value unit)
{
CAMLparam1(unit);
GtkSwitch *obj = gtk_switch_new();
CAMLreturn(Val_GtkSwitch(obj));
}

CAMLexport CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSwitch *obj = (GtkSwitch *)GtkSwitch_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_switch_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_switch_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSwitch *obj = (GtkSwitch *)GtkSwitch_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_switch_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSwitch *obj = (GtkSwitch *)GtkSwitch_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "state");
if (pspec == NULL) caml_failwith("ml_gtk_switch_get_state: property 'state' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "state", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_switch_set_state(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSwitch *obj = (GtkSwitch *)GtkSwitch_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "state");
if (pspec == NULL) caml_failwith("ml_gtk_switch_set_state: property 'state' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "state", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
