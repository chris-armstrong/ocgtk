/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SignalAction */

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


CAMLexport CAMLprim value ml_gtk_signal_action_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_signal_action_new(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_signal_action_get_signal_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "signal-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}
