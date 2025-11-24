/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellArea */

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

/* Type-specific conversion macros for GtkCellArea */
#define GtkCellArea_val(val) ((GtkCellArea*)ext_of_val(val))
#define Val_GtkCellArea(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_area_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_stop_editing(GtkCellArea_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_set_focus_cell(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_set_focus_cell(GtkCellArea_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_remove_focus_sibling(GtkCellArea_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_remove(GtkCellArea_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_cell_area_is_focus_sibling(GtkCellArea_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_activatable(value self)
{
CAMLparam1(self);


    gboolean result = gtk_cell_area_is_activatable(GtkCellArea_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_has_renderer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_has_renderer(GtkCellArea_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_request_mode(value self)
{
CAMLparam1(self);


    GtkSizeRequestMode result = gtk_cell_area_get_request_mode(GtkCellArea_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_from_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellRenderer* result = gtk_cell_area_get_focus_from_sibling(GtkCellArea_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_focus_cell(GtkCellArea_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edited_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_edited_cell(GtkCellArea_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edit_widget(value self)
{
CAMLparam1(self);


    GtkCellEditable* result = gtk_cell_area_get_edit_widget(GtkCellArea_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_current_path_string(value self)
{
CAMLparam1(self);


    const char* result = gtk_cell_area_get_current_path_string(GtkCellArea_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_focus(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_focus(GtkCellArea_val(self), GtkDirectionType_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_create_context(value self)
{
CAMLparam1(self);


    GtkCellAreaContext* result = gtk_cell_area_create_context(GtkCellArea_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_copy_context(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellAreaContext* result = gtk_cell_area_copy_context(GtkCellArea_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_get_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_cell_area_attribute_get_column(GtkCellArea_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_disconnect(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_attribute_disconnect(GtkCellArea_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_connect(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_attribute_connect(GtkCellArea_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_apply_attributes(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_apply_attributes(GtkCellArea_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_add_focus_sibling(GtkCellArea_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_add(GtkCellArea_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
