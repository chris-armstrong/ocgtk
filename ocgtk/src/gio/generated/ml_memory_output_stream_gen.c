/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MemoryOutputStream */

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


CAMLexport CAMLprim value ml_g_memory_output_stream_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GMemoryOutputStream *obj = g_memory_output_stream_new(arg1, arg2, arg3, arg4);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GMemoryOutputStream(obj));
}

CAMLexport CAMLprim value ml_g_memory_output_stream_new_resizable(value unit)
{
CAMLparam1(unit);
GMemoryOutputStream *obj = g_memory_output_stream_new_resizable();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GMemoryOutputStream(obj));
}
