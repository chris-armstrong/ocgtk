/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionMap */

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

/* Type-specific conversion macros for GActionMap */
#ifndef Val_GActionMap
#define GActionMap_val(val) ((GActionMap*)ext_of_val(val))
#define Val_GActionMap(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GActionMap */


CAMLexport CAMLprim value ml_g_action_map_remove_action(value self, value arg1)
{
CAMLparam2(self, arg1);

g_action_map_remove_action(GActionMap_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
