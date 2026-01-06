/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CrossingEvent */

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


CAMLexport CAMLprim value ml_gdk_crossing_event_get_mode(value self)
{
CAMLparam1(self);

GdkCrossingMode result = gdk_crossing_event_get_mode(GdkCrossingEvent_val(self));
CAMLreturn(Val_GdkCrossingMode(result));
}

CAMLexport CAMLprim value ml_gdk_crossing_event_get_focus(value self)
{
CAMLparam1(self);

gboolean result = gdk_crossing_event_get_focus(GdkCrossingEvent_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_crossing_event_get_detail(value self)
{
CAMLparam1(self);

GdkNotifyType result = gdk_crossing_event_get_detail(GdkCrossingEvent_val(self));
CAMLreturn(Val_GdkNotifyType(result));
}
