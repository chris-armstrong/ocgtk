/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NglRenderer */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"


CAMLexport CAMLprim value ml_gsk_ngl_renderer_new(value unit)
{
CAMLparam1(unit);

GskNglRenderer *obj = gsk_ngl_renderer_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskNglRenderer(obj));
}