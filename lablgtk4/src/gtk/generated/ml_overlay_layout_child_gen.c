/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OverlayLayoutChild */

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

/* Type-specific conversion macros for GtkOverlayLayoutChild */
#ifndef Val_GtkOverlayLayoutChild
#define GtkOverlayLayoutChild_val(val) ((GtkOverlayLayoutChild*)ext_of_val(val))
#define Val_GtkOverlayLayoutChild(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkOverlayLayoutChild */


CAMLexport CAMLprim value ml_gtk_overlay_layout_child_get_clip_overlay(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkOverlayLayoutChild *obj = (GtkOverlayLayoutChild *)GtkOverlayLayoutChild_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "clip-overlay");
if (pspec == NULL) caml_failwith("ml_gtk_overlay_layout_child_get_clip_overlay: property 'clip-overlay' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "clip-overlay", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_set_clip_overlay(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkOverlayLayoutChild *obj = (GtkOverlayLayoutChild *)GtkOverlayLayoutChild_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "clip-overlay");
if (pspec == NULL) caml_failwith("ml_gtk_overlay_layout_child_set_clip_overlay: property 'clip-overlay' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "clip-overlay", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_get_measure(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkOverlayLayoutChild *obj = (GtkOverlayLayoutChild *)GtkOverlayLayoutChild_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "measure");
if (pspec == NULL) caml_failwith("ml_gtk_overlay_layout_child_get_measure: property 'measure' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "measure", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_set_measure(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkOverlayLayoutChild *obj = (GtkOverlayLayoutChild *)GtkOverlayLayoutChild_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "measure");
if (pspec == NULL) caml_failwith("ml_gtk_overlay_layout_child_set_measure: property 'measure' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "measure", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
