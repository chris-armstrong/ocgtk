/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DmabufTextureBuilder */

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


CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_new(value unit)
{
CAMLparam1(unit);

GdkDmabufTextureBuilder *obj = gdk_dmabuf_texture_builder_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkDmabufTextureBuilder(obj));
}
CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_width(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_update_texture(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_update_texture(GdkDmabufTextureBuilder_val(self), Option_val(arg1, GdkTexture_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_stride(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gdk_dmabuf_texture_builder_set_stride(GdkDmabufTextureBuilder_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_premultiplied(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_premultiplied(GdkDmabufTextureBuilder_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gdk_dmabuf_texture_builder_set_offset(GdkDmabufTextureBuilder_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_n_planes(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_n_planes(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_height(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_height(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_fd(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gdk_dmabuf_texture_builder_set_fd(GdkDmabufTextureBuilder_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_set_display(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_dmabuf_texture_builder_set_display(GdkDmabufTextureBuilder_val(self), GdkDisplay_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_width(value self)
{
CAMLparam1(self);

unsigned int result = gdk_dmabuf_texture_builder_get_width(GdkDmabufTextureBuilder_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_update_texture(value self)
{
CAMLparam1(self);

GdkTexture* result = gdk_dmabuf_texture_builder_get_update_texture(GdkDmabufTextureBuilder_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkTexture));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_stride(value self, value arg1)
{
CAMLparam2(self, arg1);

unsigned int result = gdk_dmabuf_texture_builder_get_stride(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_premultiplied(value self)
{
CAMLparam1(self);

gboolean result = gdk_dmabuf_texture_builder_get_premultiplied(GdkDmabufTextureBuilder_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_offset(value self, value arg1)
{
CAMLparam2(self, arg1);

unsigned int result = gdk_dmabuf_texture_builder_get_offset(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_n_planes(value self)
{
CAMLparam1(self);

unsigned int result = gdk_dmabuf_texture_builder_get_n_planes(GdkDmabufTextureBuilder_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_height(value self)
{
CAMLparam1(self);

unsigned int result = gdk_dmabuf_texture_builder_get_height(GdkDmabufTextureBuilder_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gdk_dmabuf_texture_builder_get_fd(GdkDmabufTextureBuilder_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_dmabuf_texture_builder_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_dmabuf_texture_builder_get_display(GdkDmabufTextureBuilder_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}
