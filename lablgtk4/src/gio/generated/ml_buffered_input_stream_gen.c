/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BufferedInputStream */

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

/* Type-specific conversion macros for GBufferedInputStream */
#ifndef Val_GBufferedInputStream
#define GBufferedInputStream_val(val) ((GBufferedInputStream*)ext_of_val(val))
#define Val_GBufferedInputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GBufferedInputStream */


CAMLexport CAMLprim value ml_g_buffered_input_stream_new(value arg1)
{
CAMLparam1(arg1);
GBufferedInputStream *obj = g_buffered_input_stream_new(GInputStream_val(arg1));
CAMLreturn(Val_GBufferedInputStream(obj));
}

CAMLexport CAMLprim value ml_g_buffered_input_stream_new_sized(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GBufferedInputStream *obj = g_buffered_input_stream_new_sized(GInputStream_val(arg1), arg2);
CAMLreturn(Val_GBufferedInputStream(obj));
}

CAMLexport CAMLprim value ml_g_buffered_input_stream_read_byte(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

int result = g_buffered_input_stream_read_byte(GBufferedInputStream_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
