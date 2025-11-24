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


CAMLexport CAMLprim value ml_gtk_cell_area_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_stop_editing(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_snapshot_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);


    gtk_cell_area_snapshot(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GtkWidget_val(arg3), arg4, arg5, GtkCellRendererState_val(arg6), Bool_val(arg7));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_snapshot_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_snapshot_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_set_focus_cell(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_set_focus_cell(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_request_renderer_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_cell_area_request_renderer(GtkWidget_val(self), GtkWidget_val(arg1), GtkOrientation_val(arg2), GtkWidget_val(arg3), Int_val(arg4), arg5, arg6);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_request_renderer_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_request_renderer_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_remove_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_cell_area_is_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_activatable(value self)
{
CAMLparam1(self);


    gboolean result = gtk_cell_area_is_activatable(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_inner_cell_area(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_inner_cell_area(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_has_renderer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_has_renderer(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_request_mode(value self)
{
CAMLparam1(self);


    GtkSizeRequestMode result = gtk_cell_area_get_request_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width_for_height_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_preferred_width_for_height(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width_for_height_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_preferred_width_for_height_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_get_preferred_width(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height_for_width_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_preferred_height_for_width(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height_for_width_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_preferred_height_for_width_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_get_preferred_height(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_from_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellRenderer* result = gtk_cell_area_get_focus_from_sibling(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_focus_cell(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edited_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_edited_cell(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edit_widget(value self)
{
CAMLparam1(self);


    GtkCellEditable* result = gtk_cell_area_get_edit_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_current_path_string(value self)
{
CAMLparam1(self);


    const char* result = gtk_cell_area_get_current_path_string(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_at_position_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    GtkCellRenderer* result = gtk_cell_area_get_cell_at_position(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, Int_val(arg4), Int_val(arg5), arg6);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_at_position_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_cell_at_position_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_allocation_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_cell_allocation(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GtkWidget_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_allocation_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_cell_allocation_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach_alloc_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_cell_area_foreach_alloc(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4, arg5, arg6);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach_alloc_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_foreach_alloc_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_focus(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_focus(GtkWidget_val(self), GtkDirectionType_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_event_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    int result = gtk_cell_area_event(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GdkEvent_val(arg3), arg4, GtkCellRendererState_val(arg5));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_event_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_event_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_create_context(value self)
{
CAMLparam1(self);


    GtkCellAreaContext* result = gtk_cell_area_create_context(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_copy_context(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellAreaContext* result = gtk_cell_area_copy_context(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_set_valist(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_set_valist(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_set_property(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_set_property(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_get_valist(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_get_valist(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_get_property(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_get_property(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_get_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_cell_area_attribute_get_column(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_disconnect(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_attribute_disconnect(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_connect(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_attribute_connect(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_apply_attributes(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_apply_attributes(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_add_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_add(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_cell_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gboolean result = gtk_cell_area_activate_cell(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GdkEvent_val(arg3), arg4, GtkCellRendererState_val(arg5));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_cell_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_activate_cell_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gboolean result = gtk_cell_area_activate(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, GtkCellRendererState_val(arg4), Bool_val(arg5));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_activate_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}
