/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SearchEntry */

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

/* Type-specific conversion macros for GtkSearchEntry */
#ifndef Val_GtkSearchEntry
#define GtkSearchEntry_val(val) ((GtkSearchEntry*)ext_of_val(val))
#define Val_GtkSearchEntry(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSearchEntry */


CAMLexport CAMLprim value ml_gtk_search_entry_new(value unit)
{
CAMLparam1(unit);
GtkSearchEntry *obj = gtk_search_entry_new();
CAMLreturn(Val_GtkSearchEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_search_delay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_entry_set_search_delay(GtkSearchEntry_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_entry_set_placeholder_text(GtkSearchEntry_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_entry_set_key_capture_widget(GtkSearchEntry_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_entry_set_input_purpose(GtkSearchEntry_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_entry_set_input_hints(GtkSearchEntry_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_search_delay(value self)
{
CAMLparam1(self);

guint result = gtk_search_entry_get_search_delay(GtkSearchEntry_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_placeholder_text(value self)
{
CAMLparam1(self);

const char* result = gtk_search_entry_get_placeholder_text(GtkSearchEntry_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_key_capture_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_search_entry_get_key_capture_widget(GtkSearchEntry_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_input_purpose(value self)
{
CAMLparam1(self);

GtkInputPurpose result = gtk_search_entry_get_input_purpose(GtkSearchEntry_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_input_hints(value self)
{
CAMLparam1(self);

GtkInputHints result = gtk_search_entry_get_input_hints(GtkSearchEntry_val(self));
CAMLreturn(Val_GtkInputHints(result));
}
