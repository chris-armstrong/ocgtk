/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MultiSelection */

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

/* Type-specific conversion macros for GtkMultiSelection */
#ifndef Val_GtkMultiSelection
#define GtkMultiSelection_val(val) ((GtkMultiSelection*)ext_of_val(val))
#define Val_GtkMultiSelection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMultiSelection */


CAMLexport CAMLprim value ml_gtk_multi_selection_new(value arg1)
{
CAMLparam1(arg1);
GtkMultiSelection *obj = gtk_multi_selection_new(arg1);
CAMLreturn(Val_GtkMultiSelection(obj));
}
