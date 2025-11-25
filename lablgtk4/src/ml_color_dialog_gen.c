/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorDialog */

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

/* Type-specific conversion macros for GtkColorDialog */
#ifndef Val_GtkColorDialog
#define GtkColorDialog_val(val) ((GtkColorDialog*)ext_of_val(val))
#define Val_GtkColorDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColorDialog */


CAMLexport CAMLprim value ml_gtk_color_dialog_new(value unit)
{
CAMLparam1(unit);
GtkColorDialog *obj = gtk_color_dialog_new();
CAMLreturn(Val_GtkColorDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_with_alpha(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_dialog_set_with_alpha(GtkColorDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_dialog_set_title(GtkColorDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_color_dialog_set_modal(GtkColorDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_with_alpha(value self)
{
CAMLparam1(self);

gboolean result = gtk_color_dialog_get_with_alpha(GtkColorDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_color_dialog_get_title(GtkColorDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_color_dialog_get_modal(GtkColorDialog_val(self));
CAMLreturn(Val_bool(result));
}
