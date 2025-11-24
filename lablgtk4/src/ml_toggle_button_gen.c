/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ToggleButton */

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

/* Type-specific conversion macros for GtkToggleButton */
#define GtkToggleButton_val(val) ((GtkToggleButton*)ext_of_val(val))
#define Val_GtkToggleButton(obj) ((value)(val_of_ext(obj)))


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

gtk_toggle_button_set_group(GtkToggleButton_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkToggleButton *obj = (GtkToggleButton *)GtkToggleButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkToggleButton *obj = (GtkToggleButton *)GtkToggleButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}
