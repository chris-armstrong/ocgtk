/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DragIcon */

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

/* Type-specific conversion macros for GtkDragIcon */
#ifndef Val_GtkDragIcon
#define GtkDragIcon_val(val) ((GtkDragIcon*)ext_of_val(val))
#define Val_GtkDragIcon(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDragIcon */


CAMLexport CAMLprim value ml_gtk_drag_icon_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drag_icon_set_child(GtkDragIcon_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drag_icon_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_drag_icon_get_child(GtkDragIcon_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}
