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

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,28,0)


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

#else


CAMLexport CAMLprim value ml_g_tcp_wrapper_connection_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
(void)arg1;
(void)arg2;
caml_failwith("TcpWrapperConnection requires GLib >= 2.28");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_tcp_wrapper_connection_get_base_io_stream(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("TcpWrapperConnection requires GLib >= 2.28");
return Val_unit;
}


#endif
