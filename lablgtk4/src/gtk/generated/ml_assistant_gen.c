/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Assistant */

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

/* Type-specific conversion macros for GtkAssistant */
#ifndef Val_GtkAssistant
#define GtkAssistant_val(val) ((GtkAssistant*)ext_of_val(val))
#define Val_GtkAssistant(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAssistant */


CAMLexport CAMLprim value ml_gtk_assistant_new(value unit)
{
CAMLparam1(unit);
GtkAssistant *obj = gtk_assistant_new();
CAMLreturn(Val_GtkAssistant(obj));
}

CAMLexport CAMLprim value ml_gtk_assistant_update_buttons_state(value self)
{
CAMLparam1(self);

gtk_assistant_update_buttons_state(GtkAssistant_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_type(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_assistant_set_page_type(GtkAssistant_val(self), GtkWidget_val(arg1), GtkAssistantPageType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_title(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_assistant_set_page_title(GtkAssistant_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_complete(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_assistant_set_page_complete(GtkAssistant_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_current_page(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_assistant_set_current_page(GtkAssistant_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_remove_page(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_assistant_remove_page(GtkAssistant_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_remove_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_assistant_remove_action_widget(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_previous_page(value self)
{
CAMLparam1(self);

gtk_assistant_previous_page(GtkAssistant_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_prepend_page(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_assistant_prepend_page(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_next_page(value self)
{
CAMLparam1(self);

gtk_assistant_next_page(GtkAssistant_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_insert_page(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

int result = gtk_assistant_insert_page(GtkAssistant_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_type(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkAssistantPageType result = gtk_assistant_get_page_type(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkAssistantPageType(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_title(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gtk_assistant_get_page_title(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_complete(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_assistant_get_page_complete(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkAssistantPage* result = gtk_assistant_get_page(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkAssistantPage(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_nth_page(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkWidget* result = gtk_assistant_get_nth_page(GtkAssistant_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_n_pages(value self)
{
CAMLparam1(self);

int result = gtk_assistant_get_n_pages(GtkAssistant_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_current_page(value self)
{
CAMLparam1(self);

int result = gtk_assistant_get_current_page(GtkAssistant_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_commit(value self)
{
CAMLparam1(self);

gtk_assistant_commit(GtkAssistant_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_append_page(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_assistant_append_page(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_add_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_assistant_add_action_widget(GtkAssistant_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
