/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Permission */

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


CAMLexport CAMLprim value ml_g_permission_release_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_permission_release_finish(GPermission_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_permission_release(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_permission_release(GPermission_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_permission_impl_update(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_permission_impl_update(GPermission_val(self), Bool_val(arg1), Bool_val(arg2), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_permission_get_can_release(value self)
{
CAMLparam1(self);

gboolean result = g_permission_get_can_release(GPermission_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_permission_get_can_acquire(value self)
{
CAMLparam1(self);

gboolean result = g_permission_get_can_acquire(GPermission_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_permission_get_allowed(value self)
{
CAMLparam1(self);

gboolean result = g_permission_get_allowed(GPermission_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_permission_acquire_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_permission_acquire_finish(GPermission_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_permission_acquire(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_permission_acquire(GPermission_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
