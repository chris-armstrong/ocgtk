/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererSpinner */

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
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_spinner_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererSpinner *obj = (GtkCellRendererSpinner *)GtkCellRendererSpinner_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}
