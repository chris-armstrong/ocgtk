/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellLayout */

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


CAMLexport CAMLprim value ml_gtk_cell_layout_set_cell_data_func(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_layout_set_cell_data_func(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_reorder(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_reorder(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_pack_start(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_pack_end(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_get_area(value self)
{
CAMLparam1(self);


    GtkCellArea* result = gtk_cell_layout_get_area(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_layout_clear_attributes(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear(value self)
{
CAMLparam1(self);


    gtk_cell_layout_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_add_attribute(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_layout_add_attribute(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}
