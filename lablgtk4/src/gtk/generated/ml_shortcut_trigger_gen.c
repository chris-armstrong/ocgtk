/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutTrigger */

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

/* Type-specific conversion macros for GtkShortcutTrigger */
#ifndef Val_GtkShortcutTrigger
#define GtkShortcutTrigger_val(val) ((GtkShortcutTrigger*)ext_of_val(val))
#define Val_GtkShortcutTrigger(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutTrigger */


CAMLexport CAMLprim value ml_gtk_shortcut_trigger_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkShortcutTrigger *obj = gtk_shortcut_trigger_parse_string(String_val(arg1));
CAMLreturn(Val_GtkShortcutTrigger(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_trigger(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GdkKeyMatch result = gtk_shortcut_trigger_trigger(GtkShortcutTrigger_val(self), GdkEvent_val(arg1), Bool_val(arg2));
CAMLreturn(Val_GdkKeyMatch(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_hash(value self)
{
CAMLparam1(self);

guint result = gtk_shortcut_trigger_hash(GtkShortcutTrigger_val(self));
CAMLreturn(Val_int(result));
}
