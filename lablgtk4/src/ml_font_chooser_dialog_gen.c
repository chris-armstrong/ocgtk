/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooserDialog */

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

/* Type-specific conversion macros for GtkFontChooserDialog */
#define GtkFontChooserDialog_val(val) ((GtkFontChooserDialog*)ext_of_val(val))
#define Val_GtkFontChooserDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_font_chooser_dialog_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkFontChooserDialog *obj = gtk_font_chooser_dialog_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkFontChooserDialog(obj));
}
