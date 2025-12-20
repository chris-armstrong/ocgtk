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

/* Type-specific conversion macros for GSimpleProxyResolver */
#ifndef Val_GSimpleProxyResolver
#define GSimpleProxyResolver_val(val) ((GSimpleProxyResolver*)ext_of_val(val))
#define Val_GSimpleProxyResolver(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSimpleProxyResolver */


CAMLexport CAMLprim value ml_g_simple_proxy_resolver_set_uri_proxy(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_simple_proxy_resolver_set_uri_proxy(GSimpleProxyResolver_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_proxy_resolver_set_default_proxy(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_proxy_resolver_set_default_proxy(GSimpleProxyResolver_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}
