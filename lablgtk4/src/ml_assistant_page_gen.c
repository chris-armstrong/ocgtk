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
#ifndef Val_GtkAssistantPage
#define GtkAssistantPage_val(val) ((GtkAssistantPage*)ext_of_val(val))
#define Val_GtkAssistantPage(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAssistantPage */


CAMLexport CAMLprim value ml_gtk_assistant_page_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_assistant_page_get_child(GtkAssistantPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}
