/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixOutputStream */

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

/* Type-specific conversion macros for GUnixOutputStream */
#ifndef Val_GUnixOutputStream
#define GUnixOutputStream_val(val) ((GUnixOutputStream*)ext_of_val(val))
#define Val_GUnixOutputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GUnixOutputStream */


CAMLexport CAMLprim value ml_g_unix_output_stream_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GUnixOutputStream *obj = g_unix_output_stream_new(Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_GUnixOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_unix_output_stream_set_close_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_unix_output_stream_set_close_fd(GUnixOutputStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_unix_output_stream_get_fd(value self)
{
CAMLparam1(self);

gint result = g_unix_output_stream_get_fd(GUnixOutputStream_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_unix_output_stream_get_close_fd(value self)
{
CAMLparam1(self);

gboolean result = g_unix_output_stream_get_close_fd(GUnixOutputStream_val(self));
CAMLreturn(Val_bool(result));
}
