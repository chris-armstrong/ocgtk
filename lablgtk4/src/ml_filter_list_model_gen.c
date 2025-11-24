/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FilterListModel */

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

/* Type-specific conversion macros for GtkFilterListModel */
#define GtkFilterListModel_val(val) ((GtkFilterListModel*)ext_of_val(val))
#define Val_GtkFilterListModel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_filter_list_model_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkFilterListModel *obj = gtk_filter_list_model_new(arg1, (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkFilterListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_list_model_set_filter(GtkFilterListModel_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_filter(value self)
{
CAMLparam1(self);

GtkFilter* result = gtk_filter_list_model_get_filter(GtkFilterListModel_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_incremental(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFilterListModel *obj = (GtkFilterListModel *)GtkFilterListModel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "incremental", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_incremental(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFilterListModel *obj = (GtkFilterListModel *)GtkFilterListModel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "incremental", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFilterListModel *obj = (GtkFilterListModel *)GtkFilterListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_pending(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFilterListModel *obj = (GtkFilterListModel *)GtkFilterListModel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "pending", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
