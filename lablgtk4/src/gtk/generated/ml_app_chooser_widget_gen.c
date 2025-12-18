/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserWidget */

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

/* Type-specific conversion macros for GtkAppChooserWidget */
#ifndef Val_GtkAppChooserWidget
#define GtkAppChooserWidget_val(val) ((GtkAppChooserWidget*)ext_of_val(val))
#define Val_GtkAppChooserWidget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAppChooserWidget */


CAMLexport CAMLprim value ml_gtk_app_chooser_widget_new(value arg1)
{
CAMLparam1(arg1);
GtkAppChooserWidget *obj = gtk_app_chooser_widget_new(String_val(arg1));
CAMLreturn(Val_GtkAppChooserWidget(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_default_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-text");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_default_text: property 'default-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "default-text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_default_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-text");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_default_text: property 'default-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "default-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_all(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-all");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_show_all: property 'show-all' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-all", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_all(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-all");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_show_all: property 'show-all' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-all", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-default");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_show_default: property 'show-default' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-default", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_default(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-default");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_show_default: property 'show-default' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-default", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-fallback");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_show_fallback: property 'show-fallback' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-fallback", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_fallback(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-fallback");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_show_fallback: property 'show-fallback' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-fallback", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_other(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-other");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_show_other: property 'show-other' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-other", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_other(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-other");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_show_other: property 'show-other' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-other", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_recommended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-recommended");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_get_show_recommended: property 'show-recommended' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-recommended", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_recommended(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-recommended");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_widget_set_show_recommended: property 'show-recommended' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-recommended", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
