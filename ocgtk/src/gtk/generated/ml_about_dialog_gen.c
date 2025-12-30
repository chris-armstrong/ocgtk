/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AboutDialog */

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


CAMLexport CAMLprim value ml_gtk_about_dialog_new(value unit)
{
CAMLparam1(unit);
GtkAboutDialog *obj = gtk_about_dialog_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkAboutDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_wrap_license(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_wrap_license(GtkAboutDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_website_label(GtkAboutDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_website(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_version(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_version(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_translator_credits(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_translator_credits(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_system_information(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_system_information(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_program_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_program_name(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_logo_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_logo_icon_name(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_license(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_license(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_copyright(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_copyright(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_comments(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_about_dialog_set_comments(GtkAboutDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_wrap_license(value self)
{
CAMLparam1(self);

gboolean result = gtk_about_dialog_get_wrap_license(GtkAboutDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website_label(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_website_label(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_website(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_version(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_version(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_translator_credits(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_translator_credits(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_system_information(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_system_information(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_program_name(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_program_name(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_logo_icon_name(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_logo_icon_name(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_license(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_license(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_copyright(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_copyright(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_comments(value self)
{
CAMLparam1(self);

const char* result = gtk_about_dialog_get_comments(GtkAboutDialog_val(self));
CAMLreturn(Val_option_string(result));
}
