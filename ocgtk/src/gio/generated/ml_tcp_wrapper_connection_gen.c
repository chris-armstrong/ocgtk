/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TcpWrapperConnection */

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


CAMLexport CAMLprim value ml_g_tcp_wrapper_connection_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

GTcpWrapperConnection *obj = g_tcp_wrapper_connection_new(GIOStream_val(arg1), GSocket_val(arg2));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GTcpWrapperConnection(obj));
}
CAMLexport CAMLprim value ml_g_tcp_wrapper_connection_get_base_io_stream(value self)
{
CAMLparam1(self);

GIOStream* result = g_tcp_wrapper_connection_get_base_io_stream(GTcpWrapperConnection_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GIOStream(result));
}
