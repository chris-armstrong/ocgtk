/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SimpleAction */

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

/* Type-specific conversion macros for GSimpleAction */
#ifndef Val_GSimpleAction
#define GSimpleAction_val(val) ((GSimpleAction*)ext_of_val(val))
#define Val_GSimpleAction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSimpleAction */


CAMLexport CAMLprim value ml_g_simple_action_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GSimpleAction *obj = g_simple_action_new(String_val(arg1), arg2);
CAMLreturn(Val_GSimpleAction(obj));
}

CAMLexport CAMLprim value ml_g_simple_action_new_stateful(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GSimpleAction *obj = g_simple_action_new_stateful(String_val(arg1), arg2, arg3);
CAMLreturn(Val_GSimpleAction(obj));
}

CAMLexport CAMLprim value ml_g_simple_action_set_enabled(value self, value arg1)
{
CAMLparam2(self, arg1);

g_simple_action_set_enabled(GSimpleAction_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_simple_action_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSimpleAction *obj = (GSimpleAction *)GSimpleAction_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_simple_action_get_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
