/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MemoryTexture */

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


CAMLexport CAMLprim value ml_gdk_memory_texture_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GdkMemoryTexture *obj = gdk_memory_texture_new(Int_val(arg1), Int_val(arg2), GdkMemoryFormat_val(arg3), arg4, arg5);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GdkMemoryTexture(obj));
}
