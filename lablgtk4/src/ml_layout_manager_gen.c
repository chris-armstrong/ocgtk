/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LayoutManager */

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


CAMLexport CAMLprim value ml_gtk_layout_manager_measure_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);


    gtk_layout_manager_measure(GtkWidget_val(self), GtkWidget_val(arg1), GtkOrientation_val(arg2), Int_val(arg3), arg4, arg5, arg6, arg7);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_layout_manager_measure_bytecode(value * argv, int argn)
{
return ml_gtk_layout_manager_measure_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gtk_layout_manager_layout_changed(value self)
{
CAMLparam1(self);


    gtk_layout_manager_layout_changed(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_layout_manager_get_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_request_mode(value self)
{
CAMLparam1(self);


    GtkSizeRequestMode result = gtk_layout_manager_get_request_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_get_layout_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkLayoutChild* result = gtk_layout_manager_get_layout_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_layout_manager_allocate(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_layout_manager_allocate(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}
