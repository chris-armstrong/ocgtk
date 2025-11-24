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


CAMLexport CAMLprim value ml_gtk_font_chooser_widget_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_font_chooser_widget_new();
CAMLreturn(Val_GtkWidget(widget));
}
