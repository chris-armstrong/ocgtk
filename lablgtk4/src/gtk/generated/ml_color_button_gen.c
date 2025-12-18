/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorButton */

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

/* Type-specific conversion macros for GtkColorButton */
#ifndef Val_GtkColorButton
#define GtkColorButton_val(val) ((GtkColorButton*)ext_of_val(val))
#define Val_GtkColorButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColorButton */


CAMLexport CAMLprim value ml_gtk_color_button_new(value unit)
{
CAMLparam1(unit);
GtkColorButton *obj = gtk_color_button_new();
CAMLreturn(Val_GtkColorButton(obj));
}

CAMLexport CAMLprim value ml_gtk_color_button_new_with_rgba(value arg1)
{
CAMLparam1(arg1);
GtkColorButton *obj = gtk_color_button_new_with_rgba(arg1);
CAMLreturn(Val_GtkColorButton(obj));
}

CAMLexport CAMLprim value ml_gtk_color_button_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_button_set_title(GtkColorButton_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_button_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_button_set_modal(GtkColorButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_button_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_color_button_get_title(GtkColorButton_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_color_button_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_color_button_get_modal(GtkColorButton_val(self));
CAMLreturn(Val_bool(result));
}
