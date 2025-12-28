/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NetworkAddress */

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


CAMLexport CAMLprim value ml_g_network_address_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GNetworkAddress *obj = g_network_address_new(String_val(arg1), arg2);
CAMLreturn(Val_GNetworkAddress(obj));
}

CAMLexport CAMLprim value ml_g_network_address_new_loopback(value arg1)
{
CAMLparam1(arg1);
GNetworkAddress *obj = g_network_address_new_loopback(arg1);
CAMLreturn(Val_GNetworkAddress(obj));
}

CAMLexport CAMLprim value ml_g_network_address_get_scheme(value self)
{
CAMLparam1(self);

const gchar* result = g_network_address_get_scheme(GNetworkAddress_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_network_address_get_hostname(value self)
{
CAMLparam1(self);

const gchar* result = g_network_address_get_hostname(GNetworkAddress_val(self));
CAMLreturn(caml_copy_string(result));
}
