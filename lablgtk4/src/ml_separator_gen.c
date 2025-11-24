/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Separator */

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


CAMLexport CAMLprim value ml_gtk_separator_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_separator_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}
