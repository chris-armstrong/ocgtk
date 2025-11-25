/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SingleSelection */

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

/* Type-specific conversion macros for GtkSingleSelection */
#ifndef Val_GtkSingleSelection
#define GtkSingleSelection_val(val) ((GtkSingleSelection*)ext_of_val(val))
#define Val_GtkSingleSelection(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSingleSelection */


CAMLexport CAMLprim value ml_gtk_single_selection_new(value arg1)
{
CAMLparam1(arg1);
GtkSingleSelection *obj = gtk_single_selection_new(arg1);
CAMLreturn(Val_GtkSingleSelection(obj));
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_selected(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_single_selection_set_selected(GtkSingleSelection_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_can_unselect(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_single_selection_set_can_unselect(GtkSingleSelection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_autoselect(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_single_selection_set_autoselect(GtkSingleSelection_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_selected(value self)
{
CAMLparam1(self);

guint result = gtk_single_selection_get_selected(GtkSingleSelection_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_can_unselect(value self)
{
CAMLparam1(self);

gboolean result = gtk_single_selection_get_can_unselect(GtkSingleSelection_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_autoselect(value self)
{
CAMLparam1(self);

gboolean result = gtk_single_selection_get_autoselect(GtkSingleSelection_val(self));
CAMLreturn(Val_bool(result));
}
