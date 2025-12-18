/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureStylus */

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

/* Type-specific conversion macros for GtkGestureStylus */
#ifndef Val_GtkGestureStylus
#define GtkGestureStylus_val(val) ((GtkGestureStylus*)ext_of_val(val))
#define Val_GtkGestureStylus(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureStylus */


CAMLexport CAMLprim value ml_gtk_gesture_stylus_new(value unit)
{
CAMLparam1(unit);
GtkGestureStylus *obj = gtk_gesture_stylus_new();
CAMLreturn(Val_GtkGestureStylus(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_stylus_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureStylus *obj = (GtkGestureStylus *)GtkGestureStylus_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "stylus-only");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_stylus_get_stylus_only: property 'stylus-only' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "stylus-only", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_set_stylus_only(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGestureStylus *obj = (GtkGestureStylus *)GtkGestureStylus_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "stylus-only");
if (pspec == NULL) caml_failwith("ml_gtk_gesture_stylus_set_stylus_only: property 'stylus-only' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "stylus-only", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
