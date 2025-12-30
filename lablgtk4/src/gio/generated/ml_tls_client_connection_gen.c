/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsClientConnection */

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


CAMLexport CAMLprim value ml_g_tls_client_connection_set_validation_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_client_connection_set_validation_flags(GTlsClientConnection_val(self), GioTlsCertificateFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_client_connection_set_use_ssl3(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_client_connection_set_use_ssl3(GTlsClientConnection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_client_connection_set_server_identity(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_client_connection_set_server_identity(GTlsClientConnection_val(self), GSocketConnectable_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_client_connection_get_validation_flags(value self)
{
CAMLparam1(self);

GTlsCertificateFlags result = g_tls_client_connection_get_validation_flags(GTlsClientConnection_val(self));
CAMLreturn(Val_GioTlsCertificateFlags(result));
}

CAMLexport CAMLprim value ml_g_tls_client_connection_get_use_ssl3(value self)
{
CAMLparam1(self);

gboolean result = g_tls_client_connection_get_use_ssl3(GTlsClientConnection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_tls_client_connection_get_server_identity(value self)
{
CAMLparam1(self);

GSocketConnectable* result = g_tls_client_connection_get_server_identity(GTlsClientConnection_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GSocketConnectable));
}

CAMLexport CAMLprim value ml_g_tls_client_connection_copy_session_state(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_client_connection_copy_session_state(GTlsClientConnection_val(self), GTlsClientConnection_val(arg1));
CAMLreturn(Val_unit);
}
