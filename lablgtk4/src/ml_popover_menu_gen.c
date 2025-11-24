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


CAMLexport CAMLprim value ml_gtk_popover_menu_new_from_model(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_popover_menu_new_from_model(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_new_from_model_full(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_popover_menu_new_from_model_full(arg1, GtkPopoverMenuFlags_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_set_menu_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_popover_menu_set_menu_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_popover_menu_set_flags(GtkWidget_val(self), GtkPopoverMenuFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_popover_menu_remove_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_get_flags(value self)
{
CAMLparam1(self);


    GtkPopoverMenuFlags result = gtk_popover_menu_get_flags(GtkWidget_val(self));
CAMLreturn(Val_GtkPopoverMenuFlags(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_add_child(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_popover_menu_add_child(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_get_visible_submenu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "visible-submenu", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_set_visible_submenu(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "visible-submenu", c_value, NULL);
CAMLreturn(Val_unit);
}
