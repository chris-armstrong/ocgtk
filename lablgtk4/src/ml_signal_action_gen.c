/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SignalAction */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSignalAction */
#ifndef Val_GtkSignalAction
#define GtkSignalAction_val(val) ((GtkSignalAction*)ext_of_val(val))
#define Val_GtkSignalAction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSignalAction */


CAMLexport CAMLprim value ml_gtk_signal_action_new(value arg1)
{
CAMLparam1(arg1);
GtkSignalAction *obj = gtk_signal_action_new(String_val(arg1));
CAMLreturn(Val_GtkSignalAction(obj));
}

CAMLexport CAMLprim value ml_gtk_signal_action_get_signal_name(value self)
{
CAMLparam1(self);

const char* result = gtk_signal_action_get_signal_name(GtkSignalAction_val(self));
CAMLreturn(caml_copy_string(result));
}
