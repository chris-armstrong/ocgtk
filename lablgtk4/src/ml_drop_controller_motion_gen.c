/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropControllerMotion */

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

/* Type-specific conversion macros for GtkDropControllerMotion */
#ifndef Val_GtkDropControllerMotion
#define GtkDropControllerMotion_val(val) ((GtkDropControllerMotion*)ext_of_val(val))
#define Val_GtkDropControllerMotion(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDropControllerMotion */


CAMLexport CAMLprim value ml_gtk_drop_controller_motion_new(value unit)
{
CAMLparam1(unit);
GtkDropControllerMotion *obj = gtk_drop_controller_motion_new();
CAMLreturn(Val_GtkDropControllerMotion(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_controller_motion_is_pointer(value self)
{
CAMLparam1(self);

gboolean result = gtk_drop_controller_motion_is_pointer(GtkDropControllerMotion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_drop_controller_motion_contains_pointer(value self)
{
CAMLparam1(self);

gboolean result = gtk_drop_controller_motion_contains_pointer(GtkDropControllerMotion_val(self));
CAMLreturn(Val_bool(result));
}
