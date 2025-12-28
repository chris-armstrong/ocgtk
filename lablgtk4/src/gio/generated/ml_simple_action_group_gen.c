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

CAMLexport CAMLprim value ml_g_simple_action_group_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);

GAction* result = g_simple_action_group_lookup(GSimpleActionGroup_val(self), String_val(arg1));
CAMLreturn(Val_GAction(result));
}

CAMLexport CAMLprim value ml_g_simple_action_group_insert(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_action_group_insert(GSimpleActionGroup_val(self), GAction_val(arg1));
CAMLreturn(Val_unit);
}
