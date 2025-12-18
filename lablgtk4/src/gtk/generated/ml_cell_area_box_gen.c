/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellAreaBox */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCellAreaBox */
#ifndef Val_GtkCellAreaBox
#define GtkCellAreaBox_val(val) ((GtkCellAreaBox*)ext_of_val(val))
#define Val_GtkCellAreaBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellAreaBox */


CAMLexport CAMLprim value ml_gtk_cell_area_box_new(value unit)
{
CAMLparam1(unit);
GtkCellAreaBox *obj = gtk_cell_area_box_new();
CAMLreturn(Val_GtkCellAreaBox(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_pack_start(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_cell_area_box_pack_start(GtkCellAreaBox_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_pack_end(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_cell_area_box_pack_end(GtkCellAreaBox_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellAreaBox *obj = (GtkCellAreaBox *)GtkCellAreaBox_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_cell_area_box_get_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "spacing", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_set_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellAreaBox *obj = (GtkCellAreaBox *)GtkCellAreaBox_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spacing");
if (pspec == NULL) caml_failwith("ml_gtk_cell_area_box_set_spacing: property 'spacing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "spacing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
