/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLRenderer */

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


#if GTK_CHECK_VERSION(4,2,0)

CAMLexport CAMLprim value ml_gsk_gl_renderer_new(value unit)
{
CAMLparam1(unit);

GskGLRenderer *obj = gsk_gl_renderer_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskGLRenderer(obj));
}
#else

CAMLexport CAMLprim value ml_gsk_gl_renderer_new(value unit)
{
CAMLparam1(unit);
(void)unit;
caml_failwith("GLRenderer requires GTK >= 4.2");
return Val_unit;
}
#endif
