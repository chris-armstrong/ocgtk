/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ZlibCompressor */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GZlibCompressor */
#ifndef Val_GZlibCompressor
#define GZlibCompressor_val(val) ((GZlibCompressor*)ext_of_val(val))
#define Val_GZlibCompressor(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GZlibCompressor */


CAMLexport CAMLprim value ml_g_zlib_compressor_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GZlibCompressor *obj = g_zlib_compressor_new(GioZlibCompressorFormat_val(arg1), Int_val(arg2));
CAMLreturn(Val_GZlibCompressor(obj));
}

CAMLexport CAMLprim value ml_g_zlib_compressor_set_file_info(value self, value arg1)
{
CAMLparam2(self, arg1);

g_zlib_compressor_set_file_info(GZlibCompressor_val(self), Option_val(arg1, GFileInfo_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_zlib_compressor_get_file_info(value self)
{
CAMLparam1(self);

GFileInfo* result = g_zlib_compressor_get_file_info(GZlibCompressor_val(self));
CAMLreturn(Val_option(result, Val_GFileInfo));
}

CAMLexport CAMLprim value ml_gtk_zlib_compressor_get_format(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GZlibCompressor *obj = (GZlibCompressor *)GZlibCompressor_val(self);
    GZlibCompressorFormat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "format");
if (pspec == NULL) caml_failwith("ml_gtk_zlib_compressor_get_format: property 'format' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "format", &prop_gvalue);
    prop_value = (GZlibCompressorFormat)g_value_get_enum(&prop_gvalue);

result = Val_GioZlibCompressorFormat(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_zlib_compressor_get_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GZlibCompressor *obj = (GZlibCompressor *)GZlibCompressor_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "level");
if (pspec == NULL) caml_failwith("ml_gtk_zlib_compressor_get_level: property 'level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "level", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
