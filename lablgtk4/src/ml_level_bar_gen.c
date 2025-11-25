/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LevelBar */

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

/* Type-specific conversion macros for GtkLevelBar */
#ifndef Val_GtkLevelBar
#define GtkLevelBar_val(val) ((GtkLevelBar*)ext_of_val(val))
#define Val_GtkLevelBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkLevelBar */


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

CAMLexport CAMLprim value ml_gtk_level_bar_set_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_value(GtkLevelBar_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_mode(GtkLevelBar_val(self), GtkLevelBarMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_min_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_min_value(GtkLevelBar_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_max_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_max_value(GtkLevelBar_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_inverted(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_set_inverted(GtkLevelBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_remove_offset_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_level_bar_remove_offset_value(GtkLevelBar_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_value(value self)
{
CAMLparam1(self);

double result = gtk_level_bar_get_value(GtkLevelBar_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_mode(value self)
{
CAMLparam1(self);

GtkLevelBarMode result = gtk_level_bar_get_mode(GtkLevelBar_val(self));
CAMLreturn(Val_GtkLevelBarMode(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_min_value(value self)
{
CAMLparam1(self);

double result = gtk_level_bar_get_min_value(GtkLevelBar_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_max_value(value self)
{
CAMLparam1(self);

double result = gtk_level_bar_get_max_value(GtkLevelBar_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_inverted(value self)
{
CAMLparam1(self);

gboolean result = gtk_level_bar_get_inverted(GtkLevelBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_add_offset_value(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_level_bar_add_offset_value(GtkLevelBar_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}
