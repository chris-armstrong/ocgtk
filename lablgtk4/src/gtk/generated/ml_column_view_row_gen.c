/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewRow */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkColumnViewRow */
#ifndef Val_GtkColumnViewRow
#define GtkColumnViewRow_val(val) ((GtkColumnViewRow*)ext_of_val(val))
#define Val_GtkColumnViewRow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColumnViewRow */


CAMLexport CAMLprim value ml_gtk_column_view_row_set_selectable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_row_set_selectable(GtkColumnViewRow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_row_set_focusable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_row_set_focusable(GtkColumnViewRow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_row_set_activatable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_row_set_activatable(GtkColumnViewRow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_row_set_accessible_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_row_set_accessible_label(GtkColumnViewRow_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_row_set_accessible_description(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_row_set_accessible_description(GtkColumnViewRow_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_selected(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_row_get_selected(GtkColumnViewRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_selectable(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_row_get_selectable(GtkColumnViewRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_position(value self)
{
CAMLparam1(self);

guint result = gtk_column_view_row_get_position(GtkColumnViewRow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_focusable(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_row_get_focusable(GtkColumnViewRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_activatable(value self)
{
CAMLparam1(self);

gboolean result = gtk_column_view_row_get_activatable(GtkColumnViewRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_accessible_label(value self)
{
CAMLparam1(self);

const char* result = gtk_column_view_row_get_accessible_label(GtkColumnViewRow_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_row_get_accessible_description(value self)
{
CAMLparam1(self);

const char* result = gtk_column_view_row_get_accessible_description(GtkColumnViewRow_val(self));
CAMLreturn(caml_copy_string(result));
}
