/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CenterBox */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCenterBox */
#ifndef Val_GtkCenterBox
#define GtkCenterBox_val(val) ((GtkCenterBox*)ext_of_val(val))
#define Val_GtkCenterBox(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCenterBox */


CAMLexport CAMLprim value ml_gtk_center_box_new(value unit)
{
CAMLparam1(unit);
GtkCenterBox *obj = gtk_center_box_new();
CAMLreturn(Val_GtkCenterBox(obj));
}

CAMLexport CAMLprim value ml_gtk_center_box_set_start_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_start_widget(GtkCenterBox_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_shrink_center_last(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_shrink_center_last(GtkCenterBox_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_end_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_end_widget(GtkCenterBox_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_center_widget(GtkCenterBox_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_set_baseline_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_center_box_set_baseline_position(GtkCenterBox_val(self), GtkBaselinePosition_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_center_box_get_start_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_start_widget(GtkCenterBox_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_shrink_center_last(value self)
{
CAMLparam1(self);

gboolean result = gtk_center_box_get_shrink_center_last(GtkCenterBox_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_end_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_end_widget(GtkCenterBox_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_center_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_center_box_get_center_widget(GtkCenterBox_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_center_box_get_baseline_position(value self)
{
CAMLparam1(self);

GtkBaselinePosition result = gtk_center_box_get_baseline_position(GtkCenterBox_val(self));
CAMLreturn(Val_GtkBaselinePosition(result));
}
