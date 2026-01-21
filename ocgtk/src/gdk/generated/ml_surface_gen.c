/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Surface */

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


CAMLexport CAMLprim value ml_gdk_surface_new_popup(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

GdkSurface *obj = gdk_surface_new_popup(GdkSurface_val(arg1), Bool_val(arg2));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkSurface(obj));
}
CAMLexport CAMLprim value ml_gdk_surface_new_toplevel(value arg1)
{
CAMLparam1(arg1);

GdkSurface *obj = gdk_surface_new_toplevel(GdkDisplay_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkSurface(obj));
}
CAMLexport CAMLprim value ml_gdk_surface_translate_coordinates(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
double inout2 = Double_val(arg2);
double inout3 = Double_val(arg3);

gboolean result = gdk_surface_translate_coordinates(GdkSurface_val(self), GdkSurface_val(arg1), &inout2, &inout3);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_double(inout2));
    Store_field(ret, 2, caml_copy_double(inout3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gdk_surface_set_device_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gdk_surface_set_device_cursor(GdkSurface_val(self), GdkDevice_val(arg1), GdkCursor_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_set_cursor(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_surface_set_cursor(GdkSurface_val(self), Option_val(arg1, GdkCursor_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_request_layout(value self)
{
CAMLparam1(self);

gdk_surface_request_layout(GdkSurface_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_queue_render(value self)
{
CAMLparam1(self);

gdk_surface_queue_render(GdkSurface_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_is_destroyed(value self)
{
CAMLparam1(self);

gboolean result = gdk_surface_is_destroyed(GdkSurface_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_surface_hide(value self)
{
CAMLparam1(self);

gdk_surface_hide(GdkSurface_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_get_width(value self)
{
CAMLparam1(self);

int result = gdk_surface_get_width(GdkSurface_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_scale_factor(value self)
{
CAMLparam1(self);

int result = gdk_surface_get_scale_factor(GdkSurface_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_scale(value self)
{
CAMLparam1(self);

double result = gdk_surface_get_scale(GdkSurface_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_mapped(value self)
{
CAMLparam1(self);

gboolean result = gdk_surface_get_mapped(GdkSurface_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_height(value self)
{
CAMLparam1(self);

int result = gdk_surface_get_height(GdkSurface_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_frame_clock(value self)
{
CAMLparam1(self);

GdkFrameClock* result = gdk_surface_get_frame_clock(GdkSurface_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkFrameClock(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_surface_get_display(GdkSurface_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}

CAMLexport CAMLprim value ml_gdk_surface_get_device_position(value self, value arg1)
{
CAMLparam2(self, arg1);
double out2;
double out3;
GdkModifierType out4;

gboolean result = gdk_surface_get_device_position(GdkSurface_val(self), GdkDevice_val(arg1), &out2, &out3, &out4);
CAMLlocal1(ret);
    ret = caml_alloc(4, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_double(out2));
    Store_field(ret, 2, caml_copy_double(out3));
    Store_field(ret, 3, Val_GdkModifierType(out4));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gdk_surface_get_device_cursor(value self, value arg1)
{
CAMLparam2(self, arg1);

GdkCursor* result = gdk_surface_get_device_cursor(GdkSurface_val(self), GdkDevice_val(arg1));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkCursor));
}

CAMLexport CAMLprim value ml_gdk_surface_get_cursor(value self)
{
CAMLparam1(self);

GdkCursor* result = gdk_surface_get_cursor(GdkSurface_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkCursor));
}

CAMLexport CAMLprim value ml_gdk_surface_destroy(value self)
{
CAMLparam1(self);

gdk_surface_destroy(GdkSurface_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_surface_create_vulkan_context(value self)
{
CAMLparam1(self);
GError *error = NULL;

GdkVulkanContext* result = gdk_surface_create_vulkan_context(GdkSurface_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GdkVulkanContext(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gdk_surface_create_gl_context(value self)
{
CAMLparam1(self);
GError *error = NULL;

GdkGLContext* result = gdk_surface_create_gl_context(GdkSurface_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GdkGLContext(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gdk_surface_create_cairo_context(value self)
{
CAMLparam1(self);

GdkCairoContext* result = gdk_surface_create_cairo_context(GdkSurface_val(self));
CAMLreturn(Val_GdkCairoContext(result));
}

CAMLexport CAMLprim value ml_gdk_surface_beep(value self)
{
CAMLparam1(self);

gdk_surface_beep(GdkSurface_val(self));
CAMLreturn(Val_unit);
}
