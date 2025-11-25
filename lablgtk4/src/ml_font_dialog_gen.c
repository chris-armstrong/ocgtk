/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialog */

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

/* Type-specific conversion macros for GtkFontDialog */
#ifndef Val_GtkFontDialog
#define GtkFontDialog_val(val) ((GtkFontDialog*)ext_of_val(val))
#define Val_GtkFontDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontDialog */


CAMLexport CAMLprim value ml_gtk_font_dialog_new(value unit)
{
CAMLparam1(unit);
GtkFontDialog *obj = gtk_font_dialog_new();
CAMLreturn(Val_GtkFontDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_set_title(GtkFontDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_set_modal(GtkFontDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_set_filter(GtkFontDialog_val(self), (Is_some(arg1) ? GtkFilter_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_font_dialog_get_title(GtkFontDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_font_dialog_get_modal(GtkFontDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_filter(value self)
{
CAMLparam1(self);

GtkFilter* result = gtk_font_dialog_get_filter(GtkFontDialog_val(self));
CAMLreturn(Val_GtkFilter(result));
}
