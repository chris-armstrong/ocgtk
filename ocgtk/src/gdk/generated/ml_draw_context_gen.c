/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DrawContext */

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


CAMLexport CAMLprim value ml_gdk_draw_context_is_in_frame(value self)
{
CAMLparam1(self);

gboolean result = gdk_draw_context_is_in_frame(GdkDrawContext_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_draw_context_get_surface(value self)
{
CAMLparam1(self);

GdkSurface* result = gdk_draw_context_get_surface(GdkDrawContext_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkSurface));
}

CAMLexport CAMLprim value ml_gdk_draw_context_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_draw_context_get_display(GdkDrawContext_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkDisplay));
}

CAMLexport CAMLprim value ml_gdk_draw_context_end_frame(value self)
{
CAMLparam1(self);

gdk_draw_context_end_frame(GdkDrawContext_val(self));
CAMLreturn(Val_unit);
}
