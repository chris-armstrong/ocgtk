/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MultiSorter */

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

/* Type-specific conversion macros for GtkMultiSorter */
#ifndef Val_GtkMultiSorter
#define GtkMultiSorter_val(val) ((GtkMultiSorter*)ext_of_val(val))
#define Val_GtkMultiSorter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMultiSorter */


CAMLexport CAMLprim value ml_gtk_multi_sorter_new(value unit)
{
CAMLparam1(unit);
GtkMultiSorter *obj = gtk_multi_sorter_new();
CAMLreturn(Val_GtkMultiSorter(obj));
}

CAMLexport CAMLprim value ml_gtk_multi_sorter_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_multi_sorter_remove(GtkMultiSorter_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_multi_sorter_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_multi_sorter_append(GtkMultiSorter_val(self), GtkSorter_val(arg1));
CAMLreturn(Val_unit);
}
