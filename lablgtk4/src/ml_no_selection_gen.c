/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NoSelection */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkNoSelection */
#ifndef Val_GtkNoSelection
#define GtkNoSelection_val(val) ((GtkNoSelection*)ext_of_val(val))
#define Val_GtkNoSelection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkNoSelection */


CAMLexport CAMLprim value ml_gtk_no_selection_new(value arg1)
{
CAMLparam1(arg1);
GtkNoSelection *obj = gtk_no_selection_new(arg1);
CAMLreturn(Val_GtkNoSelection(obj));
}
