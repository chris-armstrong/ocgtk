/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DataInputStream */

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


CAMLexport CAMLprim value ml_g_data_input_stream_new(value arg1)
{
CAMLparam1(arg1);
GDataInputStream *obj = g_data_input_stream_new(GInputStream_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GDataInputStream(obj));
}

CAMLexport CAMLprim value ml_g_data_input_stream_set_newline_type(value self, value arg1)
{
CAMLparam2(self, arg1);

g_data_input_stream_set_newline_type(GDataInputStream_val(self), GioDataStreamNewlineType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_data_input_stream_set_byte_order(value self, value arg1)
{
CAMLparam2(self, arg1);

g_data_input_stream_set_byte_order(GDataInputStream_val(self), GioDataStreamByteOrder_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_data_input_stream_get_newline_type(value self)
{
CAMLparam1(self);

GDataStreamNewlineType result = g_data_input_stream_get_newline_type(GDataInputStream_val(self));
CAMLreturn(Val_GioDataStreamNewlineType(result));
}

CAMLexport CAMLprim value ml_g_data_input_stream_get_byte_order(value self)
{
CAMLparam1(self);

GDataStreamByteOrder result = g_data_input_stream_get_byte_order(GDataInputStream_val(self));
CAMLreturn(Val_GioDataStreamByteOrder(result));
}
