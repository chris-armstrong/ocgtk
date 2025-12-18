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
#include "ml_gobject.h"

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
CAMLlocal1(result);
GtkMnemonicTrigger *obj = (GtkMnemonicTrigger *)GtkMnemonicTrigger_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "keyval");
if (pspec == NULL) caml_failwith("ml_gtk_mnemonic_trigger_get_keyval: property 'keyval' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "keyval", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
