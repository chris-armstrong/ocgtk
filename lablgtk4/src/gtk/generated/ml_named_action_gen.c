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
CAMLlocal1(result);
GtkNamedAction *obj = (GtkNamedAction *)GtkNamedAction_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "action-name");
if (pspec == NULL) caml_failwith("ml_gtk_named_action_get_action_name: property 'action-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "action-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
