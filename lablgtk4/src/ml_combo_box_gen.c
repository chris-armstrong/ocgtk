/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ComboBox */

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

/* Type-specific conversion macros for GtkComboBox */
#define GtkComboBox_val(val) ((GtkComboBox*)ext_of_val(val))
#define Val_GtkComboBox(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_combo_box_new(value unit)
{
CAMLparam1(unit);
GtkComboBox *obj = gtk_combo_box_new();
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_new_with_entry(value unit)
{
CAMLparam1(unit);
GtkComboBox *obj = gtk_combo_box_new_with_entry();
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_new_with_model(value arg1)
{
CAMLparam1(arg1);
GtkComboBox *obj = gtk_combo_box_new_with_model(GtkWidget_val(arg1));
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_new_with_model_and_entry(value arg1)
{
CAMLparam1(arg1);
GtkComboBox *obj = gtk_combo_box_new_with_model_and_entry(GtkWidget_val(arg1));
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_combo_box_set_model(GtkComboBox_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_combo_box_set_child(GtkComboBox_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_button_sensitivity(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_combo_box_set_button_sensitivity(GtkComboBox_val(self), GtkSensitivityType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_active_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_combo_box_set_active_iter(GtkComboBox_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_popup(value self)
{
CAMLparam1(self);


    gtk_combo_box_popup(GtkComboBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_popdown(value self)
{
CAMLparam1(self);


    gtk_combo_box_popdown(GtkComboBox_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_model(value self)
{
CAMLparam1(self);


    GtkTreeModel* result = gtk_combo_box_get_model(GtkComboBox_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_combo_box_get_child(GtkComboBox_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_button_sensitivity(value self)
{
CAMLparam1(self);


    GtkSensitivityType result = gtk_combo_box_get_button_sensitivity(GtkComboBox_val(self));
CAMLreturn(Val_GtkSensitivityType(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_combo_box_get_active_iter(GtkComboBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "active-id", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_active_id(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "active-id", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_entry_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "entry-text-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_entry_text_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "entry-text-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_has_entry(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-entry", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_id_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "id-column", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_id_column(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "id-column", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_popup_fixed_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "popup-fixed-width", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_popup_fixed_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "popup-fixed-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_popup_shown(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkComboBox *obj = (GtkComboBox *)GtkComboBox_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "popup-shown", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
