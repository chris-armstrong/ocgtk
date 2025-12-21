/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DtlsConnection */

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

/* Type-specific conversion macros for GDtlsConnection */
#ifndef Val_GDtlsConnection
#define GDtlsConnection_val(val) ((GDtlsConnection*)ext_of_val(val))
#define Val_GDtlsConnection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDtlsConnection */


CAMLexport CAMLprim value ml_g_dtls_connection_shutdown(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

gboolean result = g_dtls_connection_shutdown(GDtlsConnection_val(self), Bool_val(arg1), Bool_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dtls_connection_set_require_close_notify(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_connection_set_require_close_notify(GDtlsConnection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_connection_set_rehandshake_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_connection_set_rehandshake_mode(GDtlsConnection_val(self), GioTlsRehandshakeMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_connection_set_interaction(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_connection_set_interaction(GDtlsConnection_val(self), Option_val(arg1, GTlsInteraction_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_connection_set_database(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_connection_set_database(GDtlsConnection_val(self), Option_val(arg1, GTlsDatabase_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_connection_set_certificate(value self, value arg1)
{
CAMLparam2(self, arg1);

g_dtls_connection_set_certificate(GDtlsConnection_val(self), GTlsCertificate_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dtls_connection_handshake(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dtls_connection_handshake(GDtlsConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_require_close_notify(value self)
{
CAMLparam1(self);

gboolean result = g_dtls_connection_get_require_close_notify(GDtlsConnection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_rehandshake_mode(value self)
{
CAMLparam1(self);

GTlsRehandshakeMode result = g_dtls_connection_get_rehandshake_mode(GDtlsConnection_val(self));
CAMLreturn(Val_GioTlsRehandshakeMode(result));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_protocol_version(value self)
{
CAMLparam1(self);

GTlsProtocolVersion result = g_dtls_connection_get_protocol_version(GDtlsConnection_val(self));
CAMLreturn(Val_GioTlsProtocolVersion(result));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_peer_certificate(value self)
{
CAMLparam1(self);

GTlsCertificate* result = g_dtls_connection_get_peer_certificate(GDtlsConnection_val(self));
CAMLreturn(Val_option(result, Val_GTlsCertificate));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_negotiated_protocol(value self)
{
CAMLparam1(self);

const gchar* result = g_dtls_connection_get_negotiated_protocol(GDtlsConnection_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_interaction(value self)
{
CAMLparam1(self);

GTlsInteraction* result = g_dtls_connection_get_interaction(GDtlsConnection_val(self));
CAMLreturn(Val_option(result, Val_GTlsInteraction));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_database(value self)
{
CAMLparam1(self);

GTlsDatabase* result = g_dtls_connection_get_database(GDtlsConnection_val(self));
CAMLreturn(Val_option(result, Val_GTlsDatabase));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_ciphersuite_name(value self)
{
CAMLparam1(self);

gchar* result = g_dtls_connection_get_ciphersuite_name(GDtlsConnection_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_dtls_connection_get_certificate(value self)
{
CAMLparam1(self);

GTlsCertificate* result = g_dtls_connection_get_certificate(GDtlsConnection_val(self));
CAMLreturn(Val_option(result, Val_GTlsCertificate));
}

CAMLexport CAMLprim value ml_g_dtls_connection_close(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_dtls_connection_close(GDtlsConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
