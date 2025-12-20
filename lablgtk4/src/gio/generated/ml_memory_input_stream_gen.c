/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MemoryInputStream */

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

/* Type-specific conversion macros for GMemoryInputStream */
#ifndef Val_GMemoryInputStream
#define GMemoryInputStream_val(val) ((GMemoryInputStream*)ext_of_val(val))
#define Val_GMemoryInputStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GMemoryInputStream */


CAMLexport CAMLprim value ml_g_memory_input_stream_new(value unit)
{
CAMLparam1(unit);
GMemoryInputStream *obj = g_memory_input_stream_new();
CAMLreturn(Val_GMemoryInputStream(obj));
}

CAMLexport CAMLprim value ml_g_memory_input_stream_new_from_bytes(value arg1)
{
CAMLparam1(arg1);
GMemoryInputStream *obj = g_memory_input_stream_new_from_bytes(arg1);
CAMLreturn(Val_GMemoryInputStream(obj));
}

CAMLexport CAMLprim value ml_g_memory_input_stream_new_from_data(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GMemoryInputStream *obj = g_memory_input_stream_new_from_data(arg1, arg2, arg3);
CAMLreturn(Val_GMemoryInputStream(obj));
}
