/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserWidget */

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

/* Type-specific conversion macros for GtkAppChooserWidget */
#define GtkAppChooserWidget_val(val) ((GtkAppChooserWidget*)ext_of_val(val))
#define Val_GtkAppChooserWidget(obj) ((value)(val_of_ext(obj)))


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
gchar* prop_value;
g_object_get(G_OBJECT(obj), "default-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_default_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "default-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_all(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-all", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_all(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-all", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_fallback(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-fallback", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_other(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-other", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_other(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-other", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_get_show_recommended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-recommended", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_widget_set_show_recommended(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAppChooserWidget *obj = (GtkAppChooserWidget *)GtkAppChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-recommended", c_value, NULL);
CAMLreturn(Val_unit);
}
