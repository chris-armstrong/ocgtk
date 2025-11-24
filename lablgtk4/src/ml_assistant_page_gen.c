/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AssistantPage */

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

/* Type-specific conversion macros for GtkAssistantPage */
#define GtkAssistantPage_val(val) ((GtkAssistantPage*)ext_of_val(val))
#define Val_GtkAssistantPage(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_assistant_page_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_assistant_page_get_child(GtkAssistantPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_page_get_complete(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAssistantPage *obj = (GtkAssistantPage *)GtkAssistantPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "complete", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_assistant_page_set_complete(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAssistantPage *obj = (GtkAssistantPage *)GtkAssistantPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "complete", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_page_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAssistantPage *obj = (GtkAssistantPage *)GtkAssistantPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_assistant_page_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAssistantPage *obj = (GtkAssistantPage *)GtkAssistantPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}
