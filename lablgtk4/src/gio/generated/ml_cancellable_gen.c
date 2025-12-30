/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Cancellable */

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


CAMLexport CAMLprim value ml_g_cancellable_new(value unit)
{
CAMLparam1(unit);
GCancellable *obj = g_cancellable_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GCancellable(obj));
}

CAMLexport CAMLprim value ml_g_cancellable_set_error_if_cancelled(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_cancellable_set_error_if_cancelled(GCancellable_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_cancellable_reset(value self)
{
CAMLparam1(self);

g_cancellable_reset(GCancellable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_cancellable_release_fd(value self)
{
CAMLparam1(self);

g_cancellable_release_fd(GCancellable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_cancellable_push_current(value self)
{
CAMLparam1(self);

g_cancellable_push_current(GCancellable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_cancellable_pop_current(value self)
{
CAMLparam1(self);

g_cancellable_pop_current(GCancellable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_cancellable_is_cancelled(value self)
{
CAMLparam1(self);

gboolean result = g_cancellable_is_cancelled(GCancellable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_cancellable_get_fd(value self)
{
CAMLparam1(self);

int result = g_cancellable_get_fd(GCancellable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_cancellable_cancel(value self)
{
CAMLparam1(self);

g_cancellable_cancel(GCancellable_val(self));
CAMLreturn(Val_unit);
}
