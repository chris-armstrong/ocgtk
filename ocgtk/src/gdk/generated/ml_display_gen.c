/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Display */

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


CAMLexport CAMLprim value ml_gdk_display_translate_key(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
guint out4;
int out5;
int out6;
GdkModifierType out7;

gboolean result = gdk_display_translate_key(GdkDisplay_val(self), Int_val(arg1), GdkModifierType_val(arg2), Int_val(arg3), &out4, &out5, &out6, &out7);
CAMLlocal1(ret);
    ret = caml_alloc(5, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_int(out4));
    Store_field(ret, 2, Val_int(out5));
    Store_field(ret, 3, Val_int(out6));
    Store_field(ret, 4, Val_GdkModifierType(out7));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gdk_display_sync(value self)
{
CAMLparam1(self);

gdk_display_sync(GdkDisplay_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_display_supports_shadow_width(value self)
{
CAMLparam1(self);

gboolean result = gdk_display_supports_shadow_width(GdkDisplay_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_supports_input_shapes(value self)
{
CAMLparam1(self);

gboolean result = gdk_display_supports_input_shapes(GdkDisplay_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_put_event(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_display_put_event(GdkDisplay_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_display_prepare_gl(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = gdk_display_prepare_gl(GdkDisplay_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gdk_display_notify_startup_complete(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_display_notify_startup_complete(GdkDisplay_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_display_is_rgba(value self)
{
CAMLparam1(self);

gboolean result = gdk_display_is_rgba(GdkDisplay_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_is_composited(value self)
{
CAMLparam1(self);

gboolean result = gdk_display_is_composited(GdkDisplay_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_is_closed(value self)
{
CAMLparam1(self);

gboolean result = gdk_display_is_closed(GdkDisplay_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_startup_notification_id(value self)
{
CAMLparam1(self);

const char* result = gdk_display_get_startup_notification_id(GdkDisplay_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_primary_clipboard(value self)
{
CAMLparam1(self);

GdkClipboard* result = gdk_display_get_primary_clipboard(GdkDisplay_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkClipboard(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_name(value self)
{
CAMLparam1(self);

const char* result = gdk_display_get_name(GdkDisplay_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_monitor_at_surface(value self, value arg1)
{
CAMLparam2(self, arg1);

GdkMonitor* result = gdk_display_get_monitor_at_surface(GdkDisplay_val(self), GdkSurface_val(arg1));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkMonitor));
}

CAMLexport CAMLprim value ml_gdk_display_get_dmabuf_formats(value self)
{
CAMLparam1(self);

GdkDmabufFormats* result = gdk_display_get_dmabuf_formats(GdkDisplay_val(self));
CAMLreturn(Val_GdkDmabufFormats(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_default_seat(value self)
{
CAMLparam1(self);

GdkSeat* result = gdk_display_get_default_seat(GdkDisplay_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkSeat));
}

CAMLexport CAMLprim value ml_gdk_display_get_clipboard(value self)
{
CAMLparam1(self);

GdkClipboard* result = gdk_display_get_clipboard(GdkDisplay_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkClipboard(result));
}

CAMLexport CAMLprim value ml_gdk_display_get_app_launch_context(value self)
{
CAMLparam1(self);

GdkAppLaunchContext* result = gdk_display_get_app_launch_context(GdkDisplay_val(self));
CAMLreturn(Val_GdkAppLaunchContext(result));
}

CAMLexport CAMLprim value ml_gdk_display_flush(value self)
{
CAMLparam1(self);

gdk_display_flush(GdkDisplay_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_display_device_is_grabbed(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_display_device_is_grabbed(GdkDisplay_val(self), GdkDevice_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_display_create_gl_context(value self)
{
CAMLparam1(self);
GError *error = NULL;

GdkGLContext* result = gdk_display_create_gl_context(GdkDisplay_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GdkGLContext(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gdk_display_close(value self)
{
CAMLparam1(self);

gdk_display_close(GdkDisplay_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_display_beep(value self)
{
CAMLparam1(self);

gdk_display_beep(GdkDisplay_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_display_get_composited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkDisplay *obj = (GdkDisplay *)GdkDisplay_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "composited");
if (pspec == NULL) caml_failwith("ml_gtk_display_get_composited: property 'composited' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "composited", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_display_get_input_shapes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkDisplay *obj = (GdkDisplay *)GdkDisplay_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "input-shapes");
if (pspec == NULL) caml_failwith("ml_gtk_display_get_input_shapes: property 'input-shapes' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "input-shapes", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_display_get_rgba(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkDisplay *obj = (GdkDisplay *)GdkDisplay_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "rgba");
if (pspec == NULL) caml_failwith("ml_gtk_display_get_rgba: property 'rgba' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "rgba", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_display_get_shadow_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GdkDisplay *obj = (GdkDisplay *)GdkDisplay_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "shadow-width");
if (pspec == NULL) caml_failwith("ml_gtk_display_get_shadow_width: property 'shadow-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "shadow-width", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
