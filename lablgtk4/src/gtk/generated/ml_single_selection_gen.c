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

CAMLexport CAMLprim value ml_gtk_single_selection_get_autoselect(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "autoselect");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_get_autoselect: property 'autoselect' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "autoselect", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_autoselect(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "autoselect");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_set_autoselect: property 'autoselect' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "autoselect", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_can_unselect(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-unselect");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_get_can_unselect: property 'can-unselect' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "can-unselect", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_can_unselect(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-unselect");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_set_can_unselect: property 'can-unselect' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "can-unselect", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
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
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_get_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "selected", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_single_selection_set_selected(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSingleSelection *obj = (GtkSingleSelection *)GtkSingleSelection_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "selected");
if (pspec == NULL) caml_failwith("ml_gtk_single_selection_set_selected: property 'selected' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "selected", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
