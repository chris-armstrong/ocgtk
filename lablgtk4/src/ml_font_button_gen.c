/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontButton */

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

/* Type-specific conversion macros for GtkFontButton */
#define GtkFontButton_val(val) ((GtkFontButton*)ext_of_val(val))
#define Val_GtkFontButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_font_button_new(value unit)
{
CAMLparam1(unit);
GtkFontButton *obj = gtk_font_button_new();
CAMLreturn(Val_GtkFontButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_button_new_with_font(value arg1)
{
CAMLparam1(arg1);
GtkFontButton *obj = gtk_font_button_new_with_font(String_val(arg1));
CAMLreturn(Val_GtkFontButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_button_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_use_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-font", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_use_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_use_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-size", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_use_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-size", c_value, NULL);
CAMLreturn(Val_unit);
}
