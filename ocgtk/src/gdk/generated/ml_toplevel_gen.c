/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Toplevel */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_toplevel_titlebar_gesture(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_toplevel_titlebar_gesture(GdkToplevel_val(self), GdkTitlebarGesture_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_toplevel_supports_edge_constraints(value self)
{
CAMLparam1(self);

gboolean result = gdk_toplevel_supports_edge_constraints(GdkToplevel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_toplevel_show_window_menu(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_toplevel_show_window_menu(GdkToplevel_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_transient_for(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_transient_for(GdkToplevel_val(self), GdkSurface_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_title(GdkToplevel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_startup_id(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_startup_id(GdkToplevel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_modal(GdkToplevel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_deletable(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_deletable(GdkToplevel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_set_decorated(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_set_decorated(GdkToplevel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_restore_system_shortcuts(value self)
{
CAMLparam1(self);

gdk_toplevel_restore_system_shortcuts(GdkToplevel_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_present(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_present(GdkToplevel_val(self), GdkToplevelLayout_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_minimize(value self)
{
CAMLparam1(self);

gboolean result = gdk_toplevel_minimize(GdkToplevel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_toplevel_lower(value self)
{
CAMLparam1(self);

gboolean result = gdk_toplevel_lower(GdkToplevel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_toplevel_inhibit_system_shortcuts(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_toplevel_inhibit_system_shortcuts(GdkToplevel_val(self), Option_val(arg1, GdkEvent_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_toplevel_get_state(value self)
{
CAMLparam1(self);

GdkToplevelState result = gdk_toplevel_get_state(GdkToplevel_val(self));
CAMLreturn(Val_GdkToplevelState(result));
}

CAMLexport CAMLprim value ml_gtk_toplevel_get_fullscreen_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkToplevel *obj = (GdkToplevel *)GdkToplevel_val(self);
    GdkFullscreenMode prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fullscreen-mode");
if (pspec == NULL) caml_failwith("ml_gtk_toplevel_get_fullscreen_mode: property 'fullscreen-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "fullscreen-mode", &prop_gvalue);
    prop_value = (GdkFullscreenMode)g_value_get_enum(&prop_gvalue);

result = Val_GdkFullscreenMode(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_toplevel_set_fullscreen_mode(value self, value new_value)
{
CAMLparam2(self, new_value);
GdkToplevel *obj = (GdkToplevel *)GdkToplevel_val(self);
    GdkFullscreenMode c_value = GdkFullscreenMode_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fullscreen-mode");
if (pspec == NULL) caml_failwith("ml_gtk_toplevel_set_fullscreen_mode: property 'fullscreen-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_enum(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "fullscreen-mode", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toplevel_get_shortcuts_inhibited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkToplevel *obj = (GdkToplevel *)GdkToplevel_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shortcuts-inhibited");
if (pspec == NULL) caml_failwith("ml_gtk_toplevel_get_shortcuts_inhibited: property 'shortcuts-inhibited' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "shortcuts-inhibited", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
