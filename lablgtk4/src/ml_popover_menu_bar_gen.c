/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PopoverMenuBar */

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


CAMLexport CAMLprim value ml_gtk_popover_menu_bar_new_from_model(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_popover_menu_bar_new_from_model(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_bar_set_menu_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_popover_menu_bar_set_menu_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_popover_menu_bar_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_popover_menu_bar_remove_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_bar_add_child(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_popover_menu_bar_add_child(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}
