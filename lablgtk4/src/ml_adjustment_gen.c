/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Adjustment */

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

/* Type-specific conversion macros for GtkAdjustment */
#define GtkAdjustment_val(val) ((GtkAdjustment*)ext_of_val(val))
#define Val_GtkAdjustment(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_adjustment_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GtkAdjustment *obj = gtk_adjustment_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_GtkAdjustment(obj));
}

CAMLexport CAMLprim value ml_gtk_adjustment_new_bytecode(value * argv, int argn)
{
return ml_gtk_adjustment_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_minimum_increment(value self)
{
CAMLparam1(self);

double result = gtk_adjustment_get_minimum_increment(GtkAdjustment_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_adjustment_configure_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

gtk_adjustment_configure(GtkAdjustment_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_configure_bytecode(value * argv, int argn)
{
return ml_gtk_adjustment_configure_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_adjustment_clamp_page(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_adjustment_clamp_page(GtkAdjustment_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_lower(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "lower", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_lower(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "lower", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_page_increment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "page-increment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_page_increment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "page-increment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_page_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "page-size", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_page_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "page-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_step_increment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "step-increment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_step_increment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "step-increment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_upper(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "upper", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_upper(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "upper", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAdjustment *obj = (GtkAdjustment *)GtkAdjustment_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}
