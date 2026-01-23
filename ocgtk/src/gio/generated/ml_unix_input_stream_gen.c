/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixInputStream */

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


CAMLexport CAMLprim value ml_g_unix_input_stream_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

GUnixInputStream *obj = g_unix_input_stream_new(Int_val(arg1), Bool_val(arg2));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GUnixInputStream(obj));
}
CAMLexport CAMLprim value ml_g_unix_input_stream_set_close_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_unix_input_stream_set_close_fd(GUnixInputStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_unix_input_stream_get_fd(value self)
{
CAMLparam1(self);

gint result = g_unix_input_stream_get_fd(GUnixInputStream_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_unix_input_stream_get_close_fd(value self)
{
CAMLparam1(self);

gboolean result = g_unix_input_stream_get_close_fd(GUnixInputStream_val(self));
CAMLreturn(Val_bool(result));
}
