/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MnemonicTrigger */

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


CAMLexport CAMLprim value ml_gtk_mnemonic_trigger_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_mnemonic_trigger_new(Int_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_mnemonic_trigger_get_keyval(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "keyval", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
