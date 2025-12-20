/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InetSocketAddress */

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

/* Type-specific conversion macros for GInetSocketAddress */
#ifndef Val_GInetSocketAddress
#define GInetSocketAddress_val(val) ((GInetSocketAddress*)ext_of_val(val))
#define Val_GInetSocketAddress(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GInetSocketAddress */


CAMLexport CAMLprim value ml_g_inet_socket_address_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GInetSocketAddress *obj = g_inet_socket_address_new(GInetAddress_val(arg1), arg2);
CAMLreturn(Val_GInetSocketAddress(obj));
}

CAMLexport CAMLprim value ml_g_inet_socket_address_new_from_string(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GInetSocketAddress *obj = g_inet_socket_address_new_from_string(String_val(arg1), Int_val(arg2));
CAMLreturn(Val_GInetSocketAddress(obj));
}

CAMLexport CAMLprim value ml_g_inet_socket_address_get_address(value self)
{
CAMLparam1(self);

GInetAddress* result = g_inet_socket_address_get_address(GInetSocketAddress_val(self));
CAMLreturn(Val_GInetAddress(result));
}
