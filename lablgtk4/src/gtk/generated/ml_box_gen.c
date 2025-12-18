/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Box */

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

/* Type-specific conversion macros for GtkBox */
#ifndef Val_GtkBox
#define GtkBox_val(val) ((GtkBox*)ext_of_val(val))
#define Val_GtkBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBox */


CAMLexport CAMLprim value ml_gtk_box_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBox *obj = gtk_box_new(GtkOrientation_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkBox(obj));
}

CAMLexport CAMLprim value ml_gtk_box_set_spacing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_set_spacing(GtkBox_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_set_homogeneous(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_set_homogeneous(GtkBox_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_set_baseline_position(GtkBox_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_set_baseline_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_set_baseline_child(GtkBox_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_reorder_child_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_box_reorder_child_after(GtkBox_val(self), GtkWidget_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_remove(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_prepend(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_prepend(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_insert_child_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_box_insert_child_after(GtkBox_val(self), GtkWidget_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_box_get_spacing(value self)
{
CAMLparam1(self);

int result = gtk_box_get_spacing(GtkBox_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_box_get_homogeneous(value self)
{
CAMLparam1(self);

gboolean result = gtk_box_get_homogeneous(GtkBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_box_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_box_get_baseline_position(GtkBox_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}

CAMLexport CAMLprim value ml_gtk_box_get_baseline_child(value self)
{
CAMLparam1(self);

int result = gtk_box_get_baseline_child(GtkBox_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_box_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_box_append(GtkBox_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
