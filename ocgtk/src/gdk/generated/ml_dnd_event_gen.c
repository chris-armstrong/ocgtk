/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DNDEvent */

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


CAMLexport CAMLprim value ml_gdk_dnd_event_get_drop(value self)
{
CAMLparam1(self);

GdkDrop* result = gdk_dnd_event_get_drop(GdkDNDEvent_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDrop));
}
