/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NamedAction */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkNamedAction */
#ifndef Val_GtkNamedAction
#define GtkNamedAction_val(val) ((GtkNamedAction*)ext_of_val(val))
#define Val_GtkNamedAction(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkNamedAction */


CAMLexport CAMLprim value ml_gtk_named_action_new(value arg1)
{
CAMLparam1(arg1);
GtkNamedAction *obj = gtk_named_action_new(String_val(arg1));
CAMLreturn(Val_GtkNamedAction(obj));
}

CAMLexport CAMLprim value ml_gtk_named_action_get_action_name(value self)
{
CAMLparam1(self);

const char* result = gtk_named_action_get_action_name(GtkNamedAction_val(self));
CAMLreturn(caml_copy_string(result));
}
