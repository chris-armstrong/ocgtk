/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellAreaBox */

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

/* Type-specific conversion macros for GtkCellAreaBox */
#ifndef Val_GtkCellAreaBox
#define GtkCellAreaBox_val(val) ((GtkCellAreaBox*)ext_of_val(val))
#define Val_GtkCellAreaBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellAreaBox */


CAMLexport CAMLprim value ml_gtk_cell_area_box_new(value unit)
{
CAMLparam1(unit);
GtkCellAreaBox *obj = gtk_cell_area_box_new();
CAMLreturn(Val_GtkCellAreaBox(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_set_spacing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_area_box_set_spacing(GtkCellAreaBox_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_pack_start(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_cell_area_box_pack_start(GtkCellAreaBox_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_pack_end(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_cell_area_box_pack_end(GtkCellAreaBox_val(self), GtkCellRenderer_val(arg1), Bool_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_box_get_spacing(value self)
{
CAMLparam1(self);

int result = gtk_cell_area_box_get_spacing(GtkCellAreaBox_val(self));
CAMLreturn(Val_int(result));
}
