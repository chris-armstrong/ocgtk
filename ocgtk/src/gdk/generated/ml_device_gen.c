/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Device */

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


CAMLexport CAMLprim value ml_gdk_device_has_bidi_layouts(value self)
{
CAMLparam1(self);

gboolean result = gdk_device_has_bidi_layouts(GdkDevice_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_vendor_id(value self)
{
CAMLparam1(self);

const char* result = gdk_device_get_vendor_id(GdkDevice_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_surface_at_position(value self)
{
CAMLparam1(self);
double out1;
double out2;

GdkSurface* result = gdk_device_get_surface_at_position(GdkDevice_val(self), &out1, &out2);
if (result) g_object_ref_sink(result);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_option(result, Val_GdkSurface));
    Store_field(ret, 1, caml_copy_double(out1));
    Store_field(ret, 2, caml_copy_double(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gdk_device_get_source(value self)
{
CAMLparam1(self);

GdkInputSource result = gdk_device_get_source(GdkDevice_val(self));
CAMLreturn(Val_GdkInputSource(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_seat(value self)
{
CAMLparam1(self);

GdkSeat* result = gdk_device_get_seat(GdkDevice_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkSeat(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_scroll_lock_state(value self)
{
CAMLparam1(self);

gboolean result = gdk_device_get_scroll_lock_state(GdkDevice_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_product_id(value self)
{
CAMLparam1(self);

const char* result = gdk_device_get_product_id(GdkDevice_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_num_touches(value self)
{
CAMLparam1(self);

guint result = gdk_device_get_num_touches(GdkDevice_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_num_lock_state(value self)
{
CAMLparam1(self);

gboolean result = gdk_device_get_num_lock_state(GdkDevice_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_name(value self)
{
CAMLparam1(self);

const char* result = gdk_device_get_name(GdkDevice_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_modifier_state(value self)
{
CAMLparam1(self);

GdkModifierType result = gdk_device_get_modifier_state(GdkDevice_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_has_cursor(value self)
{
CAMLparam1(self);

gboolean result = gdk_device_get_has_cursor(GdkDevice_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_device_get_display(GdkDevice_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_device_tool(value self)
{
CAMLparam1(self);

GdkDeviceTool* result = gdk_device_get_device_tool(GdkDevice_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDeviceTool));
}

CAMLexport CAMLprim value ml_gdk_device_get_caps_lock_state(value self)
{
CAMLparam1(self);

gboolean result = gdk_device_get_caps_lock_state(GdkDevice_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_device_get_n_axes(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GdkDevice *obj = (GdkDevice *)GdkDevice_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-axes");
if (pspec == NULL) caml_failwith("ml_gdk_device_get_n_axes: property 'n-axes' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "n-axes", &prop_gvalue);
          prop_value = g_value_get_uint(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gdk_device_get_tool(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GdkDevice *obj = (GdkDevice *)GdkDevice_val(self);
    GdkDeviceTool *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "tool");
if (pspec == NULL) caml_failwith("ml_gdk_device_get_tool: property 'tool' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "tool", &prop_gvalue);
          prop_value = (GdkDeviceTool*)g_value_get_object(&prop_gvalue);

      result = Val_GdkDeviceTool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
