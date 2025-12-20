/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConverterInputStream */

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

/* Type-specific conversion macros for GConverterInputStream */
#ifndef Val_GConverterInputStream
#define GConverterInputStream_val(val) ((GConverterInputStream*)ext_of_val(val))
#define Val_GConverterInputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GConverterInputStream */


CAMLexport CAMLprim value ml_g_converter_input_stream_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GConverterInputStream *obj = g_converter_input_stream_new(GInputStream_val(arg1), arg2);
CAMLreturn(Val_GConverterInputStream(obj));
}
