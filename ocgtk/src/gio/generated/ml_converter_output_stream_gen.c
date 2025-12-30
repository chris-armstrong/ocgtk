/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConverterOutputStream */

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


CAMLexport CAMLprim value ml_g_converter_output_stream_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GConverterOutputStream *obj = g_converter_output_stream_new(GOutputStream_val(arg1), GConverter_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GConverterOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_converter_output_stream_get_converter(value self)
{
CAMLparam1(self);

GConverter* result = g_converter_output_stream_get_converter(GConverterOutputStream_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GConverter(result));
}
