/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellAreaContext */

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


CAMLexport CAMLprim value ml_gtk_cell_area_context_reset(value self)
{
CAMLparam1(self);


    gtk_cell_area_context_reset(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_push_preferred_width(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_push_preferred_width(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_push_preferred_height(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_push_preferred_height(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_preferred_width_for_height(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_context_get_preferred_width_for_height(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_preferred_width(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_get_preferred_width(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_preferred_height_for_width(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_context_get_preferred_height_for_width(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_preferred_height(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_get_preferred_height(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_area(value self)
{
CAMLparam1(self);


    GtkCellArea* result = gtk_cell_area_context_get_area(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_allocation(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_get_allocation(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_allocate(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_context_allocate(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_minimum_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "minimum-height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_minimum_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "minimum-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_natural_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "natural-height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_natural_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "natural-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
