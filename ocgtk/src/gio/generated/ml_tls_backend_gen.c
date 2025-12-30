/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsBackend */

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


CAMLexport CAMLprim value ml_g_tls_backend_supports_tls(value self)
{
CAMLparam1(self);

gboolean result = g_tls_backend_supports_tls(GTlsBackend_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_tls_backend_supports_dtls(value self)
{
CAMLparam1(self);

gboolean result = g_tls_backend_supports_dtls(GTlsBackend_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_tls_backend_set_default_database(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_backend_set_default_database(GTlsBackend_val(self), Option_val(arg1, GTlsDatabase_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_backend_get_default_database(value self)
{
CAMLparam1(self);

GTlsDatabase* result = g_tls_backend_get_default_database(GTlsBackend_val(self));
CAMLreturn(Val_GTlsDatabase(result));
}
