/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererPixbuf */

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

/* Type-specific conversion macros for GtkCellRendererPixbuf */
#ifndef Val_GtkCellRendererPixbuf
#define GtkCellRendererPixbuf_val(val) ((GtkCellRendererPixbuf*)ext_of_val(val))
#define Val_GtkCellRendererPixbuf(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererPixbuf */


CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererPixbuf *obj = gtk_cell_renderer_pixbuf_new();
CAMLreturn(Val_GtkCellRendererPixbuf(obj));
}
