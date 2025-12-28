/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketConnectable */

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


CAMLexport CAMLprim value ml_g_socket_connectable_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_socket_connectable_to_string(GSocketConnectable_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_socket_connectable_proxy_enumerate(value self)
{
CAMLparam1(self);

GSocketAddressEnumerator* result = g_socket_connectable_proxy_enumerate(GSocketConnectable_val(self));
CAMLreturn(Val_GSocketAddressEnumerator(result));
}

CAMLexport CAMLprim value ml_g_socket_connectable_enumerate(value self)
{
CAMLparam1(self);

GSocketAddressEnumerator* result = g_socket_connectable_enumerate(GSocketConnectable_val(self));
CAMLreturn(Val_GSocketAddressEnumerator(result));
}
