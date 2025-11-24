/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MultiSorter */

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


CAMLexport CAMLprim value ml_gtk_multi_sorter_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_multi_sorter_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_multi_sorter_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_multi_sorter_remove(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_multi_sorter_append(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_multi_sorter_append(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_multi_sorter_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
