/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutAction */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_shortcut_action_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkShortcutAction *obj = gtk_shortcut_action_parse_string(String_val(arg1));
CAMLreturn(Val_GtkShortcutAction(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_action_to_string(value self)
{
CAMLparam1(self);

char* result = gtk_shortcut_action_to_string(GtkShortcutAction_val(self));
CAMLreturn(caml_copy_string(result));
}
