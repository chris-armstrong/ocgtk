/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Calendar */

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

/* Type-specific conversion macros for GtkCalendar */
#ifndef Val_GtkCalendar
#define GtkCalendar_val(val) ((GtkCalendar*)ext_of_val(val))
#define Val_GtkCalendar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCalendar */


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
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "day");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_day: property 'day' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "day", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_day(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "day");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_day: property 'day' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "day", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_month(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "month");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_month: property 'month' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "month", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_month(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "month");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_month: property 'month' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "month", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_day_names(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-day-names");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_show_day_names: property 'show-day-names' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-day-names", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_day_names(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-day-names");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_show_day_names: property 'show-day-names' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-day-names", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_heading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-heading");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_show_heading: property 'show-heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-heading", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_heading(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-heading");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_show_heading: property 'show-heading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-heading", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_week_numbers(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-week-numbers");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_show_week_numbers: property 'show-week-numbers' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-week-numbers", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_week_numbers(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-week-numbers");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_show_week_numbers: property 'show-week-numbers' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-week-numbers", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_year(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "year");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_get_year: property 'year' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "year", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_year(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCalendar *obj = (GtkCalendar *)GtkCalendar_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "year");
if (pspec == NULL) caml_failwith("ml_gtk_calendar_set_year: property 'year' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "year", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
