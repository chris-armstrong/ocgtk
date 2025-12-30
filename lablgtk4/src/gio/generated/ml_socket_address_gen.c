/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketAddress */

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


CAMLexport CAMLprim value ml_g_socket_address_new_from_native(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GSocketAddress *obj = g_socket_address_new_from_native(arg1, arg2);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSocketAddress(obj));
}

CAMLexport CAMLprim value ml_g_socket_address_get_family(value self)
{
CAMLparam1(self);

GSocketFamily result = g_socket_address_get_family(GSocketAddress_val(self));
CAMLreturn(Val_GioSocketFamily(result));
}
