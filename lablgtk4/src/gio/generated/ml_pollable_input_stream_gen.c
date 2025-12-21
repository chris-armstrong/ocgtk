/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PollableInputStream */

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

/* Type-specific conversion macros for GPollableInputStream */
#ifndef Val_GPollableInputStream
#define GPollableInputStream_val(val) ((GPollableInputStream*)ext_of_val(val))
#define Val_GPollableInputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GPollableInputStream */


CAMLexport CAMLprim value ml_g_pollable_input_stream_is_readable(value self)
{
CAMLparam1(self);

gboolean result = g_pollable_input_stream_is_readable(GPollableInputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_pollable_input_stream_can_poll(value self)
{
CAMLparam1(self);

gboolean result = g_pollable_input_stream_can_poll(GPollableInputStream_val(self));
CAMLreturn(Val_bool(result));
}
