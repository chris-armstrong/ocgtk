/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Calendar */

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

/* Type-specific conversion macros for GtkCalendar */
#define GtkCalendar_val(val) ((GtkCalendar*)ext_of_val(val))
#define Val_GtkCalendar(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_calendar_new(value unit)
{
CAMLparam1(unit);
GtkCalendar *obj = gtk_calendar_new();
CAMLreturn(Val_GtkCalendar(obj));
}

CAMLexport CAMLprim value ml_gtk_calendar_unmark_day(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_calendar_unmark_day(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_mark_day(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_calendar_mark_day(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_day_is_marked(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_calendar_get_day_is_marked(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_clear_marks(value self)
{
CAMLparam1(self);


    gtk_calendar_clear_marks(GtkCalendar_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_day(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "day", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_day(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "day", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_month(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "month", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_month(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "month", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_day_names(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-day-names", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_day_names(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-day-names", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_heading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-heading", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_heading(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-heading", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_week_numbers(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-week-numbers", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_week_numbers(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-week-numbers", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_year(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "year", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_year(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "year", c_value, NULL);
CAMLreturn(Val_unit);
}
