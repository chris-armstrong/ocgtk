/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererCombo */

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

/* Type-specific conversion macros for GtkCellRendererCombo */
#define GtkCellRendererCombo_val(val) ((GtkCellRendererCombo*)ext_of_val(val))
#define Val_GtkCellRendererCombo(obj) ((value)(val_of_ext(obj)))


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
g_object_get(G_OBJECT(obj), "has-entry", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_set_has_entry(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-entry", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_get_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "text-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_combo_set_text_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererCombo *obj = (GtkCellRendererCombo *)GtkCellRendererCombo_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "text-column", c_value, NULL);
CAMLreturn(Val_unit);
}
