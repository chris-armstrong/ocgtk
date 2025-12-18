/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserDialog */

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

/* Type-specific conversion macros for GtkAppChooserDialog */
#ifndef Val_GtkAppChooserDialog
#define GtkAppChooserDialog_val(val) ((GtkAppChooserDialog*)ext_of_val(val))
#define Val_GtkAppChooserDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAppChooserDialog */


CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkAppChooserDialog *obj = gtk_app_chooser_dialog_new(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), arg3);
CAMLreturn(Val_GtkAppChooserDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new_for_content_type(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkAppChooserDialog *obj = gtk_app_chooser_dialog_new_for_content_type(Option_val(arg1, GtkWindow_val, NULL), GtkDialogFlags_val(arg2), String_val(arg3));
CAMLreturn(Val_GtkAppChooserDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_app_chooser_dialog_get_widget(GtkAppChooserDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_heading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooserDialog *obj = (GtkAppChooserDialog *)GtkAppChooserDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "heading");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_dialog_get_heading: property 'heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "heading", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_set_heading(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkAppChooserDialog *obj = (GtkAppChooserDialog *)GtkAppChooserDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "heading");
if (pspec == NULL) caml_failwith("ml_gtk_app_chooser_dialog_set_heading: property 'heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "heading", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
