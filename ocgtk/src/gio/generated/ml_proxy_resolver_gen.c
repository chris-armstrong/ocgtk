/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ProxyResolver */

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


CAMLexport CAMLprim value ml_g_proxy_resolver_lookup_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gchar** result = g_proxy_resolver_lookup_finish(GProxyResolver_val(self), GAsyncResult_val(arg1), &error);
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
if (error == NULL) CAMLreturn(Res_Ok(ml_result)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_proxy_resolver_lookup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gchar** result = g_proxy_resolver_lookup(GProxyResolver_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
if (error == NULL) CAMLreturn(Res_Ok(ml_result)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_proxy_resolver_is_supported(value self)
{
CAMLparam1(self);

gboolean result = g_proxy_resolver_is_supported(GProxyResolver_val(self));
CAMLreturn(Val_bool(result));
}
