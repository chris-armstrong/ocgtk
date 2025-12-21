/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FilterOutputStream */

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

/* Type-specific conversion macros for GFilterOutputStream */
#ifndef Val_GFilterOutputStream
#define GFilterOutputStream_val(val) ((GFilterOutputStream*)ext_of_val(val))
#define Val_GFilterOutputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GFilterOutputStream */


CAMLexport CAMLprim value ml_g_filter_output_stream_set_close_base_stream(value self, value arg1)
{
CAMLparam2(self, arg1);

g_filter_output_stream_set_close_base_stream(GFilterOutputStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_filter_output_stream_get_close_base_stream(value self)
{
CAMLparam1(self);

gboolean result = g_filter_output_stream_get_close_base_stream(GFilterOutputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_filter_output_stream_get_base_stream(value self)
{
CAMLparam1(self);

GOutputStream* result = g_filter_output_stream_get_base_stream(GFilterOutputStream_val(self));
CAMLreturn(Val_GOutputStream(result));
}
