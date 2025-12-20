/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AsyncResult */

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

/* Type-specific conversion macros for GAsyncResult */
#ifndef Val_GAsyncResult
#define GAsyncResult_val(val) ((GAsyncResult*)ext_of_val(val))
#define Val_GAsyncResult(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GAsyncResult */


CAMLexport CAMLprim value ml_g_async_result_legacy_propagate_error(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_async_result_legacy_propagate_error(GAsyncResult_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
