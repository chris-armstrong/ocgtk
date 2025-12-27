/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketConnection */

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


CAMLexport CAMLprim value ml_g_socket_connection_is_connected(value self)
{
CAMLparam1(self);

gboolean result = g_socket_connection_is_connected(GSocketConnection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_socket_connection_get_socket(value self)
{
CAMLparam1(self);

GSocket* result = g_socket_connection_get_socket(GSocketConnection_val(self));
CAMLreturn(Val_GSocket(result));
}

CAMLexport CAMLprim value ml_g_socket_connection_get_remote_address(value self)
{
CAMLparam1(self);
GError *error = NULL;

GSocketAddress* result = g_socket_connection_get_remote_address(GSocketConnection_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GSocketAddress(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_socket_connection_get_local_address(value self)
{
CAMLparam1(self);
GError *error = NULL;

GSocketAddress* result = g_socket_connection_get_local_address(GSocketConnection_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GSocketAddress(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_socket_connection_connect_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_socket_connection_connect_finish(GSocketConnection_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_socket_connection_connect(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = g_socket_connection_connect(GSocketConnection_val(self), GSocketAddress_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
