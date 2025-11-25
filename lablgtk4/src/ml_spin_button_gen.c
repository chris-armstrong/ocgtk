/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SpinButton */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSpinButton */
#ifndef Val_GtkSpinButton
#define GtkSpinButton_val(val) ((GtkSpinButton*)ext_of_val(val))
#define Val_GtkSpinButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSpinButton */


CAMLexport CAMLprim value ml_gtk_spin_button_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkSpinButton *obj = gtk_spin_button_new(Option_val(arg1, GtkAdjustment_val, NULL), Double_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkSpinButton(obj));
}

CAMLexport CAMLprim value ml_gtk_spin_button_new_with_range(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkSpinButton *obj = gtk_spin_button_new_with_range(Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_GtkSpinButton(obj));
}

CAMLexport CAMLprim value ml_gtk_spin_button_update(value self)
{
CAMLparam1(self);

gtk_spin_button_update(GtkSpinButton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_spin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_spin_button_spin(GtkSpinButton_val(self), GtkSpinType_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_wrap(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_wrap(GtkSpinButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_value(GtkSpinButton_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_update_policy(GtkSpinButton_val(self), GtkSpinButtonUpdatePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_snap_to_ticks(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_snap_to_ticks(GtkSpinButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_spin_button_set_range(GtkSpinButton_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_numeric(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_numeric(GtkSpinButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_spin_button_set_increments(GtkSpinButton_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_digits(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_digits(GtkSpinButton_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_climb_rate(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_climb_rate(GtkSpinButton_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_adjustment(GtkSpinButton_val(self), GtkAdjustment_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_activates_default(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_spin_button_set_activates_default(GtkSpinButton_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_wrap(value self)
{
CAMLparam1(self);

gboolean result = gtk_spin_button_get_wrap(GtkSpinButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_value_as_int(value self)
{
CAMLparam1(self);

int result = gtk_spin_button_get_value_as_int(GtkSpinButton_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_value(value self)
{
CAMLparam1(self);

double result = gtk_spin_button_get_value(GtkSpinButton_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_update_policy(value self)
{
CAMLparam1(self);

GtkSpinButtonUpdatePolicy result = gtk_spin_button_get_update_policy(GtkSpinButton_val(self));
CAMLreturn(Val_GtkSpinButtonUpdatePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_snap_to_ticks(value self)
{
CAMLparam1(self);

gboolean result = gtk_spin_button_get_snap_to_ticks(GtkSpinButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_numeric(value self)
{
CAMLparam1(self);

gboolean result = gtk_spin_button_get_numeric(GtkSpinButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_digits(value self)
{
CAMLparam1(self);

guint result = gtk_spin_button_get_digits(GtkSpinButton_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_climb_rate(value self)
{
CAMLparam1(self);

double result = gtk_spin_button_get_climb_rate(GtkSpinButton_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_adjustment(value self)
{
CAMLparam1(self);

GtkAdjustment* result = gtk_spin_button_get_adjustment(GtkSpinButton_val(self));
CAMLreturn(Val_GtkAdjustment(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_activates_default(value self)
{
CAMLparam1(self);

gboolean result = gtk_spin_button_get_activates_default(GtkSpinButton_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_configure(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_spin_button_configure(GtkSpinButton_val(self), Option_val(arg1, GtkAdjustment_val, NULL), Double_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}
