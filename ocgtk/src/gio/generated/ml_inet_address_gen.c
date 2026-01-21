/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InetAddress */

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


CAMLexport CAMLprim value ml_g_inet_address_new_any(value arg1)
{
CAMLparam1(arg1);

GInetAddress *obj = g_inet_address_new_any(GioSocketFamily_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GInetAddress(obj));
}
CAMLexport CAMLprim value ml_g_inet_address_new_from_string(value arg1)
{
CAMLparam1(arg1);

GInetAddress *obj = g_inet_address_new_from_string(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GInetAddress(obj));
}
CAMLexport CAMLprim value ml_g_inet_address_new_loopback(value arg1)
{
CAMLparam1(arg1);

GInetAddress *obj = g_inet_address_new_loopback(GioSocketFamily_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GInetAddress(obj));
}
CAMLexport CAMLprim value ml_g_inet_address_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_inet_address_to_string(GInetAddress_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_site_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_site_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_multicast(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_multicast(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_mc_site_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_mc_site_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_mc_org_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_mc_org_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_mc_node_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_mc_node_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_mc_link_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_mc_link_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_mc_global(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_mc_global(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_loopback(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_loopback(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_link_local(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_link_local(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_is_any(value self)
{
CAMLparam1(self);

gboolean result = g_inet_address_get_is_any(GInetAddress_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_inet_address_get_family(value self)
{
CAMLparam1(self);

GSocketFamily result = g_inet_address_get_family(GInetAddress_val(self));
CAMLreturn(Val_GioSocketFamily(result));
}

CAMLexport CAMLprim value ml_g_inet_address_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_inet_address_equal(GInetAddress_val(self), GInetAddress_val(arg1));
CAMLreturn(Val_bool(result));
}
