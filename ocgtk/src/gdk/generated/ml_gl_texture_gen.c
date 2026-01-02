/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLTexture */

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


CAMLexport CAMLprim value ml_gdk_gl_texture_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GdkGLTexture *obj = gdk_gl_texture_new(GdkGLContext_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4), arg5, arg6);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GdkGLTexture(obj));
}

CAMLexport CAMLprim value ml_gdk_gl_texture_new_bytecode(value * argv, int argn)
{
return ml_gdk_gl_texture_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gdk_gl_texture_release(value self)
{
CAMLparam1(self);

gdk_gl_texture_release(GdkGLTexture_val(self));
CAMLreturn(Val_unit);
}
