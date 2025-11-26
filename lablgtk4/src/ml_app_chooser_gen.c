/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooser */

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

/* Type-specific conversion macros for GtkAppChooser */
#ifndef Val_GtkAppChooser
#define GtkAppChooser_val(val) ((GtkAppChooser*)ext_of_val(val))
#define Val_GtkAppChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAppChooser */


CAMLexport CAMLprim value ml_gtk_app_chooser_refresh(value self)
{
CAMLparam1(self);

gtk_app_chooser_refresh(GtkAppChooser_val(self));
CAMLreturn(Val_unit);
}
