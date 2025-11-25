/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridLayoutChild */

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

/* Type-specific conversion macros for GtkGridLayoutChild */
#ifndef Val_GtkGridLayoutChild
#define GtkGridLayoutChild_val(val) ((GtkGridLayoutChild*)ext_of_val(val))
#define Val_GtkGridLayoutChild(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGridLayoutChild */


CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row_span(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_layout_child_set_row_span(GtkGridLayoutChild_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_row(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_layout_child_set_row(GtkGridLayoutChild_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column_span(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_layout_child_set_column_span(GtkGridLayoutChild_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_set_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_layout_child_set_column(GtkGridLayoutChild_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row_span(value self)
{
CAMLparam1(self);

int result = gtk_grid_layout_child_get_row_span(GtkGridLayoutChild_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_row(value self)
{
CAMLparam1(self);

int result = gtk_grid_layout_child_get_row(GtkGridLayoutChild_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column_span(value self)
{
CAMLparam1(self);

int result = gtk_grid_layout_child_get_column_span(GtkGridLayoutChild_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_grid_layout_child_get_column(value self)
{
CAMLparam1(self);

int result = gtk_grid_layout_child_get_column(GtkGridLayoutChild_val(self));
CAMLreturn(Val_int(result));
}
