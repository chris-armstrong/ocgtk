/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutTrigger */

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


CAMLexport CAMLprim value ml_gtk_shortcut_trigger_parse_string(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_shortcut_trigger_parse_string(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_trigger(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GdkKeyMatch result = gtk_shortcut_trigger_trigger(GtkWidget_val(self), GdkEvent_val(arg1), Bool_val(arg2));
CAMLreturn(Val_GdkKeyMatch(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_print_label(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_shortcut_trigger_print_label(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_print(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_trigger_print(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_hash(value self)
{
CAMLparam1(self);


    guint result = gtk_shortcut_trigger_hash(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_equal(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_shortcut_trigger_equal(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_trigger_compare(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_shortcut_trigger_compare(GtkWidget_val(self), arg1);
CAMLreturn(Val_int(result));
}
