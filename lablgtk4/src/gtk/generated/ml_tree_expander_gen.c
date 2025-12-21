/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeExpander */

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

/* Type-specific conversion macros for GtkTreeExpander */
#ifndef Val_GtkTreeExpander
#define GtkTreeExpander_val(val) ((GtkTreeExpander*)ext_of_val(val))
#define Val_GtkTreeExpander(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeExpander */


CAMLexport CAMLprim value ml_gtk_tree_expander_new(value unit)
{
CAMLparam1(unit);
GtkTreeExpander *obj = gtk_tree_expander_new();
CAMLreturn(Val_GtkTreeExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_list_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_list_row(GtkTreeExpander_val(self), Option_val(arg1, GtkTreeListRow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_indent_for_icon(GtkTreeExpander_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_indent_for_depth(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_indent_for_depth(GtkTreeExpander_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_hide_expander(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_hide_expander(GtkTreeExpander_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_expander_set_child(GtkTreeExpander_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_list_row(value self)
{
CAMLparam1(self);

GtkTreeListRow* result = gtk_tree_expander_get_list_row(GtkTreeExpander_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeListRow));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_icon(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_expander_get_indent_for_icon(GtkTreeExpander_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_indent_for_depth(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_expander_get_indent_for_depth(GtkTreeExpander_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_hide_expander(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_expander_get_hide_expander(GtkTreeExpander_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_expander_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_tree_expander_get_child(GtkTreeExpander_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}
