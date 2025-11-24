/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CheckButton */

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

/* Type-specific conversion macros for GtkCheckButton */
#define GtkCheckButton_val(val) ((GtkCheckButton*)ext_of_val(val))
#define Val_GtkCheckButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_check_button_new(value unit)
{
CAMLparam1(unit);
GtkCheckButton *obj = gtk_check_button_new();
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkCheckButton *obj = gtk_check_button_new_with_label((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkCheckButton *obj = gtk_check_button_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkCheckButton(obj));
}

CAMLexport CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_check_button_set_group(GtkCheckButton_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_check_button_set_child(GtkCheckButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_check_button_get_child(GtkCheckButton_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inconsistent", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inconsistent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCheckButton *obj = (GtkCheckButton *)GtkCheckButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}
