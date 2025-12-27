/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DataOutputStream */

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


CAMLexport CAMLprim value ml_g_data_output_stream_new(value arg1)
{
CAMLparam1(arg1);
GDataOutputStream *obj = g_data_output_stream_new(GOutputStream_val(arg1));
CAMLreturn(Val_GDataOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_data_output_stream_set_byte_order(value self, value arg1)
{
CAMLparam2(self, arg1);

g_data_output_stream_set_byte_order(GDataOutputStream_val(self), GioDataStreamByteOrder_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_data_output_stream_put_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = g_data_output_stream_put_string(GDataOutputStream_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_data_output_stream_get_byte_order(value self)
{
CAMLparam1(self);

GDataStreamByteOrder result = g_data_output_stream_get_byte_order(GDataOutputStream_val(self));
CAMLreturn(Val_GioDataStreamByteOrder(result));
}
