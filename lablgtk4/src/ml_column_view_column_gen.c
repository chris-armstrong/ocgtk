/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewColumn */

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

/* Type-specific conversion macros for GtkColumnViewColumn */
#ifndef Val_GtkColumnViewColumn
#define GtkColumnViewColumn_val(val) ((GtkColumnViewColumn*)ext_of_val(val))
#define Val_GtkColumnViewColumn(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewColumn */


CAMLexport CAMLprim value ml_gtk_column_view_column_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkColumnViewColumn *obj = gtk_column_view_column_new(String_option_val(arg1), Option_val(arg2, GtkListItemFactory_val, NULL));
CAMLreturn(Val_GtkColumnViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_visible(GtkColumnViewColumn_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_title(GtkColumnViewColumn_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_sorter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_sorter(GtkColumnViewColumn_val(self), Option_val(arg1, GtkSorter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_resizable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_resizable(GtkColumnViewColumn_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_id(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_id(GtkColumnViewColumn_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_fixed_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_fixed_width(GtkColumnViewColumn_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_factory(GtkColumnViewColumn_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_expand(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_expand(GtkColumnViewColumn_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_column_get_visible(GtkColumnViewColumn_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_column_view_column_get_title(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_sorter(value self)
{
CAMLparam1(self);

GtkSorter* result = gtk_column_view_column_get_sorter(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkSorter));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_resizable(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_column_get_resizable(GtkColumnViewColumn_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_id(value self)
{
CAMLparam1(self);

const char* result = gtk_column_view_column_get_id(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_fixed_width(value self)
{
CAMLparam1(self);

int result = gtk_column_view_column_get_fixed_width(GtkColumnViewColumn_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_column_view_column_get_factory(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_expand(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_column_get_expand(GtkColumnViewColumn_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_column_view(value self)
{
CAMLparam1(self);

GtkColumnView* result = gtk_column_view_column_get_column_view(GtkColumnViewColumn_val(self));
CAMLreturn(Val_option(result, Val_GtkColumnView));
}
