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

/* Type-specific conversion macros for GTlsDatabase */
#ifndef Val_GTlsDatabase
#define GTlsDatabase_val(val) ((GTlsDatabase*)ext_of_val(val))
#define Val_GTlsDatabase(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GTlsDatabase */


CAMLexport CAMLprim value ml_g_tls_database_lookup_certificate_issuer(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

GTlsCertificate* result = g_tls_database_lookup_certificate_issuer(GTlsDatabase_val(self), GTlsCertificate_val(arg1), Option_val(arg2, GTlsInteraction_val, NULL), GioTlsDatabaseLookupFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
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
