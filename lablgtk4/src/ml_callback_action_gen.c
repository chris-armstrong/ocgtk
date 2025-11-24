/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CallbackAction */

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

/* Type-specific conversion macros for GtkCallbackAction */
#define GtkCallbackAction_val(val) ((GtkCallbackAction*)ext_of_val(val))
#define Val_GtkCallbackAction(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_callback_action_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCallbackAction *obj = gtk_callback_action_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkCallbackAction(obj));
}
