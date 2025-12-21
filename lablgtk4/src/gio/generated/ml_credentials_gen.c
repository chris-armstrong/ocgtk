/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Credentials */

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

/* Type-specific conversion macros for GCredentials */
#ifndef Val_GCredentials
#define GCredentials_val(val) ((GCredentials*)ext_of_val(val))
#define Val_GCredentials(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GCredentials */


CAMLexport CAMLprim value ml_g_credentials_new(value unit)
{
CAMLparam1(unit);
GCredentials *obj = g_credentials_new();
CAMLreturn(Val_GCredentials(obj));
}

CAMLexport CAMLprim value ml_g_credentials_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_credentials_to_string(GCredentials_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_credentials_set_unix_user(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_credentials_set_unix_user(GCredentials_val(self), Int_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_credentials_is_same_user(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_credentials_is_same_user(GCredentials_val(self), GCredentials_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_credentials_get_unix_user(value self)
{
CAMLparam1(self);
GError *error = NULL;

uid_t result = g_credentials_get_unix_user(GCredentials_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_credentials_get_unix_pid(value self)
{
CAMLparam1(self);
GError *error = NULL;

pid_t result = g_credentials_get_unix_pid(GCredentials_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
