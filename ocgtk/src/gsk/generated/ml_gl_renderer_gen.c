/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLRenderer */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gsk_gl_renderer_new(value unit)
{
CAMLparam1(unit);

GskGLRenderer *obj = gsk_gl_renderer_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskGLRenderer(obj));
}