/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InetAddressMask */

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


CAMLexport CAMLprim value ml_g_inet_address_mask_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_inet_address_mask_to_string(GInetAddressMask_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_inet_address_mask_matches(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_inet_address_mask_matches(GInetAddressMask_val(self), GInetAddress_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_mask_get_length(value self)
{
CAMLparam1(self);

guint result = g_inet_address_mask_get_length(GInetAddressMask_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_inet_address_mask_get_family(value self)
{
CAMLparam1(self);

GSocketFamily result = g_inet_address_mask_get_family(GInetAddressMask_val(self));
CAMLreturn(Val_GioSocketFamily(result));
}

CAMLexport CAMLprim value ml_g_inet_address_mask_get_address(value self)
{
CAMLparam1(self);

GInetAddress* result = g_inet_address_mask_get_address(GInetAddressMask_val(self));
CAMLreturn(Val_GInetAddress(result));
}

CAMLexport CAMLprim value ml_g_inet_address_mask_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_inet_address_mask_equal(GInetAddressMask_val(self), GInetAddressMask_val(arg1));
CAMLreturn(Val_bool(result));
}
