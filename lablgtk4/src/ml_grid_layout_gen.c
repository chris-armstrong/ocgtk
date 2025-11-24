/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridLayout */

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

/* Type-specific conversion macros for GtkGridLayout */
#define GtkGridLayout_val(val) ((GtkGridLayout*)ext_of_val(val))
#define Val_GtkGridLayout(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_grid_layout_new(value unit)
{
CAMLparam1(unit);
GtkGridLayout *obj = gtk_grid_layout_new();
CAMLreturn(Val_GtkGridLayout(obj));
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_row_baseline_position(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_grid_layout_set_row_baseline_position(GtkGridLayout_val(self), Int_val(arg1), GtkBaselinePosition_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_row_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkBaselinePosition result = gtk_grid_layout_get_row_baseline_position(GtkGridLayout_val(self), Int_val(arg1));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_baseline_row(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "baseline-row", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_baseline_row(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "baseline-row", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_column_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "column-homogeneous", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_column_homogeneous(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "column-homogeneous", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_column_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "column-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_column_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "column-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_row_homogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "row-homogeneous", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_row_homogeneous(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "row-homogeneous", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_get_row_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "row-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_set_row_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridLayout *obj = (GtkGridLayout *)GtkGridLayout_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "row-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}
