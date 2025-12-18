/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureSingle */

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

/* Type-specific conversion macros for GtkGestureSingle */
#ifndef Val_GtkGestureSingle
#define GtkGestureSingle_val(val) ((GtkGestureSingle*)ext_of_val(val))
#define Val_GtkGestureSingle(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureSingle */


CAMLexport CAMLprim value ml_gtk_gesture_single_get_current_button(value self)
{
CAMLparam1(self);

guint result = gtk_gesture_single_get_current_button(GtkGestureSingle_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "button");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_get_button: property 'button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "button", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_button(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "button");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_set_button: property 'button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "button", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_exclusive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "exclusive");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_get_exclusive: property 'exclusive' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "exclusive", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_exclusive(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "exclusive");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_set_exclusive: property 'exclusive' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "exclusive", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_touch_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "touch-only");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_get_touch_only: property 'touch-only' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "touch-only", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_touch_only(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "touch-only");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_single_set_touch_only: property 'touch-only' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "touch-only", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
