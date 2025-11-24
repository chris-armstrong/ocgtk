/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeExpander */

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

/* Type-specific conversion macros for GtkTreeExpander */
#define GtkTreeExpander_val(val) ((GtkTreeExpander*)ext_of_val(val))
#define Val_GtkTreeExpander(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_tree_expander_new(value unit)
{
CAMLparam1(unit);
GtkTreeExpander *obj = gtk_tree_expander_new();
CAMLreturn(Val_GtkTreeExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_list_row(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_expander_set_list_row(GtkTreeExpander_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_expander_set_child(GtkTreeExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_list_row(value self)
{
CAMLparam1(self);


    GtkTreeListRow* result = gtk_tree_expander_get_list_row(GtkTreeExpander_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_tree_expander_get_child(GtkTreeExpander_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_hide_expander(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "hide-expander", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_hide_expander(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "hide-expander", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_depth(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "indent-for-depth", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_depth(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "indent-for-depth", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "indent-for-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_icon(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTreeExpander *obj = (GtkTreeExpander *)GtkTreeExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "indent-for-icon", c_value, NULL);
CAMLreturn(Val_unit);
}
