/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooser */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkFontChooser */
#ifndef Val_GtkFontChooser
#define GtkFontChooser_val(val) ((GtkFontChooser*)ext_of_val(val))
#define Val_GtkFontChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontChooser */


CAMLexport CAMLprim value ml_gtk_font_chooser_set_show_preview_entry(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_show_preview_entry(GtkFontChooser_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_preview_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_preview_text(GtkFontChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_level(GtkFontChooser_val(self), GtkFontChooserLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_language(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_language(GtkFontChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_font(GtkFontChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_show_preview_entry(value self)
{
CAMLparam1(self);

gboolean result = gtk_font_chooser_get_show_preview_entry(GtkFontChooser_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_level(value self)
{
CAMLparam1(self);

GtkFontChooserLevel result = gtk_font_chooser_get_level(GtkFontChooser_val(self));
CAMLreturn(Val_GtkFontChooserLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_size(value self)
{
CAMLparam1(self);

int result = gtk_font_chooser_get_font_size(GtkFontChooser_val(self));
CAMLreturn(Val_int(result));
}
