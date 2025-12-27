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
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_inscription_new(value arg1)
{
CAMLparam1(arg1);
GtkInscription *obj = gtk_inscription_new(String_option_val(arg1));
CAMLreturn(Val_GtkInscription(obj));
}

CAMLexport CAMLprim value ml_gtk_inscription_set_yalign(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_yalign(GtkInscription_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_xalign(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_xalign(GtkInscription_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_text_overflow(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_text_overflow(GtkInscription_val(self), GtkInscriptionOverflow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_text(GtkInscription_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_lines(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_nat_lines(GtkInscription_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_nat_chars(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_nat_chars(GtkInscription_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_lines(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_min_lines(GtkInscription_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_min_chars(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_min_chars(GtkInscription_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_markup(GtkInscription_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_inscription_get_yalign(value self)
{
CAMLparam1(self);

float result = gtk_inscription_get_yalign(GtkInscription_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_xalign(value self)
{
CAMLparam1(self);

float result = gtk_inscription_get_xalign(GtkInscription_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_text_overflow(value self)
{
CAMLparam1(self);

GtkInscriptionOverflow result = gtk_inscription_get_text_overflow(GtkInscription_val(self));
CAMLreturn(Val_GtkInscriptionOverflow(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_text(value self)
{
CAMLparam1(self);

const char* result = gtk_inscription_get_text(GtkInscription_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_lines(value self)
{
CAMLparam1(self);

guint result = gtk_inscription_get_nat_lines(GtkInscription_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_nat_chars(value self)
{
CAMLparam1(self);

guint result = gtk_inscription_get_nat_chars(GtkInscription_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_lines(value self)
{
CAMLparam1(self);

guint result = gtk_inscription_get_min_lines(GtkInscription_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_inscription_get_min_chars(value self)
{
CAMLparam1(self);

guint result = gtk_inscription_get_min_chars(GtkInscription_val(self));
CAMLreturn(Val_int(result));
}
