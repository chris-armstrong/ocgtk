/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridLayoutChild */

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

/* Type-specific conversion macros for GtkGridLayoutChild */
#define GtkGridLayoutChild_val(val) ((GtkGridLayoutChild*)ext_of_val(val))
#define Val_GtkGridLayoutChild(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column_span(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "column-span", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column_span(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "column-span", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "row", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "row", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row_span(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "row-span", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row_span(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayoutChild *obj = (GtkGridLayoutChild *)GtkGridLayoutChild_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "row-span", c_value, NULL);
CAMLreturn(Val_unit);
}
