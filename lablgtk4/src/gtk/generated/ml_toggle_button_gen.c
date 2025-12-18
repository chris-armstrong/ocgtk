/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ToggleButton */

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

/* Type-specific conversion macros for GtkToggleButton */
#ifndef Val_GtkToggleButton
#define GtkToggleButton_val(val) ((GtkToggleButton*)ext_of_val(val))
#define Val_GtkToggleButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkToggleButton */


CAMLexport CAMLprim value ml_gtk_toggle_button_new(value unit)
{
CAMLparam1(unit);
GtkToggleButton *obj = gtk_toggle_button_new();
CAMLreturn(Val_GtkToggleButton(obj));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkToggleButton *obj = gtk_toggle_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkToggleButton(obj));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkToggleButton *obj = gtk_toggle_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkToggleButton(obj));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_toggled(value self)
{
CAMLparam1(self);

gtk_toggle_button_toggled(GtkToggleButton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_toggle_button_set_group(GtkToggleButton_val(self), Option_val(arg1, GtkToggleButton_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkToggleButton *obj = (GtkToggleButton *)GtkToggleButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_toggle_button_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkToggleButton *obj = (GtkToggleButton *)GtkToggleButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_toggle_button_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
