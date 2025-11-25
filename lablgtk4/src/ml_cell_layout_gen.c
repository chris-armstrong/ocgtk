/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellLayout */

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

/* Type-specific conversion macros for GtkCellLayout */
#ifndef Val_GtkCellLayout
#define GtkCellLayout_val(val) ((GtkCellLayout*)ext_of_val(val))
#define Val_GtkCellLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellLayout */


CAMLexport CAMLprim value ml_gtk_cell_layout_reorder(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_layout_reorder(GtkCellLayout_val(self), GtkCellRenderer_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_layout_pack_start(GtkCellLayout_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_layout_pack_end(GtkCellLayout_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_get_area(value self)
{
CAMLparam1(self);

GtkCellArea* result = gtk_cell_layout_get_area(GtkCellLayout_val(self));
CAMLreturn(Val_option(result, Val_GtkCellArea));
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_layout_clear_attributes(GtkCellLayout_val(self), GtkCellRenderer_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear(value self)
{
CAMLparam1(self);

gtk_cell_layout_clear(GtkCellLayout_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_add_attribute(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_cell_layout_add_attribute(GtkCellLayout_val(self), GtkCellRenderer_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}
