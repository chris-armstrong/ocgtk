/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeIter */

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

/* Type-specific conversion macros for GtkTreeIter */
#ifndef Val_GtkTreeIter
#define GtkTreeIter_val(val) ((GtkTreeIter*)ext_of_val(val))
#define Val_GtkTreeIter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeIter */


CAMLexport CAMLprim value ml_gtk_tree_iter_free(value self)
{
CAMLparam1(self);

gtk_tree_iter_free(GtkTreeIter_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_iter_copy(value self)
{
CAMLparam1(self);

GtkTreeIter* result = gtk_tree_iter_copy(GtkTreeIter_val(self));
CAMLreturn(Val_GtkTreeIter(result));
}
