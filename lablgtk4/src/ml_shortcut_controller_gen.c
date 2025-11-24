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


CAMLexport CAMLprim value ml_gtk_shortcut_controller_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_shortcut_controller_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_new_for_model(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_shortcut_controller_new_for_model(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_scope(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_controller_set_scope(GtkWidget_val(self), GtkShortcutScope_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_mnemonics_modifiers(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_controller_set_mnemonics_modifiers(GtkWidget_val(self), GdkModifierType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_remove_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_controller_remove_shortcut(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_scope(value self)
{
CAMLparam1(self);


    GtkShortcutScope result = gtk_shortcut_controller_get_scope(GtkWidget_val(self));
CAMLreturn(Val_GtkShortcutScope(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_mnemonics_modifiers(value self)
{
CAMLparam1(self);


    GdkModifierType result = gtk_shortcut_controller_get_mnemonics_modifiers(GtkWidget_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_controller_add_shortcut(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
