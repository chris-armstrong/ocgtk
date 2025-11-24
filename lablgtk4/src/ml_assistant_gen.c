/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Assistant */

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


CAMLexport CAMLprim value ml_gtk_assistant_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_assistant_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_assistant_update_buttons_state(value self)
{
CAMLparam1(self);


    gtk_assistant_update_buttons_state(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_type(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_assistant_set_page_type(GtkWidget_val(self), GtkWidget_val(arg1), GtkAssistantPageType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_title(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_assistant_set_page_title(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_page_complete(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_assistant_set_page_complete(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_forward_page_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_assistant_set_forward_page_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_set_current_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_assistant_set_current_page(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_remove_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_assistant_remove_page(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_remove_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_assistant_remove_action_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_previous_page(value self)
{
CAMLparam1(self);


    gtk_assistant_previous_page(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_prepend_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_assistant_prepend_page(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_next_page(value self)
{
CAMLparam1(self);


    gtk_assistant_next_page(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_insert_page(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_assistant_insert_page(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkAssistantPageType result = gtk_assistant_get_page_type(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkAssistantPageType(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_title(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_assistant_get_page_title(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page_complete(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_assistant_get_page_complete(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkAssistantPage* result = gtk_assistant_get_page(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_nth_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkWidget* result = gtk_assistant_get_nth_page(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_n_pages(value self)
{
CAMLparam1(self);


    int result = gtk_assistant_get_n_pages(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_get_current_page(value self)
{
CAMLparam1(self);


    int result = gtk_assistant_get_current_page(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_commit(value self)
{
CAMLparam1(self);


    gtk_assistant_commit(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_append_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_assistant_append_page(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_assistant_add_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_assistant_add_action_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_assistant_get_use_header_bar(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "use-header-bar", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
