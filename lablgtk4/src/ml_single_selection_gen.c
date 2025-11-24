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
#define GtkSingleSelection_val(val) ((GtkSingleSelection*)ext_of_val(val))
#define Val_GtkSingleSelection(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_single_selection_new(value arg1)
{
CAMLparam1(arg1);
GtkSingleSelection *obj = gtk_single_selection_new(arg1);
CAMLreturn(Val_GtkSingleSelection(obj));
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_autoselect(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "autoselect", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_autoselect(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "autoselect", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_can_unselect(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-unselect", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_can_unselect(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-unselect", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "selected", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_selected(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "selected", c_value, NULL);
CAMLreturn(Val_unit);
}
