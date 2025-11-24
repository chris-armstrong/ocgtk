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

/* Type-specific conversion macros for GtkCellAreaContext */
#define GtkCellAreaContext_val(val) ((GtkCellAreaContext*)ext_of_val(val))
#define Val_GtkCellAreaContext(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_area_context_reset(value self)
{
CAMLparam1(self);

gtk_cell_area_context_reset(GtkCellAreaContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_push_preferred_width(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_area_context_push_preferred_width(GtkCellAreaContext_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_push_preferred_height(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_area_context_push_preferred_height(GtkCellAreaContext_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_area(value self)
{
CAMLparam1(self);

GtkCellArea* result = gtk_cell_area_context_get_area(GtkCellAreaContext_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_allocate(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_area_context_allocate(GtkCellAreaContext_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_minimum_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellAreaContext *obj = (GtkCellAreaContext *)GtkCellAreaContext_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "minimum-height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_minimum_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellAreaContext *obj = (GtkCellAreaContext *)GtkCellAreaContext_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "minimum-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_natural_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellAreaContext *obj = (GtkCellAreaContext *)GtkCellAreaContext_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "natural-height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_area_context_get_natural_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellAreaContext *obj = (GtkCellAreaContext *)GtkCellAreaContext_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "natural-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
