/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SingleSelection */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


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

CAMLexport CAMLprim value ml_gtk_single_selection_get_n_items(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
          prop_value = g_value_get_uint(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
