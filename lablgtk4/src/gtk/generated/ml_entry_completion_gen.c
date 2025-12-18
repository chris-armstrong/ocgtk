/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EntryCompletion */

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

/* Type-specific conversion macros for GtkEntryCompletion */
#ifndef Val_GtkEntryCompletion
#define GtkEntryCompletion_val(val) ((GtkEntryCompletion*)ext_of_val(val))
#define Val_GtkEntryCompletion(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEntryCompletion */


CAMLexport CAMLprim value ml_gtk_entry_completion_new(value unit)
{
CAMLparam1(unit);
GtkEntryCompletion *obj = gtk_entry_completion_new();
CAMLreturn(Val_GtkEntryCompletion(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkEntryCompletion *obj = gtk_entry_completion_new_with_area(GtkCellArea_val(arg1));
CAMLreturn(Val_GtkEntryCompletion(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_text_column(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_text_column(GtkEntryCompletion_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_single_match(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_popup_single_match(GtkEntryCompletion_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_set_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_popup_set_width(GtkEntryCompletion_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_completion(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_popup_completion(GtkEntryCompletion_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_model(GtkEntryCompletion_val(self), Option_val(arg1, GtkTreeModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_minimum_key_length(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_minimum_key_length(GtkEntryCompletion_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_inline_selection(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_inline_selection(GtkEntryCompletion_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_inline_completion(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_inline_completion(GtkEntryCompletion_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_insert_prefix(value self)
{
CAMLparam1(self);

gtk_entry_completion_insert_prefix(GtkEntryCompletion_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_text_column(value self)
{
CAMLparam1(self);

int result = gtk_entry_completion_get_text_column(GtkEntryCompletion_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_single_match(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_completion_get_popup_single_match(GtkEntryCompletion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_set_width(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_completion_get_popup_set_width(GtkEntryCompletion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_completion(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_completion_get_popup_completion(GtkEntryCompletion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_entry_completion_get_model(GtkEntryCompletion_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeModel));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_minimum_key_length(value self)
{
CAMLparam1(self);

int result = gtk_entry_completion_get_minimum_key_length(GtkEntryCompletion_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_inline_selection(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_completion_get_inline_selection(GtkEntryCompletion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_inline_completion(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_completion_get_inline_completion(GtkEntryCompletion_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_entry(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_entry_completion_get_entry(GtkEntryCompletion_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_completion_prefix(value self)
{
CAMLparam1(self);

const char* result = gtk_entry_completion_get_completion_prefix(GtkEntryCompletion_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_complete(value self)
{
CAMLparam1(self);

gtk_entry_completion_complete(GtkEntryCompletion_val(self));
CAMLreturn(Val_unit);
}
