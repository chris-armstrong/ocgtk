/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooser */

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

/* Type-specific conversion macros for GtkColorChooser */
#ifndef Val_GtkColorChooser
#define GtkColorChooser_val(val) ((GtkColorChooser*)ext_of_val(val))
#define Val_GtkColorChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColorChooser */


CAMLexport CAMLprim value ml_gtk_color_chooser_set_use_alpha(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_chooser_set_use_alpha(GtkColorChooser_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_get_use_alpha(value self)
{
CAMLparam1(self);

gboolean result = gtk_color_chooser_get_use_alpha(GtkColorChooser_val(self));
CAMLreturn(Val_bool(result));
}
