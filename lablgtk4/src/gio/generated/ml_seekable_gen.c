/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Seekable */

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

/* Type-specific conversion macros for GSeekable */
#ifndef Val_GSeekable
#define GSeekable_val(val) ((GSeekable*)ext_of_val(val))
#define Val_GSeekable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSeekable */


CAMLexport CAMLprim value ml_g_seekable_can_truncate(value self)
{
CAMLparam1(self);

gboolean result = g_seekable_can_truncate(GSeekable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_seekable_can_seek(value self)
{
CAMLparam1(self);

gboolean result = g_seekable_can_seek(GSeekable_val(self));
CAMLreturn(Val_bool(result));
}
