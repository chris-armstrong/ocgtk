/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MapListModel */

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


CAMLexport CAMLprim value ml_gtk_map_list_model_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkMapListModel *obj = gtk_map_list_model_new(arg1, arg2, arg3, arg4);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMapListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_map_list_model_has_map(value self)
{
CAMLparam1(self);

gboolean result = gtk_map_list_model_has_map(GtkMapListModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_map_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMapListModel *obj = (GtkMapListModel *)GtkMapListModel_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_map_list_model_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
