/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PopoverMenuBar */

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


CAMLexport CAMLprim value ml_gtk_popover_menu_bar_new_from_model(value arg1)
{
CAMLparam1(arg1);
GtkPopoverMenuBar *obj = gtk_popover_menu_bar_new_from_model(arg1);
CAMLreturn(Val_GtkPopoverMenuBar(obj));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_bar_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_popover_menu_bar_remove_child(GtkPopoverMenuBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_popover_menu_bar_add_child(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_popover_menu_bar_add_child(GtkPopoverMenuBar_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}
