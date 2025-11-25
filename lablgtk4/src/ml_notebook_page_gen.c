/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NotebookPage */

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

/* Type-specific conversion macros for GtkNotebookPage */
#ifndef Val_GtkNotebookPage
#define GtkNotebookPage_val(val) ((GtkNotebookPage*)ext_of_val(val))
#define Val_GtkNotebookPage(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkNotebookPage */


CAMLexport CAMLprim value ml_gtk_notebook_page_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_notebook_page_get_child(GtkNotebookPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}
