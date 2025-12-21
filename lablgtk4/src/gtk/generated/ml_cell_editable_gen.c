/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellEditable */

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

/* Type-specific conversion macros for GtkCellEditable */
#ifndef Val_GtkCellEditable
#define GtkCellEditable_val(val) ((GtkCellEditable*)ext_of_val(val))
#define Val_GtkCellEditable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellEditable */


CAMLexport CAMLprim value ml_gtk_cell_editable_remove_widget(value self)
{
CAMLparam1(self);

gtk_cell_editable_remove_widget(GtkCellEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_editing_done(value self)
{
CAMLparam1(self);

gtk_cell_editable_editing_done(GtkCellEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_get_editing_canceled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellEditable *obj = (GtkCellEditable *)GtkCellEditable_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editing-canceled");
if (pspec == NULL) caml_failwith("ml_gtk_cell_editable_get_editing_canceled: property 'editing-canceled' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "editing-canceled", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_set_editing_canceled(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellEditable *obj = (GtkCellEditable *)GtkCellEditable_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editing-canceled");
if (pspec == NULL) caml_failwith("ml_gtk_cell_editable_set_editing_canceled: property 'editing-canceled' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "editing-canceled", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
