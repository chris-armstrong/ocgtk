/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionGroup */

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

/* Type-specific conversion macros for GActionGroup */
#ifndef Val_GActionGroup
#define GActionGroup_val(val) ((GActionGroup*)ext_of_val(val))
#define Val_GActionGroup(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GActionGroup */


CAMLexport CAMLprim value ml_g_action_group_has_action(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_action_group_has_action(GActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_action_group_get_action_enabled(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_action_group_get_action_enabled(GActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_action_group_action_removed(value self, value arg1)
{
CAMLparam2(self, arg1);

g_action_group_action_removed(GActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_action_group_action_enabled_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_action_group_action_enabled_changed(GActionGroup_val(self), String_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_action_group_action_added(value self, value arg1)
{
CAMLparam2(self, arg1);

g_action_group_action_added(GActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
