/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SliceListModel */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSliceListModel */
#ifndef Val_GtkSliceListModel
#define GtkSliceListModel_val(val) ((GtkSliceListModel*)ext_of_val(val))
#define Val_GtkSliceListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSliceListModel */


CAMLexport CAMLprim value ml_gtk_slice_list_model_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkSliceListModel *obj = gtk_slice_list_model_new(arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkSliceListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_set_size(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_slice_list_model_set_size(GtkSliceListModel_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_set_offset(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_slice_list_model_set_offset(GtkSliceListModel_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_size(value self)
{
CAMLparam1(self);

guint result = gtk_slice_list_model_get_size(GtkSliceListModel_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_offset(value self)
{
CAMLparam1(self);

guint result = gtk_slice_list_model_get_offset(GtkSliceListModel_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_slice_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSliceListModel *obj = (GtkSliceListModel *)GtkSliceListModel_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_slice_list_model_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
