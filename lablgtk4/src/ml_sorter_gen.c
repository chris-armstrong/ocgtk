/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Sorter */

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


CAMLexport CAMLprim value ml_gtk_sorter_get_order(value self)
{
CAMLparam1(self);


    GtkSorterOrder result = gtk_sorter_get_order(GtkWidget_val(self));
CAMLreturn(Val_GtkSorterOrder(result));
}

CAMLexport CAMLprim value ml_gtk_sorter_compare(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkOrdering result = gtk_sorter_compare(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_GtkOrdering(result));
}

CAMLexport CAMLprim value ml_gtk_sorter_changed(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_sorter_changed(GtkWidget_val(self), GtkSorterChange_val(arg1));
CAMLreturn(Val_unit);
}
