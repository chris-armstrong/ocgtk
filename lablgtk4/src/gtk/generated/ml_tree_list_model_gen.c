/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeListModel */

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

/* Type-specific conversion macros for GtkTreeListModel */
#ifndef Val_GtkTreeListModel
#define GtkTreeListModel_val(val) ((GtkTreeListModel*)ext_of_val(val))
#define Val_GtkTreeListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeListModel */


CAMLexport CAMLprim value ml_gtk_tree_list_model_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GtkTreeListModel *obj = gtk_tree_list_model_new(arg1, Bool_val(arg2), Bool_val(arg3), arg4, arg5, arg6);
CAMLreturn(Val_GtkTreeListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_new_bytecode(value * argv, int argn)
{
return ml_gtk_tree_list_model_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_set_autoexpand(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_list_model_set_autoexpand(GtkTreeListModel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_get_row(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeListRow* result = gtk_tree_list_model_get_row(GtkTreeListModel_val(self), Int_val(arg1));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_get_passthrough(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_list_model_get_passthrough(GtkTreeListModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_get_child_row(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeListRow* result = gtk_tree_list_model_get_child_row(GtkTreeListModel_val(self), Int_val(arg1));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_get_autoexpand(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_list_model_get_autoexpand(GtkTreeListModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_model_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeListModel *obj = (GtkTreeListModel *)GtkTreeListModel_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_tree_list_model_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
