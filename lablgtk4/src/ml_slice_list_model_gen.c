/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SliceListModel */

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

/* Type-specific conversion macros for GtkSliceListModel */
#define GtkSliceListModel_val(val) ((GtkSliceListModel*)ext_of_val(val))
#define Val_GtkSliceListModel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_slice_list_model_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkSliceListModel *obj = gtk_slice_list_model_new(arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkSliceListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_set_offset(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "offset", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_set_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "size", c_value, NULL);
CAMLreturn(Val_unit);
}
