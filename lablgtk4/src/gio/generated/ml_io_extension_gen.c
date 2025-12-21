/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOExtension */

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

/* Type-specific conversion macros for GIOExtension */
#ifndef Val_GIOExtension
#define GIOExtension_val(val) ((GIOExtension*)ext_of_val(val))
#define Val_GIOExtension(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GIOExtension */


CAMLexport CAMLprim value ml_g_io_extension_get_priority(value self)
{
CAMLparam1(self);

gint result = g_io_extension_get_priority(GIOExtension_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_io_extension_get_name(value self)
{
CAMLparam1(self);

const char* result = g_io_extension_get_name(GIOExtension_val(self));
CAMLreturn(caml_copy_string(result));
}
