/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FilterListModel */

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

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkFilterListModel */
#ifndef Val_GtkFilterListModel
#define GtkFilterListModel_val(val) ((GtkFilterListModel*)ext_of_val(val))
#define Val_GtkFilterListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFilterListModel */


CAMLexport CAMLprim value ml_gtk_filter_list_model_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkFilterListModel *obj = gtk_filter_list_model_new(arg1, Option_val(arg2, GtkFilter_val, NULL));
CAMLreturn(Val_GtkFilterListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_incremental(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_list_model_set_incremental(GtkFilterListModel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_list_model_set_filter(GtkFilterListModel_val(self), Option_val(arg1, GtkFilter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_pending(value self)
{
CAMLparam1(self);

guint result = gtk_filter_list_model_get_pending(GtkFilterListModel_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_incremental(value self)
{
CAMLparam1(self);

gboolean result = gtk_filter_list_model_get_incremental(GtkFilterListModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_filter(value self)
{
CAMLparam1(self);

GtkFilter* result = gtk_filter_list_model_get_filter(GtkFilterListModel_val(self));
CAMLreturn(Val_option(result, Val_GtkFilter));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFilterListModel *obj = (GtkFilterListModel *)GtkFilterListModel_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_filter_list_model_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
