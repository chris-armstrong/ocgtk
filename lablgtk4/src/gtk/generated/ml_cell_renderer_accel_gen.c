/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererAccel */

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

/* Type-specific conversion macros for GtkCellRendererAccel */
#ifndef Val_GtkCellRendererAccel
#define GtkCellRendererAccel_val(val) ((GtkCellRendererAccel*)ext_of_val(val))
#define Val_GtkCellRendererAccel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererAccel */


CAMLexport CAMLprim value ml_gtk_cell_renderer_accel_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererAccel *obj = gtk_cell_renderer_accel_new();
CAMLreturn(Val_GtkCellRendererAccel(obj));
}
