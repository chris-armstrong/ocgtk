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
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkAboutDialog */
#ifndef Val_GtkAboutDialog
#define GtkAboutDialog_val(val) ((GtkAboutDialog*)ext_of_val(val))
#define Val_GtkAboutDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAboutDialog */


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
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "comments");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_comments: property 'comments' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "comments", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_comments(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "comments");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_comments: property 'comments' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "comments", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_copyright(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "copyright");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_copyright: property 'copyright' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "copyright", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_copyright(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "copyright");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_copyright: property 'copyright' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "copyright", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_license(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "license");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_license: property 'license' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "license", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_license(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "license");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_license: property 'license' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "license", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_logo_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "logo-icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_logo_icon_name: property 'logo-icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "logo-icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_logo_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "logo-icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_logo_icon_name: property 'logo-icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "logo-icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_program_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "program-name");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_program_name: property 'program-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "program-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_program_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "program-name");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_program_name: property 'program-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "program-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_system_information(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "system-information");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_system_information: property 'system-information' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "system-information", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_system_information(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "system-information");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_system_information: property 'system-information' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "system-information", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_translator_credits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "translator-credits");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_translator_credits: property 'translator-credits' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "translator-credits", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_translator_credits(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "translator-credits");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_translator_credits: property 'translator-credits' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "translator-credits", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_version(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "version");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_version: property 'version' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "version", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_version(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "version");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_version: property 'version' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "version", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "website");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_website: property 'website' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "website", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "website");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_website: property 'website' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "website", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_website_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "website-label");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_website_label: property 'website-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "website-label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_website_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "website-label");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_website_label: property 'website-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "website-label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_get_wrap_license(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "wrap-license");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_get_wrap_license: property 'wrap-license' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "wrap-license", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_about_dialog_set_wrap_license(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAboutDialog *obj = (GtkAboutDialog *)GtkAboutDialog_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "wrap-license");
if (pspec == NULL) caml_failwith("ml_gtk_about_dialog_set_wrap_license: property 'wrap-license' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "wrap-license", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
