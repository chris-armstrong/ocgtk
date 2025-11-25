/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooserWidget */

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

/* Type-specific conversion macros for GtkFontChooserWidget */
#ifndef Val_GtkFontChooserWidget
#define GtkFontChooserWidget_val(val) ((GtkFontChooserWidget*)ext_of_val(val))
#define Val_GtkFontChooserWidget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontChooserWidget */


CAMLexport CAMLprim value ml_gtk_font_chooser_widget_new(value unit)
{
CAMLparam1(unit);
GtkFontChooserWidget *obj = gtk_font_chooser_widget_new();
CAMLreturn(Val_GtkFontChooserWidget(obj));
}
