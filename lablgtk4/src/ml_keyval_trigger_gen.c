/* GENERATED CODE - DO NOT EDIT */
/* C bindings for KeyvalTrigger */

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

/* Type-specific conversion macros for GtkKeyvalTrigger */
#define GtkKeyvalTrigger_val(val) ((GtkKeyvalTrigger*)ext_of_val(val))
#define Val_GtkKeyvalTrigger(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_keyval_trigger_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkKeyvalTrigger *obj = gtk_keyval_trigger_new(Int_val(arg1), GdkModifierType_val(arg2));
CAMLreturn(Val_GtkKeyvalTrigger(obj));
}

CAMLexport CAMLprim value ml_gtk_keyval_trigger_get_modifiers(value self)
{
CAMLparam1(self);


    GdkModifierType result = gtk_keyval_trigger_get_modifiers(GtkKeyvalTrigger_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_keyval_trigger_get_keyval(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkKeyvalTrigger *obj = (GtkKeyvalTrigger *)GtkKeyvalTrigger_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "keyval", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
