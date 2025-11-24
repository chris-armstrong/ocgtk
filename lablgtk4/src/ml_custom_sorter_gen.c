/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CustomSorter */

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


CAMLexport CAMLprim value ml_gtk_custom_sorter_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_custom_sorter_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_custom_sorter_set_sort_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_custom_sorter_set_sort_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}
