/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FlattenListModel */

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

/* Type-specific conversion macros for GtkFlattenListModel */
#define GtkFlattenListModel_val(val) ((GtkFlattenListModel*)ext_of_val(val))
#define Val_GtkFlattenListModel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_flatten_list_model_new(value arg1)
{
CAMLparam1(arg1);
GtkFlattenListModel *obj = gtk_flatten_list_model_new(arg1);
CAMLreturn(Val_GtkFlattenListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_flatten_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFlattenListModel *obj = (GtkFlattenListModel *)GtkFlattenListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
