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
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_shortcut_trigger_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkShortcutTrigger *obj = gtk_shortcut_trigger_parse_string(String_val(arg1));
CAMLreturn(Val_GtkShortcutTrigger(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_to_string(value self)
{
CAMLparam1(self);

char* result = gtk_shortcut_trigger_to_string(GtkShortcutTrigger_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_hash(value self)
{
CAMLparam1(self);

guint result = gtk_shortcut_trigger_hash(GtkShortcutTrigger_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_shortcut_trigger_equal(GtkShortcutTrigger_val(self), GtkShortcutTrigger_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_compare(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_shortcut_trigger_compare(GtkShortcutTrigger_val(self), GtkShortcutTrigger_val(arg1));
CAMLreturn(Val_int(result));
}
