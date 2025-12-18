/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererSpinner */

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

/* Type-specific conversion macros for GtkCellRendererSpinner */
#ifndef Val_GtkCellRendererSpinner
#define GtkCellRendererSpinner_val(val) ((GtkCellRendererSpinner*)ext_of_val(val))
#define Val_GtkCellRendererSpinner(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererSpinner */


CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererSpinner *obj = gtk_cell_renderer_spinner_new();
CAMLreturn(Val_GtkCellRendererSpinner(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererSpinner *obj = (GtkCellRendererSpinner *)GtkCellRendererSpinner_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_spinner_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererSpinner *obj = (GtkCellRendererSpinner *)GtkCellRendererSpinner_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_spinner_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_get_pulse(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererSpinner *obj = (GtkCellRendererSpinner *)GtkCellRendererSpinner_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pulse");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_spinner_get_pulse: property 'pulse' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "pulse", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_set_pulse(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererSpinner *obj = (GtkCellRendererSpinner *)GtkCellRendererSpinner_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "pulse");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_spinner_set_pulse: property 'pulse' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "pulse", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
