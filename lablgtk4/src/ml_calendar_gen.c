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

CAMLexport CAMLprim value ml_gtk_calendar_set_year(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_year(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_week_numbers(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_show_week_numbers(GtkCalendar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_heading(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_show_heading(GtkCalendar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_show_day_names(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_show_day_names(GtkCalendar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_month(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_month(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_set_day(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_set_day(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_mark_day(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_calendar_mark_day(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_calendar_get_year(value self)
{
CAMLparam1(self);

int result = gtk_calendar_get_year(GtkCalendar_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_week_numbers(value self)
{
CAMLparam1(self);

gboolean result = gtk_calendar_get_show_week_numbers(GtkCalendar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_heading(value self)
{
CAMLparam1(self);

gboolean result = gtk_calendar_get_show_heading(GtkCalendar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_show_day_names(value self)
{
CAMLparam1(self);

gboolean result = gtk_calendar_get_show_day_names(GtkCalendar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_month(value self)
{
CAMLparam1(self);

int result = gtk_calendar_get_month(GtkCalendar_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_day_is_marked(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_calendar_get_day_is_marked(GtkCalendar_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_get_day(value self)
{
CAMLparam1(self);

int result = gtk_calendar_get_day(GtkCalendar_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_calendar_clear_marks(value self)
{
CAMLparam1(self);

gtk_calendar_clear_marks(GtkCalendar_val(self));
CAMLreturn(Val_unit);
}
