/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixSocketAddress */

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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


#if GLIB_CHECK_VERSION(2,22,0)

CAMLexport CAMLprim value ml_g_unix_socket_address_new(value arg1)
{
CAMLparam1(arg1);

GUnixSocketAddress *obj = g_unix_socket_address_new(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GUnixSocketAddress(obj));
}
#else

CAMLexport CAMLprim value ml_g_unix_socket_address_new(value arg1)
{
CAMLparam1(arg1);
(void)arg1;
caml_failwith("UnixSocketAddress requires GLib >= 2.22");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,22,0)

CAMLexport CAMLprim value ml_g_unix_socket_address_get_path(value self)
{
CAMLparam1(self);

const char* result = g_unix_socket_address_get_path(GUnixSocketAddress_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_g_unix_socket_address_get_path(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("UnixSocketAddress requires GLib >= 2.22");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,22,0)

CAMLexport CAMLprim value ml_g_unix_socket_address_get_is_abstract(value self)
{
CAMLparam1(self);

gboolean result = g_unix_socket_address_get_is_abstract(GUnixSocketAddress_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_unix_socket_address_get_is_abstract(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("UnixSocketAddress requires GLib >= 2.22");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,26,0)

CAMLexport CAMLprim value ml_g_unix_socket_address_get_address_type(value self)
{
CAMLparam1(self);

GUnixSocketAddressType result = g_unix_socket_address_get_address_type(GUnixSocketAddress_val(self));
CAMLreturn(Val_GioUnixSocketAddressType(result));
}

#else

CAMLexport CAMLprim value ml_g_unix_socket_address_get_address_type(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("UnixSocketAddress requires GLib >= 2.26");
return Val_unit;
}
#endif

CAMLexport CAMLprim value ml_g_unix_socket_address_get_abstract(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GUnixSocketAddress *obj = (GUnixSocketAddress *)GUnixSocketAddress_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "abstract");
if (pspec == NULL) caml_failwith("ml_g_unix_socket_address_get_abstract: property 'abstract' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "abstract", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
