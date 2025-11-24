/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererAccel */

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

/* Type-specific conversion macros for GtkCellRendererAccel */
#define GtkCellRendererAccel_val(val) ((GtkCellRendererAccel*)ext_of_val(val))
#define Val_GtkCellRendererAccel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererAccel *obj = gtk_cell_renderer_accel_new();
CAMLreturn(Val_GtkCellRendererAccel(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_get_accel_key(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererAccel *obj = (GtkCellRendererAccel *)GtkCellRendererAccel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "accel-key", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_set_accel_key(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererAccel *obj = (GtkCellRendererAccel *)GtkCellRendererAccel_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "accel-key", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_get_keycode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererAccel *obj = (GtkCellRendererAccel *)GtkCellRendererAccel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "keycode", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_set_keycode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererAccel *obj = (GtkCellRendererAccel *)GtkCellRendererAccel_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "keycode", c_value, NULL);
CAMLreturn(Val_unit);
}
