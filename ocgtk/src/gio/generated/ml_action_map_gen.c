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


CAMLexport CAMLprim value ml_g_action_map_remove_action_entries(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
    int arg1_length = Wosize_val(arg1);
    GActionEntry* c_arg1 = (GActionEntry*)g_malloc(sizeof(GActionEntry) * arg1_length);
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = *GActionEntry_val(Field(arg1, i));
    }

g_action_map_remove_action_entries(GActionMap_val(self), c_arg1, Int_val(arg2));
    g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_action_map_remove_action(value self, value arg1)
{
CAMLparam2(self, arg1);

g_action_map_remove_action(GActionMap_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_action_map_lookup_action(value self, value arg1)
{
CAMLparam2(self, arg1);

GAction* result = g_action_map_lookup_action(GActionMap_val(self), String_val(arg1));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GAction));
}

CAMLexport CAMLprim value ml_g_action_map_add_action(value self, value arg1)
{
CAMLparam2(self, arg1);

g_action_map_add_action(GActionMap_val(self), GAction_val(arg1));
CAMLreturn(Val_unit);
}
