/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererCombo */

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
