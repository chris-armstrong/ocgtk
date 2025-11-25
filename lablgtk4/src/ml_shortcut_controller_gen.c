/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutController */

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

/* Type-specific conversion macros for GtkShortcutController */
#ifndef Val_GtkShortcutController
#define GtkShortcutController_val(val) ((GtkShortcutController*)ext_of_val(val))
#define Val_GtkShortcutController(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutController */


CAMLexport CAMLprim value ml_gtk_shortcut_controller_new(value unit)
{
CAMLparam1(unit);
GtkShortcutController *obj = gtk_shortcut_controller_new();
CAMLreturn(Val_GtkShortcutController(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_new_for_model(value arg1)
{
CAMLparam1(arg1);
GtkShortcutController *obj = gtk_shortcut_controller_new_for_model(arg1);
CAMLreturn(Val_GtkShortcutController(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_scope(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_set_scope(GtkShortcutController_val(self), GtkShortcutScope_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_mnemonics_modifiers(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_set_mnemonics_modifiers(GtkShortcutController_val(self), GdkModifierType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_remove_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_remove_shortcut(GtkShortcutController_val(self), GtkShortcut_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_scope(value self)
{
CAMLparam1(self);

GtkShortcutScope result = gtk_shortcut_controller_get_scope(GtkShortcutController_val(self));
CAMLreturn(Val_GtkShortcutScope(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_mnemonics_modifiers(value self)
{
CAMLparam1(self);

GdkModifierType result = gtk_shortcut_controller_get_mnemonics_modifiers(GtkShortcutController_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_add_shortcut(GtkShortcutController_val(self), GtkShortcut_val(arg1));
CAMLreturn(Val_unit);
}
