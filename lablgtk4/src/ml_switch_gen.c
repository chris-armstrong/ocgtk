/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Switch */

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

/* Type-specific conversion macros for GtkSwitch */
#ifndef Val_GtkSwitch
#define GtkSwitch_val(val) ((GtkSwitch*)ext_of_val(val))
#define Val_GtkSwitch(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSwitch */


CAMLexport CAMLprim value ml_gtk_switch_new(value unit)
{
CAMLparam1(unit);
GtkSwitch *obj = gtk_switch_new();
CAMLreturn(Val_GtkSwitch(obj));
}

CAMLexport CAMLprim value ml_gtk_switch_set_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_switch_set_state(GtkSwitch_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_switch_set_active(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_switch_set_active(GtkSwitch_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(self);

gboolean result = gtk_switch_get_state(GtkSwitch_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(self);

gboolean result = gtk_switch_get_active(GtkSwitch_val(self));
CAMLreturn(Val_bool(result));
}
