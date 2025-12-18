/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererCombo */

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

/* Type-specific conversion macros for GtkCellRendererCombo */
#ifndef Val_GtkCellRendererCombo
#define GtkCellRendererCombo_val(val) ((GtkCellRendererCombo*)ext_of_val(val))
#define Val_GtkCellRendererCombo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererCombo */


CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererCombo *obj = gtk_cell_renderer_combo_new();
CAMLreturn(Val_GtkCellRendererCombo(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_get_has_entry(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-entry");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_combo_get_has_entry: property 'has-entry' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-entry", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_set_has_entry(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-entry");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_combo_set_has_entry: property 'has-entry' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-entry", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_get_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_combo_get_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_set_text_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_combo_set_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
