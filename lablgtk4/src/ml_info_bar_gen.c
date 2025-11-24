/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InfoBar */

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


CAMLexport CAMLprim value ml_gtk_info_bar_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_info_bar_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_info_bar_new_with_buttons(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_info_bar_new_with_buttons((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_response_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_info_bar_set_response_sensitive(GtkWidget_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_message_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_set_message_type(GtkWidget_val(self), GtkMessageType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_default_response(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_set_default_response(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_response(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_response(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_remove_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_remove_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_remove_action_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_message_type(value self)
{
CAMLparam1(self);


    GtkMessageType result = gtk_info_bar_get_message_type(GtkWidget_val(self));
CAMLreturn(Val_GtkMessageType(result));
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_info_bar_add_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_button(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkWidget* result = gtk_info_bar_add_button(GtkWidget_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_action_widget(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_info_bar_add_action_widget(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "revealed", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_revealed(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "revealed", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_show_close_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-close-button", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_show_close_button(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-close-button", c_value, NULL);
CAMLreturn(Val_unit);
}
