/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Texture */

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


CAMLexport CAMLprim value ml_gdk_texture_new_from_resource(value arg1)
{
CAMLparam1(arg1);

GdkTexture *obj = gdk_texture_new_from_resource(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkTexture(obj));
}
CAMLexport CAMLprim value ml_gdk_texture_save_to_tiff(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_texture_save_to_tiff(GdkTexture_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_texture_save_to_png(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_texture_save_to_png(GdkTexture_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_texture_get_width(value self)
{
CAMLparam1(self);

int result = gdk_texture_get_width(GdkTexture_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_texture_get_height(value self)
{
CAMLparam1(self);

int result = gdk_texture_get_height(GdkTexture_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_texture_get_format(value self)
{
CAMLparam1(self);

GdkMemoryFormat result = gdk_texture_get_format(GdkTexture_val(self));
CAMLreturn(Val_GdkMemoryFormat(result));
}
