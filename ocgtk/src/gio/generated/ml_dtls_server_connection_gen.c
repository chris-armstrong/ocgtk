/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DtlsServerConnection */

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


CAMLexport CAMLprim value ml_g_dtls_server_connection_get_authentication_mode(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GDtlsServerConnection *obj = (GDtlsServerConnection *)GDtlsServerConnection_val(self);
    GTlsAuthenticationMode prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "authentication-mode");
if (pspec == NULL) caml_failwith("ml_g_dtls_server_connection_get_authentication_mode: property 'authentication-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "authentication-mode", &prop_gvalue);
          prop_value = (GTlsAuthenticationMode)g_value_get_enum(&prop_gvalue);

      result = Val_GioTlsAuthenticationMode(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_g_dtls_server_connection_set_authentication_mode(value self, value new_value)
{
    CAMLparam2(self, new_value);
GDtlsServerConnection *obj = (GDtlsServerConnection *)GDtlsServerConnection_val(self);
    GTlsAuthenticationMode c_value = GioTlsAuthenticationMode_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "authentication-mode");
if (pspec == NULL) caml_failwith("ml_g_dtls_server_connection_set_authentication_mode: property 'authentication-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_enum(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "authentication-mode", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}
