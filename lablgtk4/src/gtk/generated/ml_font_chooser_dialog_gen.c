/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooserDialog */

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

/* Type-specific conversion macros for GtkFontChooserDialog */
#ifndef Val_GtkFontChooserDialog
#define GtkFontChooserDialog_val(val) ((GtkFontChooserDialog*)ext_of_val(val))
#define Val_GtkFontChooserDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontChooserDialog */


CAMLexport CAMLprim value ml_gtk_font_chooser_dialog_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkFontChooserDialog *obj = gtk_font_chooser_dialog_new(String_option_val(arg1), Option_val(arg2, GtkWindow_val, NULL));
CAMLreturn(Val_GtkFontChooserDialog(obj));
}
