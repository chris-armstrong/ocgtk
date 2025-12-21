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

/* Type-specific conversion macros for GTlsClientConnection */
#ifndef Val_GTlsClientConnection
#define GTlsClientConnection_val(val) ((GTlsClientConnection*)ext_of_val(val))
#define Val_GTlsClientConnection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GTlsClientConnection */


CAMLexport CAMLprim value ml_g_tls_client_connection_set_use_ssl3(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_client_connection_set_use_ssl3(GTlsClientConnection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_client_connection_get_use_ssl3(value self)
{
CAMLparam1(self);

gboolean result = g_tls_client_connection_get_use_ssl3(GTlsClientConnection_val(self));
CAMLreturn(Val_bool(result));
}
