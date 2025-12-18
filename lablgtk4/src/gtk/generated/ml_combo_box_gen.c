/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ComboBox */

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

/* Type-specific conversion macros for GtkComboBox */
#ifndef Val_GtkComboBox
#define GtkComboBox_val(val) ((GtkComboBox*)ext_of_val(val))
#define Val_GtkComboBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkComboBox */


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
GtkComboBox *obj = gtk_combo_box_new_with_model(GtkTreeModel_val(arg1));
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_new_with_model_and_entry(value arg1)
{
CAMLparam1(arg1);
GtkComboBox *obj = gtk_combo_box_new_with_model_and_entry(GtkTreeModel_val(arg1));
CAMLreturn(Val_GtkComboBox(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_popup_fixed_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_set_popup_fixed_width(GtkComboBox_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_set_model(GtkComboBox_val(self), Option_val(arg1, GtkTreeModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_id_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_set_id_column(GtkComboBox_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_entry_text_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_set_entry_text_column(GtkComboBox_val(self), Int_val(arg1));
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

gtk_combo_box_set_active_iter(GtkComboBox_val(self), Option_val(arg1, GtkTreeIter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_active_id(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_combo_box_set_active_id(GtkComboBox_val(self), String_option_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_set_active(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_set_active(GtkComboBox_val(self), Int_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_combo_box_get_popup_fixed_width(value self)
{
CAMLparam1(self);

gboolean result = gtk_combo_box_get_popup_fixed_width(GtkComboBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_combo_box_get_model(GtkComboBox_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeModel));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_id_column(value self)
{
CAMLparam1(self);

int result = gtk_combo_box_get_id_column(GtkComboBox_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_has_entry(value self)
{
CAMLparam1(self);

gboolean result = gtk_combo_box_get_has_entry(GtkComboBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_entry_text_column(value self)
{
CAMLparam1(self);

int result = gtk_combo_box_get_entry_text_column(GtkComboBox_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_combo_box_get_child(GtkComboBox_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_button_sensitivity(value self)
{
CAMLparam1(self);

GtkSensitivityType result = gtk_combo_box_get_button_sensitivity(GtkComboBox_val(self));
CAMLreturn(Val_GtkSensitivityType(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active_iter(value self)
{
CAMLparam1(self);
GtkTreeIter out1;

gboolean result = gtk_combo_box_get_active_iter(GtkComboBox_val(self), &out1);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GtkTreeIter(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active_id(value self)
{
CAMLparam1(self);

const char* result = gtk_combo_box_get_active_id(GtkComboBox_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_combo_box_get_active(value self)
{
CAMLparam1(self);

int result = gtk_combo_box_get_active(GtkComboBox_val(self));
CAMLreturn(Val_int(result));
}
