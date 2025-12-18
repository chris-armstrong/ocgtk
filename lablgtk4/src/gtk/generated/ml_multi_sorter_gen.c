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

CAMLexport CAMLprim value ml_gtk_multi_sorter_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMultiSorter *obj = (GtkMultiSorter *)GtkMultiSorter_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_multi_sorter_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
