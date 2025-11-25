/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SliceListModel */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

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
