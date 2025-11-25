/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutsWindow */

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

/* Type-specific conversion macros for GtkShortcutsWindow */
#ifndef Val_GtkShortcutsWindow
#define GtkShortcutsWindow_val(val) ((GtkShortcutsWindow*)ext_of_val(val))
#define Val_GtkShortcutsWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutsWindow */


CAMLexport CAMLprim value ml_gtk_shortcuts_window_add_section(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcuts_window_add_section(GtkShortcutsWindow_val(self), GtkShortcutsSection_val(arg1));
CAMLreturn(Val_unit);
}
