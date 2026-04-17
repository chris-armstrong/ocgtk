/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TcpConnection */

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

#if GLIB_CHECK_VERSION(2,22,0)


CAMLexport CAMLprim value ml_g_tcp_connection_set_graceful_disconnect(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tcp_connection_set_graceful_disconnect(GTcpConnection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tcp_connection_get_graceful_disconnect(value self)
{
CAMLparam1(self);

gboolean result = g_tcp_connection_get_graceful_disconnect(GTcpConnection_val(self));
CAMLreturn(Val_bool(result));
}

#else


CAMLexport CAMLprim value ml_g_tcp_connection_get_graceful_disconnect(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("TcpConnection requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_tcp_connection_set_graceful_disconnect(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("TcpConnection requires GLib >= 2.22");
return Val_unit;
}


#endif
