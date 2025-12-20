/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Converter */

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

/* Type-specific conversion macros for GConverter */
#ifndef Val_GConverter
#define GConverter_val(val) ((GConverter*)ext_of_val(val))
#define Val_GConverter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GConverter */


CAMLexport CAMLprim value ml_g_converter_reset(value self)
{
CAMLparam1(self);

g_converter_reset(GConverter_val(self));
CAMLreturn(Val_unit);
}
