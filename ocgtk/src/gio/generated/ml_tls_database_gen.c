/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsDatabase */

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


CAMLexport CAMLprim value ml_g_tls_database_verify_chain_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GTlsCertificateFlags result = g_tls_database_verify_chain_finish(GTlsDatabase_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsCertificateFlags(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_database_verify_chain_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);
GError *error = NULL;

GTlsCertificateFlags result = g_tls_database_verify_chain(GTlsDatabase_val(self), GTlsCertificate_val(arg1), String_val(arg2), Option_val(arg3, GSocketConnectable_val, NULL), Option_val(arg4, GTlsInteraction_val, NULL), GioTlsDatabaseVerifyFlags_val(arg5), Option_val(arg6, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsCertificateFlags(result))); else CAMLreturn(Res_Error(Val_GError(error)));}

CAMLexport CAMLprim value ml_g_tls_database_verify_chain_bytecode(value * argv, int argn)
{
return ml_g_tls_database_verify_chain_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_g_tls_database_lookup_certificate_issuer_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GTlsCertificate* result = g_tls_database_lookup_certificate_issuer_finish(GTlsDatabase_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GTlsCertificate(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_database_lookup_certificate_issuer(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

GTlsCertificate* result = g_tls_database_lookup_certificate_issuer(GTlsDatabase_val(self), GTlsCertificate_val(arg1), Option_val(arg2, GTlsInteraction_val, NULL), GioTlsDatabaseLookupFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GTlsCertificate(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_database_lookup_certificate_for_handle_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GTlsCertificate* result = g_tls_database_lookup_certificate_for_handle_finish(GTlsDatabase_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GTlsCertificate(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_database_lookup_certificate_for_handle(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

GTlsCertificate* result = g_tls_database_lookup_certificate_for_handle(GTlsDatabase_val(self), String_val(arg1), Option_val(arg2, GTlsInteraction_val, NULL), GioTlsDatabaseLookupFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_option(result, Val_GTlsCertificate))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_database_create_certificate_handle(value self, value arg1)
{
CAMLparam2(self, arg1);

gchar* result = g_tls_database_create_certificate_handle(GTlsDatabase_val(self), GTlsCertificate_val(arg1));
CAMLreturn(Val_option_string(result));
}
