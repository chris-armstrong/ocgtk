/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SelectionModel */

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

/* Type-specific conversion macros for GtkSelectionModel */
#define GtkSelectionModel_val(val) ((GtkSelectionModel*)ext_of_val(val))
#define Val_GtkSelectionModel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_selection_model_unselect_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_unselect_range(GtkSelectionModel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_unselect_item(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_selection_model_unselect_item(GtkSelectionModel_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_unselect_all(value self)
{
CAMLparam1(self);


    gboolean result = gtk_selection_model_unselect_all(GtkSelectionModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_set_selection(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_set_selection(GtkSelectionModel_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_selection_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_selection_model_selection_changed(GtkSelectionModel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_range(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_selection_model_select_range(GtkSelectionModel_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_select_item(GtkSelectionModel_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_all(value self)
{
CAMLparam1(self);


    gboolean result = gtk_selection_model_select_all(GtkSelectionModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_selection_model_is_selected(GtkSelectionModel_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_get_selection_in_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkBitset* result = gtk_selection_model_get_selection_in_range(GtkSelectionModel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_get_selection(value self)
{
CAMLparam1(self);


    GtkBitset* result = gtk_selection_model_get_selection(GtkSelectionModel_val(self));
CAMLreturn(Val_GtkWidget(result));
}
