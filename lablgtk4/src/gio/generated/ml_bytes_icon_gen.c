/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BytesIcon */

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

/* Type-specific conversion macros for GBytesIcon */
#ifndef Val_GBytesIcon
#define GBytesIcon_val(val) ((GBytesIcon*)ext_of_val(val))
#define Val_GBytesIcon(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GBytesIcon */


CAMLexport CAMLprim value ml_g_bytes_icon_new(value arg1)
{
CAMLparam1(arg1);
GBytesIcon *obj = g_bytes_icon_new(arg1);
CAMLreturn(Val_GBytesIcon(obj));
}
