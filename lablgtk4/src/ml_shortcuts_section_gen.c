/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutsSection */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkShortcutsSection */
#ifndef Val_GtkShortcutsSection
#define GtkShortcutsSection_val(val) ((GtkShortcutsSection*)ext_of_val(val))
#define Val_GtkShortcutsSection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutsSection */


CAMLexport CAMLprim value ml_gtk_shortcuts_section_add_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcuts_section_add_group(GtkShortcutsSection_val(self), GtkShortcutsGroup_val(arg1));
CAMLreturn(Val_unit);
}
