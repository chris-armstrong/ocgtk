/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Inscription */

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

/* Type-specific conversion macros for GtkInscription */
#define GtkInscription_val(val) ((GtkInscription*)ext_of_val(val))
#define Val_GtkInscription(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_inscription_new(value arg1)
{
CAMLparam1(arg1);
GtkInscription *obj = gtk_inscription_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gchar* prop_value;
g_object_get(G_OBJECT(obj), "markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "min-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "min-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "nat-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "nat-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "nat-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "nat-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_yalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkInscription *obj = (GtkInscription *)GtkInscription_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}
