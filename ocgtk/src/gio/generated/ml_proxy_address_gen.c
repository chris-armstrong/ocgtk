/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ProxyAddress */

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


CAMLexport CAMLprim value ml_g_proxy_address_get_username(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_username(GProxyAddress_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_proxy_address_get_uri(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_uri(GProxyAddress_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_proxy_address_get_protocol(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_protocol(GProxyAddress_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_proxy_address_get_password(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_password(GProxyAddress_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_proxy_address_get_destination_protocol(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_destination_protocol(GProxyAddress_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_proxy_address_get_destination_hostname(value self)
{
CAMLparam1(self);

const gchar* result = g_proxy_address_get_destination_hostname(GProxyAddress_val(self));
CAMLreturn(caml_copy_string(result));
}
