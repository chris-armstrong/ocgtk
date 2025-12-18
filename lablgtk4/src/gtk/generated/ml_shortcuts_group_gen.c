/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutsGroup */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkShortcutsGroup */
#ifndef Val_GtkShortcutsGroup
#define GtkShortcutsGroup_val(val) ((GtkShortcutsGroup*)ext_of_val(val))
#define Val_GtkShortcutsGroup(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutsGroup */


CAMLexport CAMLprim value ml_gtk_shortcuts_group_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcuts_group_add_shortcut(GtkShortcutsGroup_val(self), GtkShortcutsShortcut_val(arg1));
CAMLreturn(Val_unit);
}
