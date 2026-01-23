/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextureDownloader */

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

/* Conversion functions for GdkTextureDownloader (opaque record with hidden fields) */
GdkTextureDownloader *GdkTextureDownloader_val(value v) {
  return *(GdkTextureDownloader **)Data_custom_val(v);
}

value Val_GdkTextureDownloader(const GdkTextureDownloader *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkTextureDownloader_option(const GdkTextureDownloader *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkTextureDownloader(ptr));
}


CAMLexport CAMLprim value ml_gdk_texture_downloader_new(value arg1)
{
CAMLparam1(arg1);

GdkTextureDownloader *obj = gdk_texture_downloader_new(GdkTexture_val(arg1));

CAMLreturn(Val_GdkTextureDownloader(obj));
}
CAMLexport CAMLprim value ml_gdk_texture_downloader_set_texture(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_texture_downloader_set_texture(GdkTextureDownloader_val(self), GdkTexture_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_texture_downloader_set_format(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_texture_downloader_set_format(GdkTextureDownloader_val(self), GdkMemoryFormat_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_texture_downloader_get_texture(value self)
{
CAMLparam1(self);

GdkTexture* result = gdk_texture_downloader_get_texture(GdkTextureDownloader_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkTexture(result));
}

CAMLexport CAMLprim value ml_gdk_texture_downloader_get_format(value self)
{
CAMLparam1(self);

GdkMemoryFormat result = gdk_texture_downloader_get_format(GdkTextureDownloader_val(self));
CAMLreturn(Val_GdkMemoryFormat(result));
}

CAMLexport CAMLprim value ml_gdk_texture_downloader_free(value self)
{
CAMLparam1(self);

gdk_texture_downloader_free(GdkTextureDownloader_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_texture_downloader_copy(value self)
{
CAMLparam1(self);

GdkTextureDownloader* result = gdk_texture_downloader_copy(GdkTextureDownloader_val(self));
CAMLreturn(Val_GdkTextureDownloader(result));
}
