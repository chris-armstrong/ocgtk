/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixCredentialsMessage */

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


CAMLexport CAMLprim value ml_g_unix_credentials_message_new(value unit)
{
CAMLparam1(unit);
GUnixCredentialsMessage *obj = g_unix_credentials_message_new();
CAMLreturn(Val_GUnixCredentialsMessage(obj));
}

CAMLexport CAMLprim value ml_g_unix_credentials_message_new_with_credentials(value arg1)
{
CAMLparam1(arg1);
GUnixCredentialsMessage *obj = g_unix_credentials_message_new_with_credentials(GCredentials_val(arg1));
CAMLreturn(Val_GUnixCredentialsMessage(obj));
}

CAMLexport CAMLprim value ml_g_unix_credentials_message_get_credentials(value self)
{
CAMLparam1(self);

GCredentials* result = g_unix_credentials_message_get_credentials(GUnixCredentialsMessage_val(self));
CAMLreturn(Val_GCredentials(result));
}
