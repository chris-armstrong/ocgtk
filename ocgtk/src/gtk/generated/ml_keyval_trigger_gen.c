/* GENERATED CODE - DO NOT EDIT */
/* C bindings for KeyvalTrigger */

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


CAMLexport CAMLprim value ml_gtk_keyval_trigger_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkKeyvalTrigger *obj = gtk_keyval_trigger_new(Int_val(arg1), GtkModifierType_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkKeyvalTrigger(obj));
}

CAMLexport CAMLprim value ml_gtk_keyval_trigger_get_keyval(value self)
{
CAMLparam1(self);

guint result = gtk_keyval_trigger_get_keyval(GtkKeyvalTrigger_val(self));
CAMLreturn(Val_int(result));
}
