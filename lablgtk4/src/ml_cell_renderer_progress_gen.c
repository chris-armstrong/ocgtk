/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererProgress */

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

/* Type-specific conversion macros for GtkCellRendererProgress */
#ifndef Val_GtkCellRendererProgress
#define GtkCellRendererProgress_val(val) ((GtkCellRendererProgress*)ext_of_val(val))
#define Val_GtkCellRendererProgress(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererProgress */


CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererProgress *obj = gtk_cell_renderer_progress_new();
CAMLreturn(Val_GtkCellRendererProgress(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_inverted(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}
