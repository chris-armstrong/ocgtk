/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OutputStream */

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

/* Type-specific conversion macros for GOutputStream */
#ifndef Val_GOutputStream
#define GOutputStream_val(val) ((GOutputStream*)ext_of_val(val))
#define Val_GOutputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GOutputStream */


CAMLexport CAMLprim value ml_g_output_stream_set_pending(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_output_stream_set_pending(GOutputStream_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_output_stream_is_closing(value self)
{
CAMLparam1(self);

gboolean result = g_output_stream_is_closing(GOutputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_output_stream_is_closed(value self)
{
CAMLparam1(self);

gboolean result = g_output_stream_is_closed(GOutputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_output_stream_has_pending(value self)
{
CAMLparam1(self);

gboolean result = g_output_stream_has_pending(GOutputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_output_stream_flush(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_output_stream_flush(GOutputStream_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_output_stream_close(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_output_stream_close(GOutputStream_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_output_stream_clear_pending(value self)
{
CAMLparam1(self);

g_output_stream_clear_pending(GOutputStream_val(self));
CAMLreturn(Val_unit);
}
