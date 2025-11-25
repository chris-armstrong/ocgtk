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
#ifndef Val_GtkInscription
#define GtkInscription_val(val) ((GtkInscription*)ext_of_val(val))
#define Val_GtkInscription(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkInscription */


CAMLexport CAMLprim value ml_gtk_inscription_new(value arg1)
{
CAMLparam1(arg1);
GtkInscription *obj = gtk_inscription_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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

CAMLexport CAMLprim value ml_gtk_inscription_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_inscription_set_text(GtkInscription_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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

gtk_inscription_set_markup(GtkInscription_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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

CAMLexport CAMLprim value ml_gtk_inscription_get_text(value self)
{
CAMLparam1(self);

const char* result = gtk_inscription_get_text(GtkInscription_val(self));
CAMLreturn(caml_copy_string(result));
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
