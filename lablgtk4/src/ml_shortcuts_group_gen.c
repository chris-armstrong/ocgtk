/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutsGroup */

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

/* Type-specific conversion macros for GtkShortcutsGroup */
#define GtkShortcutsGroup_val(val) ((GtkShortcutsGroup*)ext_of_val(val))
#define Val_GtkShortcutsGroup(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_shortcuts_group_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcuts_group_add_shortcut(GtkShortcutsGroup_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcuts_group_get_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutsGroup *obj = (GtkShortcutsGroup *)GtkShortcutsGroup_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcuts_group_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutsGroup *obj = (GtkShortcutsGroup *)GtkShortcutsGroup_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcuts_group_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkShortcutsGroup *obj = (GtkShortcutsGroup *)GtkShortcutsGroup_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcuts_group_get_view(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutsGroup *obj = (GtkShortcutsGroup *)GtkShortcutsGroup_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "view", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcuts_group_set_view(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkShortcutsGroup *obj = (GtkShortcutsGroup *)GtkShortcutsGroup_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "view", c_value, NULL);
CAMLreturn(Val_unit);
}
