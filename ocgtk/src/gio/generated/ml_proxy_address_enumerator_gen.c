/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ProxyAddressEnumerator */

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


CAMLexport CAMLprim value ml_g_proxy_address_enumerator_get_default_port(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GProxyAddressEnumerator *obj = (GProxyAddressEnumerator *)GProxyAddressEnumerator_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-port");
if (pspec == NULL) caml_failwith("ml_g_proxy_address_enumerator_get_default_port: property 'default-port' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "default-port", &prop_gvalue);
          prop_value = g_value_get_uint(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_g_proxy_address_enumerator_get_uri(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GProxyAddressEnumerator *obj = (GProxyAddressEnumerator *)GProxyAddressEnumerator_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "uri");
if (pspec == NULL) caml_failwith("ml_g_proxy_address_enumerator_get_uri: property 'uri' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "uri", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
