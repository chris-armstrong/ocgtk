/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StackSwitcher */

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

/* Type-specific conversion macros for GtkStackSwitcher */
#ifndef Val_GtkStackSwitcher
#define GtkStackSwitcher_val(val) ((GtkStackSwitcher*)ext_of_val(val))
#define Val_GtkStackSwitcher(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStackSwitcher */


CAMLexport CAMLprim value ml_gtk_stack_switcher_new(value unit)
{
CAMLparam1(unit);
GtkStackSwitcher *obj = gtk_stack_switcher_new();
CAMLreturn(Val_GtkStackSwitcher(obj));
}

CAMLexport CAMLprim value ml_gtk_stack_switcher_set_stack(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_stack_switcher_set_stack(GtkStackSwitcher_val(self), Option_val(arg1, GtkStack_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_switcher_get_stack(value self)
{
CAMLparam1(self);

GtkStack* result = gtk_stack_switcher_get_stack(GtkStackSwitcher_val(self));
CAMLreturn(Val_option(result, Val_GtkStack));
}
