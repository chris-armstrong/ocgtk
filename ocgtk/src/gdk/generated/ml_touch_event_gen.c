/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TouchEvent */

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


CAMLexport CAMLprim value ml_gdk_touch_event_get_emulating_pointer(value self)
{
CAMLparam1(self);

gboolean result = gdk_touch_event_get_emulating_pointer(GdkTouchEvent_val(self));
CAMLreturn(Val_bool(result));
}
