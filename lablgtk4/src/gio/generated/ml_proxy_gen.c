/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Proxy */

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


CAMLexport CAMLprim value ml_g_proxy_supports_hostname(value self)
{
CAMLparam1(self);

gboolean result = g_proxy_supports_hostname(GProxy_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_proxy_connect_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GIOStream* result = g_proxy_connect_finish(GProxy_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_proxy_connect(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

GIOStream* result = g_proxy_connect(GProxy_val(self), GIOStream_val(arg1), GProxyAddress_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
