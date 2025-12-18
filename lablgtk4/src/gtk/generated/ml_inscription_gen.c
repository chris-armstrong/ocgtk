/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Inscription */

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

/* Type-specific conversion macros for GtkInscription */
#ifndef Val_GtkInscription
#define GtkInscription_val(val) ((GtkInscription*)ext_of_val(val))
#define Val_GtkInscription(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkInscription */


CAMLexport CAMLprim value ml_gtk_inscription_new(value arg1)
{
CAMLparam1(arg1);
GtkInscription *obj = gtk_inscription_new(String_option_val(arg1));
CAMLreturn(Val_GtkInscription(obj));
}

CAMLexport CAMLprim value ml_gtk_inscription_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_wrap_mode(GtkInscription_val(self), PangoWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_text_overflow(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_text_overflow(GtkInscription_val(self), GtkInscriptionOverflow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_wrap_mode(value self)
{
CAMLparam1(self);

PangoWrapMode result = gtk_inscription_get_wrap_mode(GtkInscription_val(self));
CAMLreturn(Val_PangoWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_text_overflow(value self)
{
CAMLparam1(self);

GtkInscriptionOverflow result = gtk_inscription_get_text_overflow(GtkInscription_val(self));
CAMLreturn(Val_GtkInscriptionOverflow(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_markup: property 'markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "markup", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_markup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_markup: property 'markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "markup", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-chars");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_min_chars: property 'min-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-chars", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_chars(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-chars");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_min_chars: property 'min-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-chars", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-lines");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_min_lines: property 'min-lines' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-lines", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-lines");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_min_lines: property 'min-lines' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-lines", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-chars");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_nat_chars: property 'nat-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "nat-chars", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_chars(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-chars");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_nat_chars: property 'nat-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "nat-chars", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-lines");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_nat_lines: property 'nat-lines' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "nat-lines", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "nat-lines");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_nat_lines: property 'nat-lines' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "nat-lines", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "xalign");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_xalign: property 'xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "xalign", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_xalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "xalign");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_xalign: property 'xalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "xalign", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gfloat prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "yalign");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_get_yalign: property 'yalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "yalign", &prop_gvalue);
    prop_value = g_value_get_float(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_yalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
    gfloat c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "yalign");
if (pspec == NULL) caml_failwith("ml_gtk_inscription_set_yalign: property 'yalign' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_float(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "yalign", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
