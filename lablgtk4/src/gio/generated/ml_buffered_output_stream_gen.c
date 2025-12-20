/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BufferedOutputStream */

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

/* Type-specific conversion macros for GBufferedOutputStream */
#ifndef Val_GBufferedOutputStream
#define GBufferedOutputStream_val(val) ((GBufferedOutputStream*)ext_of_val(val))
#define Val_GBufferedOutputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GBufferedOutputStream */


CAMLexport CAMLprim value ml_g_buffered_output_stream_new(value arg1)
{
CAMLparam1(arg1);
GBufferedOutputStream *obj = g_buffered_output_stream_new(GOutputStream_val(arg1));
CAMLreturn(Val_GBufferedOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_buffered_output_stream_new_sized(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GBufferedOutputStream *obj = g_buffered_output_stream_new_sized(GOutputStream_val(arg1), arg2);
CAMLreturn(Val_GBufferedOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_buffered_output_stream_set_auto_grow(value self, value arg1)
{
CAMLparam2(self, arg1);

g_buffered_output_stream_set_auto_grow(GBufferedOutputStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_buffered_output_stream_get_auto_grow(value self)
{
CAMLparam1(self);

gboolean result = g_buffered_output_stream_get_auto_grow(GBufferedOutputStream_val(self));
CAMLreturn(Val_bool(result));
}
