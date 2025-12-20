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
#include "converters.h"

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

CAMLexport CAMLprim value ml_gtk_actionable_set_action_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_actionable_set_action_name(GtkActionable_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_actionable_get_action_name(value self)
{
CAMLparam1(self);

const char* result = gtk_actionable_get_action_name(GtkActionable_val(self));
CAMLreturn(Val_option_string(result));
}
