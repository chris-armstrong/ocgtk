/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixConnection */

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

/* Type-specific conversion macros for GUnixConnection */
#ifndef Val_GUnixConnection
#define GUnixConnection_val(val) ((GUnixConnection*)ext_of_val(val))
#define Val_GUnixConnection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GUnixConnection */


CAMLexport CAMLprim value ml_g_unix_connection_send_fd(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = g_unix_connection_send_fd(GUnixConnection_val(self), Int_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_unix_connection_send_credentials(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_unix_connection_send_credentials(GUnixConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_unix_connection_receive_fd(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gint result = g_unix_connection_receive_fd(GUnixConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_unix_connection_receive_credentials(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GCredentials* result = g_unix_connection_receive_credentials(GUnixConnection_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GCredentials(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
