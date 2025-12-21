/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NativeSocketAddress */

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

/* Type-specific conversion macros for GNativeSocketAddress */
#ifndef Val_GNativeSocketAddress
#define GNativeSocketAddress_val(val) ((GNativeSocketAddress*)ext_of_val(val))
#define Val_GNativeSocketAddress(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GNativeSocketAddress */


CAMLexport CAMLprim value ml_g_native_socket_address_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GNativeSocketAddress *obj = g_native_socket_address_new(arg1, arg2);
CAMLreturn(Val_GNativeSocketAddress(obj));
}
