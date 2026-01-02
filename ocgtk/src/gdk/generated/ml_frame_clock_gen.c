/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FrameClock */

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


CAMLexport CAMLprim value ml_gdk_frame_clock_request_phase(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_frame_clock_request_phase(GdkFrameClock_val(self), GdkFrameClockPhase_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_frame_clock_get_fps(value self)
{
CAMLparam1(self);

double result = gdk_frame_clock_get_fps(GdkFrameClock_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gdk_frame_clock_get_current_timings(value self)
{
CAMLparam1(self);

GdkFrameTimings* result = gdk_frame_clock_get_current_timings(GdkFrameClock_val(self));
CAMLreturn(Val_option(result, Val_GdkFrameTimings));
}

CAMLexport CAMLprim value ml_gdk_frame_clock_end_updating(value self)
{
CAMLparam1(self);

gdk_frame_clock_end_updating(GdkFrameClock_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_frame_clock_begin_updating(value self)
{
CAMLparam1(self);

gdk_frame_clock_begin_updating(GdkFrameClock_val(self));
CAMLreturn(Val_unit);
}
