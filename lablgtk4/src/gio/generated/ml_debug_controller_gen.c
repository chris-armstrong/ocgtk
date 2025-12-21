/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DebugController */

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

/* Type-specific conversion macros for GDebugController */
#ifndef Val_GDebugController
#define GDebugController_val(val) ((GDebugController*)ext_of_val(val))
#define Val_GDebugController(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDebugController */


CAMLexport CAMLprim value ml_g_debug_controller_set_debug_enabled(value self, value arg1)
{
CAMLparam2(self, arg1);

g_debug_controller_set_debug_enabled(GDebugController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_debug_controller_get_debug_enabled(value self)
{
CAMLparam1(self);

gboolean result = g_debug_controller_get_debug_enabled(GDebugController_val(self));
CAMLreturn(Val_bool(result));
}
