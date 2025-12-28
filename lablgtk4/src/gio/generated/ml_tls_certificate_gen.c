/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsCertificate */

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


CAMLexport CAMLprim value ml_g_tls_certificate_verify(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GTlsCertificateFlags result = g_tls_certificate_verify(GTlsCertificate_val(self), Option_val(arg1, GSocketConnectable_val, NULL), Option_val(arg2, GTlsCertificate_val, NULL));
CAMLreturn(Val_GioTlsCertificateFlags(result));
}

CAMLexport CAMLprim value ml_g_tls_certificate_is_same(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_tls_certificate_is_same(GTlsCertificate_val(self), GTlsCertificate_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_tls_certificate_get_subject_name(value self)
{
CAMLparam1(self);

gchar* result = g_tls_certificate_get_subject_name(GTlsCertificate_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_tls_certificate_get_issuer_name(value self)
{
CAMLparam1(self);

gchar* result = g_tls_certificate_get_issuer_name(GTlsCertificate_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_tls_certificate_get_issuer(value self)
{
CAMLparam1(self);

GTlsCertificate* result = g_tls_certificate_get_issuer(GTlsCertificate_val(self));
CAMLreturn(Val_option(result, Val_GTlsCertificate));
}

CAMLexport CAMLprim value ml_gtk_tls_certificate_get_certificate_pem(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsCertificate *obj = (GTlsCertificate *)GTlsCertificate_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "certificate-pem");
if (pspec == NULL) caml_failwith("ml_gtk_tls_certificate_get_certificate_pem: property 'certificate-pem' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "certificate-pem", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tls_certificate_get_password(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsCertificate *obj = (GTlsCertificate *)GTlsCertificate_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "password");
if (pspec == NULL) caml_failwith("ml_gtk_tls_certificate_get_password: property 'password' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "password", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tls_certificate_get_pkcs11_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsCertificate *obj = (GTlsCertificate *)GTlsCertificate_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pkcs11-uri");
if (pspec == NULL) caml_failwith("ml_gtk_tls_certificate_get_pkcs11_uri: property 'pkcs11-uri' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "pkcs11-uri", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tls_certificate_get_private_key_pem(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsCertificate *obj = (GTlsCertificate *)GTlsCertificate_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "private-key-pem");
if (pspec == NULL) caml_failwith("ml_gtk_tls_certificate_get_private_key_pem: property 'private-key-pem' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "private-key-pem", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tls_certificate_get_private_key_pkcs11_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsCertificate *obj = (GTlsCertificate *)GTlsCertificate_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "private-key-pkcs11-uri");
if (pspec == NULL) caml_failwith("ml_gtk_tls_certificate_get_private_key_pkcs11_uri: property 'private-key-pkcs11-uri' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "private-key-pkcs11-uri", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
