/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InputStream */

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

/* Type-specific conversion macros for GInputStream */
#ifndef Val_GInputStream
#define GInputStream_val(val) ((GInputStream*)ext_of_val(val))
#define Val_GInputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GInputStream */


CAMLexport CAMLprim value ml_g_input_stream_set_pending(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_input_stream_set_pending(GInputStream_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_input_stream_is_closed(value self)
{
CAMLparam1(self);

gboolean result = g_input_stream_is_closed(GInputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_input_stream_has_pending(value self)
{
CAMLparam1(self);

gboolean result = g_input_stream_has_pending(GInputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_input_stream_close(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_input_stream_close(GInputStream_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_input_stream_clear_pending(value self)
{
CAMLparam1(self);

g_input_stream_clear_pending(GInputStream_val(self));
CAMLreturn(Val_unit);
}
