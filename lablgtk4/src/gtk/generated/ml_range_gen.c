/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Range */

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

/* Type-specific conversion macros for GtkRange */
#ifndef Val_GtkRange
#define GtkRange_val(val) ((GtkRange*)ext_of_val(val))
#define Val_GtkRange(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkRange */


CAMLexport CAMLprim value ml_gtk_range_set_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_range_set_value(GtkRange_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_slider_size_fixed(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_range_set_slider_size_fixed(GtkRange_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_range_set_range(GtkRange_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_range_set_increments(GtkRange_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_flippable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_range_set_flippable(GtkRange_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_range_set_adjustment(GtkRange_val(self), GtkAdjustment_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_value(value self)
{
CAMLparam1(self);

double result = gtk_range_get_value(GtkRange_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_slider_size_fixed(value self)
{
CAMLparam1(self);

gboolean result = gtk_range_get_slider_size_fixed(GtkRange_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_flippable(value self)
{
CAMLparam1(self);

gboolean result = gtk_range_get_flippable(GtkRange_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_adjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_range_get_adjustment(GtkRange_val(self));
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_get_fill_level: property 'fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "fill-level", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_fill_level(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_set_fill_level: property 'fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "fill-level", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inverted");
if (pspec == NULL) caml_failwith("ml_gtk_range_get_inverted: property 'inverted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "inverted", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_inverted(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inverted");
if (pspec == NULL) caml_failwith("ml_gtk_range_set_inverted: property 'inverted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "inverted", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_restrict_to_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "restrict-to-fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_get_restrict_to_fill_level: property 'restrict-to-fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "restrict-to-fill-level", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_restrict_to_fill_level(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "restrict-to-fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_set_restrict_to_fill_level: property 'restrict-to-fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "restrict-to-fill-level", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_round_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "round-digits");
if (pspec == NULL) caml_failwith("ml_gtk_range_get_round_digits: property 'round-digits' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "round-digits", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_round_digits(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "round-digits");
if (pspec == NULL) caml_failwith("ml_gtk_range_set_round_digits: property 'round-digits' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "round-digits", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_show_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_get_show_fill_level: property 'show-fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-fill-level", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_show_fill_level(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRange *obj = (GtkRange *)GtkRange_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-fill-level");
if (pspec == NULL) caml_failwith("ml_gtk_range_set_show_fill_level: property 'show-fill-level' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-fill-level", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
