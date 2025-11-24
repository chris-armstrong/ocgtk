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
#define GtkFontDialogButton_val(val) ((GtkFontDialogButton*)ext_of_val(val))
#define Val_GtkFontDialogButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_font_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkFontDialogButton *obj = gtk_font_dialog_button_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkFontDialogButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_level(GtkFontDialogButton_val(self), GtkFontLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_dialog(GtkFontDialogButton_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_level(value self)
{
CAMLparam1(self);

GtkFontLevel result = gtk_font_dialog_button_get_level(GtkFontDialogButton_val(self));
CAMLreturn(Val_GtkFontLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_dialog(value self)
{
CAMLparam1(self);

GtkFontDialog* result = gtk_font_dialog_button_get_dialog(GtkFontDialogButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font-features", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_font_features(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font-features", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-font", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-size", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-size", c_value, NULL);
CAMLreturn(Val_unit);
}
