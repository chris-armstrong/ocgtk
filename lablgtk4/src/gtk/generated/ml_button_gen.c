/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Button */

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

/* Type-specific conversion macros for GtkButton */
#ifndef Val_GtkButton
#define GtkButton_val(val) ((GtkButton*)ext_of_val(val))
#define Val_GtkButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkButton */


CAMLexport CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkButton *obj = gtk_button_new();
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_from_icon_name(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkButton *obj = gtk_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_button_set_use_underline(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_use_underline(GtkButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_label(GtkButton_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_set_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_icon_name(GtkButton_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_set_has_frame(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_has_frame(GtkButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_child(GtkButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_set_can_shrink(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_button_set_can_shrink(GtkButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(self);

gboolean result = gtk_button_get_use_underline(GtkButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(self);

const char* result = gtk_button_get_label(GtkButton_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(self);

const char* result = gtk_button_get_icon_name(GtkButton_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(self);

gboolean result = gtk_button_get_has_frame(GtkButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_button_get_child(GtkButton_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(self);

gboolean result = gtk_button_get_can_shrink(GtkButton_val(self));
CAMLreturn(Val_bool(result));
}
