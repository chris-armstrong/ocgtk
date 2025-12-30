/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialog */

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


CAMLexport CAMLprim value ml_gtk_font_dialog_new(value unit)
{
CAMLparam1(unit);
GtkFontDialog *obj = gtk_font_dialog_new();
if (obj) g_object_ref_sink(obj);
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

gtk_font_dialog_set_filter(GtkFontDialog_val(self), Option_val(arg1, GtkFilter_val, NULL));
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
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkFilter));
}
