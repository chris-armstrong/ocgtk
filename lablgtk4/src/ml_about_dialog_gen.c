/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AboutDialog */

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

/* Type-specific conversion macros for GtkAboutDialog */
#define GtkAboutDialog_val(val) ((GtkAboutDialog*)ext_of_val(val))
#define Val_GtkAboutDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_about_dialog_new(value unit)
{
CAMLparam1(unit);
GtkAboutDialog *obj = gtk_about_dialog_new();
CAMLreturn(Val_GtkAboutDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_documenters(value self)
{
CAMLparam1(self);

gtk_about_dialog_get_documenters(GtkAboutDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_authors(value self)
{
CAMLparam1(self);

gtk_about_dialog_get_authors(GtkAboutDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_artists(value self)
{
CAMLparam1(self);

gtk_about_dialog_get_artists(GtkAboutDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_comments(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "comments", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_comments(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "comments", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_copyright(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "copyright", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_copyright(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "copyright", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_license(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "license", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_license(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "license", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_logo_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "logo-icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_logo_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "logo-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_program_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "program-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_program_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "program-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_system_information(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "system-information", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_system_information(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "system-information", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_translator_credits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "translator-credits", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_translator_credits(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "translator-credits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_version(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "version", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_version(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "version", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "website", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "website", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "website-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "website-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_wrap_license(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap-license", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_wrap_license(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap-license", c_value, NULL);
CAMLreturn(Val_unit);
}
