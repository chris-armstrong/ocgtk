/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InfoBar */

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

/* Type-specific conversion macros for GtkInfoBar */
#ifndef Val_GtkInfoBar
#define GtkInfoBar_val(val) ((GtkInfoBar*)ext_of_val(val))
#define Val_GtkInfoBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkInfoBar */


CAMLexport CAMLprim value ml_gtk_info_bar_new(value unit)
{
CAMLparam1(unit);
GtkInfoBar *obj = gtk_info_bar_new();
CAMLreturn(Val_GtkInfoBar(obj));
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_response_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_info_bar_set_response_sensitive(GtkInfoBar_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_message_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_set_message_type(GtkInfoBar_val(self), GtkMessageType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_default_response(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_set_default_response(GtkInfoBar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_response(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_response(GtkInfoBar_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_remove_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_remove_child(GtkInfoBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_remove_action_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_remove_action_widget(GtkInfoBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_message_type(value self)
{
CAMLparam1(self);

GtkMessageType result = gtk_info_bar_get_message_type(GtkInfoBar_val(self));
CAMLreturn(Val_GtkMessageType(result));
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_info_bar_add_child(GtkInfoBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_button(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkWidget* result = gtk_info_bar_add_button(GtkInfoBar_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_info_bar_add_action_widget(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_info_bar_add_action_widget(GtkInfoBar_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInfoBar *obj = (GtkInfoBar *)GtkInfoBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "revealed");
if (pspec == NULL) caml_failwith("ml_gtk_info_bar_get_revealed: property 'revealed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "revealed", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_revealed(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInfoBar *obj = (GtkInfoBar *)GtkInfoBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "revealed");
if (pspec == NULL) caml_failwith("ml_gtk_info_bar_set_revealed: property 'revealed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "revealed", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_info_bar_get_show_close_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkInfoBar *obj = (GtkInfoBar *)GtkInfoBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-close-button");
if (pspec == NULL) caml_failwith("ml_gtk_info_bar_get_show_close_button: property 'show-close-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-close-button", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_info_bar_set_show_close_button(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkInfoBar *obj = (GtkInfoBar *)GtkInfoBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-close-button");
if (pspec == NULL) caml_failwith("ml_gtk_info_bar_set_show_close_button: property 'show-close-button' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-close-button", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
