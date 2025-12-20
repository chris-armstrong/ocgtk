/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsInteraction */

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

/* Type-specific conversion macros for GTlsInteraction */
#ifndef Val_GTlsInteraction
#define GTlsInteraction_val(val) ((GTlsInteraction*)ext_of_val(val))
#define Val_GTlsInteraction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GTlsInteraction */


CAMLexport CAMLprim value ml_g_tls_interaction_request_certificate(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

GTlsInteractionResult result = g_tls_interaction_request_certificate(GTlsInteraction_val(self), GTlsConnection_val(arg1), GioTlsCertificateRequestFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsInteractionResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_interaction_invoke_request_certificate(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

GTlsInteractionResult result = g_tls_interaction_invoke_request_certificate(GTlsInteraction_val(self), GTlsConnection_val(arg1), GioTlsCertificateRequestFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsInteractionResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_interaction_invoke_ask_password(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GTlsInteractionResult result = g_tls_interaction_invoke_ask_password(GTlsInteraction_val(self), GTlsPassword_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsInteractionResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_tls_interaction_ask_password(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GTlsInteractionResult result = g_tls_interaction_ask_password(GTlsInteraction_val(self), GTlsPassword_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GioTlsInteractionResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
