/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MnemonicTrigger */

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

/* Type-specific conversion macros for GtkMnemonicTrigger */
#ifndef Val_GtkMnemonicTrigger
#define GtkMnemonicTrigger_val(val) ((GtkMnemonicTrigger*)ext_of_val(val))
#define Val_GtkMnemonicTrigger(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMnemonicTrigger */


CAMLexport CAMLprim value ml_gtk_mnemonic_trigger_new(value arg1)
{
CAMLparam1(arg1);
GtkMnemonicTrigger *obj = gtk_mnemonic_trigger_new(Int_val(arg1));
CAMLreturn(Val_GtkMnemonicTrigger(obj));
}

CAMLexport CAMLprim value ml_gtk_mnemonic_trigger_get_keyval(value self)
{
CAMLparam1(self);

guint result = gtk_mnemonic_trigger_get_keyval(GtkMnemonicTrigger_val(self));
CAMLreturn(Val_int(result));
}
