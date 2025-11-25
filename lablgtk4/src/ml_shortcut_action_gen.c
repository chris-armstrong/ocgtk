/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutAction */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkShortcutAction */
#ifndef Val_GtkShortcutAction
#define GtkShortcutAction_val(val) ((GtkShortcutAction*)ext_of_val(val))
#define Val_GtkShortcutAction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutAction */


CAMLexport CAMLprim value ml_gtk_shortcut_action_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkShortcutAction *obj = gtk_shortcut_action_parse_string(String_val(arg1));
CAMLreturn(Val_GtkShortcutAction(obj));
}
