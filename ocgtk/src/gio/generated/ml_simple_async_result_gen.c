/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SimpleAsyncResult */

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


CAMLexport CAMLprim value ml_g_simple_async_result_set_op_res_gboolean(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_async_result_set_op_res_gboolean(GSimpleAsyncResult_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_async_result_set_handle_cancellation(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_async_result_set_handle_cancellation(GSimpleAsyncResult_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_async_result_set_check_cancellable(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_async_result_set_check_cancellable(GSimpleAsyncResult_val(self), Option_val(arg1, GCancellable_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_async_result_propagate_error(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_simple_async_result_propagate_error(GSimpleAsyncResult_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_simple_async_result_get_op_res_gboolean(value self)
{
CAMLparam1(self);

gboolean result = g_simple_async_result_get_op_res_gboolean(GSimpleAsyncResult_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_simple_async_result_complete_in_idle(value self)
{
CAMLparam1(self);

g_simple_async_result_complete_in_idle(GSimpleAsyncResult_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_simple_async_result_complete(value self)
{
CAMLparam1(self);

g_simple_async_result_complete(GSimpleAsyncResult_val(self));
CAMLreturn(Val_unit);
}
