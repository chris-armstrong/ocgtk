/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Settings */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSettings */
#ifndef Val_GtkSettings
#define GtkSettings_val(val) ((GtkSettings*)ext_of_val(val))
#define Val_GtkSettings(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSettings */


CAMLexport CAMLprim value ml_gtk_settings_reset_property(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_settings_reset_property(GtkSettings_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
