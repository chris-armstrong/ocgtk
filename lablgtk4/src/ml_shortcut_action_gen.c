/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutAction */

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


CAMLexport CAMLprim value ml_gtk_shortcut_action_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_shortcut_action_parse_string(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_action_print(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_action_print(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_action_activate(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_shortcut_action_activate(GtkWidget_val(self), GtkShortcutActionFlags_val(arg1), GtkWidget_val(arg2), arg3);
CAMLreturn(Val_bool(result));
}
