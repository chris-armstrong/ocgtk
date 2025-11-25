/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LockButton */

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

/* Type-specific conversion macros for GtkLockButton */
#ifndef Val_GtkLockButton
#define GtkLockButton_val(val) ((GtkLockButton*)ext_of_val(val))
#define Val_GtkLockButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkLockButton */


CAMLexport CAMLprim value ml_gtk_lock_button_new(value arg1)
{
CAMLparam1(arg1);
GtkLockButton *obj = gtk_lock_button_new(arg1);
CAMLreturn(Val_GtkLockButton(obj));
}
