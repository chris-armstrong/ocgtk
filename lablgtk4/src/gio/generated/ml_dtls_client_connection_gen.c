/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DtlsClientConnection */

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


CAMLexport CAMLprim value ml_g_dtls_client_connection_set_validation_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_client_connection_set_validation_flags(GDtlsClientConnection_val(self), GioTlsCertificateFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_client_connection_set_server_identity(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_client_connection_set_server_identity(GDtlsClientConnection_val(self), GSocketConnectable_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_client_connection_get_validation_flags(value self)
{
CAMLparam1(self);

GTlsCertificateFlags result = g_dtls_client_connection_get_validation_flags(GDtlsClientConnection_val(self));
CAMLreturn(Val_GioTlsCertificateFlags(result));
}

CAMLexport CAMLprim value ml_g_dtls_client_connection_get_server_identity(value self)
{
CAMLparam1(self);

GSocketConnectable* result = g_dtls_client_connection_get_server_identity(GDtlsClientConnection_val(self));
CAMLreturn(Val_GSocketConnectable(result));
}
