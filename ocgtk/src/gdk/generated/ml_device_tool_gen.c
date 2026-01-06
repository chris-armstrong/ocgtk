/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DeviceTool */

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


CAMLexport CAMLprim value ml_gdk_device_tool_get_tool_type(value self)
{
CAMLparam1(self);

GdkDeviceToolType result = gdk_device_tool_get_tool_type(GdkDeviceTool_val(self));
CAMLreturn(Val_GdkDeviceToolType(result));
}

CAMLexport CAMLprim value ml_gdk_device_tool_get_axes(value self)
{
CAMLparam1(self);

GdkAxisFlags result = gdk_device_tool_get_axes(GdkDeviceTool_val(self));
CAMLreturn(Val_GdkAxisFlags(result));
}
