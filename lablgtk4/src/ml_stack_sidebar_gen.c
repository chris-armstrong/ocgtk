/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StackSidebar */

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

/* Type-specific conversion macros for GtkStackSidebar */
#ifndef Val_GtkStackSidebar
#define GtkStackSidebar_val(val) ((GtkStackSidebar*)ext_of_val(val))
#define Val_GtkStackSidebar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStackSidebar */


CAMLexport CAMLprim value ml_gtk_stack_sidebar_new(value unit)
{
CAMLparam1(unit);
GtkStackSidebar *obj = gtk_stack_sidebar_new();
CAMLreturn(Val_GtkStackSidebar(obj));
}

CAMLexport CAMLprim value ml_gtk_stack_sidebar_set_stack(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_stack_sidebar_set_stack(GtkStackSidebar_val(self), GtkStack_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_sidebar_get_stack(value self)
{
CAMLparam1(self);

GtkStack* result = gtk_stack_sidebar_get_stack(GtkStackSidebar_val(self));
CAMLreturn(Val_option(result, Val_GtkStack));
}
