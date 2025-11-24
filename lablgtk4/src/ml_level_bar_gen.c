/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LevelBar */

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

/* Type-specific conversion macros for GtkLevelBar */
#define GtkLevelBar_val(val) ((GtkLevelBar*)ext_of_val(val))
#define Val_GtkLevelBar(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_level_bar_new(value unit)
{
CAMLparam1(unit);
GtkLevelBar *obj = gtk_level_bar_new();
CAMLreturn(Val_GtkLevelBar(obj));
}

CAMLexport CAMLprim value ml_gtk_level_bar_new_for_interval(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkLevelBar *obj = gtk_level_bar_new_for_interval(Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_GtkLevelBar(obj));
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_mode(GtkLevelBar_val(self), GtkLevelBarMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_remove_offset_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_remove_offset_value(GtkLevelBar_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_mode(value self)
{
CAMLparam1(self);

GtkLevelBarMode result = gtk_level_bar_get_mode(GtkLevelBar_val(self));
CAMLreturn(Val_GtkLevelBarMode(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_add_offset_value(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_level_bar_add_offset_value(GtkLevelBar_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_max_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "max-value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_max_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "max-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_min_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "min-value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_min_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "min-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLevelBar *obj = (GtkLevelBar *)GtkLevelBar_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}
