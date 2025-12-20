/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ZlibDecompressor */

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

/* Type-specific conversion macros for GZlibDecompressor */
#ifndef Val_GZlibDecompressor
#define GZlibDecompressor_val(val) ((GZlibDecompressor*)ext_of_val(val))
#define Val_GZlibDecompressor(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GZlibDecompressor */


CAMLexport CAMLprim value ml_g_zlib_decompressor_new(value arg1)
{
CAMLparam1(arg1);
GZlibDecompressor *obj = g_zlib_decompressor_new(GioZlibCompressorFormat_val(arg1));
CAMLreturn(Val_GZlibDecompressor(obj));
}

CAMLexport CAMLprim value ml_g_zlib_decompressor_get_file_info(value self)
{
CAMLparam1(self);

GFileInfo* result = g_zlib_decompressor_get_file_info(GZlibDecompressor_val(self));
CAMLreturn(Val_option(result, Val_GFileInfo));
}

CAMLexport CAMLprim value ml_gtk_zlib_decompressor_get_format(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GZlibDecompressor *obj = (GZlibDecompressor *)GZlibDecompressor_val(self);
    GZlibCompressorFormat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "format");
if (pspec == NULL) caml_failwith("ml_gtk_zlib_decompressor_get_format: property 'format' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "format", &prop_gvalue);
    prop_value = (GZlibCompressorFormat)g_value_get_enum(&prop_gvalue);

result = Val_GioZlibCompressorFormat(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
