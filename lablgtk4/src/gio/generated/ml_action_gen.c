/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Action */

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

/* Type-specific conversion macros for GAction */
#ifndef Val_GAction
#define GAction_val(val) ((GAction*)ext_of_val(val))
#define Val_GAction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GAction */


CAMLexport CAMLprim value ml_g_action_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_action_get_name(GAction_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_action_get_enabled(value self)
{
CAMLparam1(self);

gboolean result = g_action_get_enabled(GAction_val(self));
CAMLreturn(Val_bool(result));
}
