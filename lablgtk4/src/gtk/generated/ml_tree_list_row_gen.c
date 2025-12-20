/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeListRow */

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

/* Type-specific conversion macros for GtkTreeListRow */
#ifndef Val_GtkTreeListRow
#define GtkTreeListRow_val(val) ((GtkTreeListRow*)ext_of_val(val))
#define Val_GtkTreeListRow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeListRow */


CAMLexport CAMLprim value ml_gtk_tree_list_row_set_expanded(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_list_row_set_expanded(GtkTreeListRow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_is_expandable(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_list_row_is_expandable(GtkTreeListRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_position(value self)
{
CAMLparam1(self);

guint result = gtk_tree_list_row_get_position(GtkTreeListRow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_parent(value self)
{
CAMLparam1(self);

GtkTreeListRow* result = gtk_tree_list_row_get_parent(GtkTreeListRow_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_expanded(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_list_row_get_expanded(GtkTreeListRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_depth(value self)
{
CAMLparam1(self);

guint result = gtk_tree_list_row_get_depth(GtkTreeListRow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_child_row(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkTreeListRow* result = gtk_tree_list_row_get_child_row(GtkTreeListRow_val(self), Int_val(arg1));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_list_row_get_expandable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeListRow *obj = (GtkTreeListRow *)GtkTreeListRow_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "expandable");
if (pspec == NULL) caml_failwith("ml_gtk_tree_list_row_get_expandable: property 'expandable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "expandable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
