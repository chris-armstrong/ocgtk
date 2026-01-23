/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsPassword */

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


CAMLexport CAMLprim value ml_g_tls_password_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

GTlsPassword *obj = g_tls_password_new(GioTlsPasswordFlags_val(arg1), String_val(arg2));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GTlsPassword(obj));
}
CAMLexport CAMLprim value ml_g_tls_password_set_warning(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_password_set_warning(GTlsPassword_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_password_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_password_set_flags(GTlsPassword_val(self), GioTlsPasswordFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_password_set_description(value self, value arg1)
{
CAMLparam2(self, arg1);

g_tls_password_set_description(GTlsPassword_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_tls_password_get_warning(value self)
{
CAMLparam1(self);

const gchar* result = g_tls_password_get_warning(GTlsPassword_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_tls_password_get_flags(value self)
{
CAMLparam1(self);

GTlsPasswordFlags result = g_tls_password_get_flags(GTlsPassword_val(self));
CAMLreturn(Val_GioTlsPasswordFlags(result));
}

CAMLexport CAMLprim value ml_g_tls_password_get_description(value self)
{
CAMLparam1(self);

const gchar* result = g_tls_password_get_description(GTlsPassword_val(self));
CAMLreturn(caml_copy_string(result));
}
