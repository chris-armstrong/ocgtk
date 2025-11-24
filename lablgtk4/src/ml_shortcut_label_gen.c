/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutLabel */

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

/* Type-specific conversion macros for GtkShortcutLabel */
#define GtkShortcutLabel_val(val) ((GtkShortcutLabel*)ext_of_val(val))
#define Val_GtkShortcutLabel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_shortcut_label_new(value arg1)
{
CAMLparam1(arg1);
GtkShortcutLabel *obj = gtk_shortcut_label_new(String_val(arg1));
CAMLreturn(Val_GtkShortcutLabel(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_get_accelerator(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "accelerator", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_set_accelerator(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "accelerator", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_get_disabled_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "disabled-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_set_disabled_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "disabled-text", c_value, NULL);
CAMLreturn(Val_unit);
}
