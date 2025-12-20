/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DragSource */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkDragSource */
#ifndef Val_GtkDragSource
#define GtkDragSource_val(val) ((GtkDragSource*)ext_of_val(val))
#define Val_GtkDragSource(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDragSource */


CAMLexport CAMLprim value ml_gtk_drag_source_new(value unit)
{
CAMLparam1(unit);
GtkDragSource *obj = gtk_drag_source_new();
CAMLreturn(Val_GtkDragSource(obj));
}

CAMLexport CAMLprim value ml_gtk_drag_source_drag_cancel(value self)
{
CAMLparam1(self);

gtk_drag_source_drag_cancel(GtkDragSource_val(self));
CAMLreturn(Val_unit);
}
