/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SimpleActionGroup */

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

/* Type-specific conversion macros for GSimpleActionGroup */
#ifndef Val_GSimpleActionGroup
#define GSimpleActionGroup_val(val) ((GSimpleActionGroup*)ext_of_val(val))
#define Val_GSimpleActionGroup(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSimpleActionGroup */


CAMLexport CAMLprim value ml_g_simple_action_group_new(value unit)
{
CAMLparam1(unit);
GSimpleActionGroup *obj = g_simple_action_group_new();
CAMLreturn(Val_GSimpleActionGroup(obj));
}

CAMLexport CAMLprim value ml_g_simple_action_group_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_action_group_remove(GSimpleActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
