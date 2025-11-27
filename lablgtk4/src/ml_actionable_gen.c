/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Actionable */

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

/* Type-specific conversion macros for GtkActionable */
#ifndef Val_GtkActionable
#define GtkActionable_val(val) ((GtkActionable*)ext_of_val(val))
#define Val_GtkActionable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkActionable */


CAMLexport CAMLprim value ml_gtk_actionable_set_detailed_action_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_actionable_set_detailed_action_name(GtkActionable_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_actionable_get_action_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
gchar* *obj = (gchar* *)GtkActionable_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "action-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_actionable_set_action_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkActionable *obj = (GtkActionable *)GtkActionable_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
g_object_set(G_OBJECT(obj), "action-name", c_value, NULL);
CAMLreturn(Val_unit);
}
