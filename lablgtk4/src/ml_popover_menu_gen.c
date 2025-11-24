/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PopoverMenu */

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

/* Type-specific conversion macros for GtkPopoverMenu */
#define GtkPopoverMenu_val(val) ((GtkPopoverMenu*)ext_of_val(val))
#define Val_GtkPopoverMenu(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_popover_menu_new_from_model(value arg1)
{
CAMLparam1(arg1);
GtkPopoverMenu *obj = gtk_popover_menu_new_from_model(arg1);
CAMLreturn(Val_GtkPopoverMenu(obj));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_new_from_model_full(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkPopoverMenu *obj = gtk_popover_menu_new_from_model_full(arg1, GtkPopoverMenuFlags_val(arg2));
CAMLreturn(Val_GtkPopoverMenu(obj));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_popover_menu_set_flags(GtkPopoverMenu_val(self), GtkPopoverMenuFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_popover_menu_remove_child(GtkPopoverMenu_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_get_flags(value self)
{
CAMLparam1(self);


    GtkPopoverMenuFlags result = gtk_popover_menu_get_flags(GtkPopoverMenu_val(self));
CAMLreturn(Val_GtkPopoverMenuFlags(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_add_child(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_popover_menu_add_child(GtkPopoverMenu_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_get_visible_submenu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPopoverMenu *obj = (GtkPopoverMenu *)GtkPopoverMenu_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "visible-submenu", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_set_visible_submenu(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPopoverMenu *obj = (GtkPopoverMenu *)GtkPopoverMenu_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "visible-submenu", c_value, NULL);
CAMLreturn(Val_unit);
}
