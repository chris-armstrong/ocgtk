/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AlternativeTrigger */

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


CAMLexport CAMLprim value ml_gtk_alternative_trigger_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_alternative_trigger_new(GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_alternative_trigger_get_second(value self)
{
CAMLparam1(self);


    GtkShortcutTrigger* result = gtk_alternative_trigger_get_second(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_alternative_trigger_get_first(value self)
{
CAMLparam1(self);


    GtkShortcutTrigger* result = gtk_alternative_trigger_get_first(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
