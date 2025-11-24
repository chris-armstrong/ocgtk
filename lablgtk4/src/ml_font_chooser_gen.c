/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooser */

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

/* Type-specific conversion macros for GtkFontChooser */
#define GtkFontChooser_val(val) ((GtkFontChooser*)ext_of_val(val))
#define Val_GtkFontChooser(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_font_chooser_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_chooser_set_level(GtkFontChooser_val(self), GtkFontChooserLevel_val(arg1));
CAMLreturn(Val_unit);
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

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font-features", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_language(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "language", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_language(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "language", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_preview_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "preview-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_preview_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "preview-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_show_preview_entry(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-preview-entry", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_show_preview_entry(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-preview-entry", c_value, NULL);
CAMLreturn(Val_unit);
}
