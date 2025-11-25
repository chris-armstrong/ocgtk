/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooserWidget */

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

/* Type-specific conversion macros for GtkColorChooserWidget */
#ifndef Val_GtkColorChooserWidget
#define GtkColorChooserWidget_val(val) ((GtkColorChooserWidget*)ext_of_val(val))
#define Val_GtkColorChooserWidget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColorChooserWidget */


CAMLexport CAMLprim value ml_gtk_color_chooser_widget_new(value unit)
{
CAMLparam1(unit);
GtkColorChooserWidget *obj = gtk_color_chooser_widget_new();
CAMLreturn(Val_GtkColorChooserWidget(obj));
}
