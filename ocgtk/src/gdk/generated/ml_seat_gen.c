/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Seat */

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


CAMLexport CAMLprim value ml_gdk_seat_get_pointer(value self)
{
CAMLparam1(self);

GdkDevice* result = gdk_seat_get_pointer(GdkSeat_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDevice));
}

CAMLexport CAMLprim value ml_gdk_seat_get_keyboard(value self)
{
CAMLparam1(self);

GdkDevice* result = gdk_seat_get_keyboard(GdkSeat_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDevice));
}

CAMLexport CAMLprim value ml_gdk_seat_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_seat_get_display(GdkSeat_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}

CAMLexport CAMLprim value ml_gdk_seat_get_capabilities(value self)
{
CAMLparam1(self);

GdkSeatCapabilities result = gdk_seat_get_capabilities(GdkSeat_val(self));
CAMLreturn(Val_GdkSeatCapabilities(result));
}
