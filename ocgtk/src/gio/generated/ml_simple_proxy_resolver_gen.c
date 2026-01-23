/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SimpleProxyResolver */

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


CAMLexport CAMLprim value ml_g_simple_proxy_resolver_set_uri_proxy(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_simple_proxy_resolver_set_uri_proxy(GSimpleProxyResolver_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_proxy_resolver_set_ignore_hosts(value self, value arg1)
{
CAMLparam2(self, arg1);
    int arg1_length = Wosize_val(arg1);
    gchar** c_arg1 = (gchar**)g_malloc(sizeof(gchar*) * (arg1_length + 1));
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = String_val(Field(arg1, i));
    }
    c_arg1[arg1_length] = NULL;

g_simple_proxy_resolver_set_ignore_hosts(GSimpleProxyResolver_val(self), c_arg1);
    g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_proxy_resolver_set_default_proxy(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_proxy_resolver_set_default_proxy(GSimpleProxyResolver_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}
