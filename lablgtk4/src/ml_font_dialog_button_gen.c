/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialogButton */

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

/* Type-specific conversion macros for GtkFontDialogButton */
#ifndef Val_GtkFontDialogButton
#define GtkFontDialogButton_val(val) ((GtkFontDialogButton*)ext_of_val(val))
#define Val_GtkFontDialogButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontDialogButton */


CAMLexport CAMLprim value ml_gtk_font_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkFontDialogButton *obj = gtk_font_dialog_button_new((Is_some(arg1) ? GtkFontDialog_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkFontDialogButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_size(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_use_size(GtkFontDialogButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_font(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_use_font(GtkFontDialogButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_level(GtkFontDialogButton_val(self), GtkFontLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_font_features(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_font_features(GtkFontDialogButton_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_dialog(GtkFontDialogButton_val(self), GtkFontDialog_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_size(value self)
{
CAMLparam1(self);

gboolean result = gtk_font_dialog_button_get_use_size(GtkFontDialogButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_font(value self)
{
CAMLparam1(self);

gboolean result = gtk_font_dialog_button_get_use_font(GtkFontDialogButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_level(value self)
{
CAMLparam1(self);

GtkFontLevel result = gtk_font_dialog_button_get_level(GtkFontDialogButton_val(self));
CAMLreturn(Val_GtkFontLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_font_features(value self)
{
CAMLparam1(self);

const char* result = gtk_font_dialog_button_get_font_features(GtkFontDialogButton_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_dialog(value self)
{
CAMLparam1(self);

GtkFontDialog* result = gtk_font_dialog_button_get_dialog(GtkFontDialogButton_val(self));
CAMLreturn(Val_GtkFontDialog(result));
}
