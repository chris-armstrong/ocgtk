/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SignalAction */

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
CAMLlocal1(result);
GtkSignalAction *obj = (GtkSignalAction *)GtkSignalAction_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "signal-name");
if (pspec == NULL) caml_failwith("ml_gtk_signal_action_get_signal_name: property 'signal-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "signal-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
