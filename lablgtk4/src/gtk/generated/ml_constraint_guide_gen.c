/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConstraintGuide */

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

/* Type-specific conversion macros for GtkConstraintGuide */
#ifndef Val_GtkConstraintGuide
#define GtkConstraintGuide_val(val) ((GtkConstraintGuide*)ext_of_val(val))
#define Val_GtkConstraintGuide(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkConstraintGuide */


CAMLexport CAMLprim value ml_gtk_constraint_guide_new(value unit)
{
CAMLparam1(unit);
GtkConstraintGuide *obj = gtk_constraint_guide_new();
CAMLreturn(Val_GtkConstraintGuide(obj));
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_strength(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_constraint_guide_set_strength(GtkConstraintGuide_val(self), GtkConstraintStrength_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_nat_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_nat_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_min_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_min_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_max_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_max_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_strength(value self)
{
CAMLparam1(self);

GtkConstraintStrength result = gtk_constraint_guide_get_strength(GtkConstraintGuide_val(self));
CAMLreturn(Val_GtkConstraintStrength(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_max_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_max_height: property 'max-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_max_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_max_height: property 'max-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_max_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_max_width: property 'max-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_max_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_max_width: property 'max-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_min_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_min_height: property 'min-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_min_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_min_height: property 'min-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_min_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_min_width: property 'min-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_min_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_min_width: property 'min-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_nat_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_nat_height: property 'nat-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "nat-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_nat_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-height");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_nat_height: property 'nat-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "nat-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_nat_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_get_nat_width: property 'nat-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "nat-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_nat_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkConstraintGuide *obj = (GtkConstraintGuide *)GtkConstraintGuide_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-width");
if (pspec == NULL) caml_failwith("ml_gtk_constraint_guide_set_nat_width: property 'nat-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "nat-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
