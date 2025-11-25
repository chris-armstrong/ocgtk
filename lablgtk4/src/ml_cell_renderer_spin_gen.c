/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererSpin */

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

/* Type-specific conversion macros for GtkCellRendererSpin */
#ifndef Val_GtkCellRendererSpin
#define GtkCellRendererSpin_val(val) ((GtkCellRendererSpin*)ext_of_val(val))
#define Val_GtkCellRendererSpin(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererSpin */


CAMLexport CAMLprim value ml_gtk_cell_renderer_spin_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererSpin *obj = gtk_cell_renderer_spin_new();
CAMLreturn(Val_GtkCellRendererSpin(obj));
}
