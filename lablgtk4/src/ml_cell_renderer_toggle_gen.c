/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererToggle */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCellRendererToggle */
#ifndef Val_GtkCellRendererToggle
#define GtkCellRendererToggle_val(val) ((GtkCellRendererToggle*)ext_of_val(val))
#define Val_GtkCellRendererToggle(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererToggle */


CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererToggle *obj = gtk_cell_renderer_toggle_new();
CAMLreturn(Val_GtkCellRendererToggle(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_get_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_set_activatable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inconsistent", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_set_inconsistent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inconsistent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_get_radio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "radio", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_toggle_set_radio(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererToggle *obj = (GtkCellRendererToggle *)GtkCellRendererToggle_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "radio", c_value, NULL);
CAMLreturn(Val_unit);
}
