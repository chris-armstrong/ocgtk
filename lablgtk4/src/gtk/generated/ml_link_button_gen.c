/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LinkButton */

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

/* Type-specific conversion macros for GtkLinkButton */
#ifndef Val_GtkLinkButton
#define GtkLinkButton_val(val) ((GtkLinkButton*)ext_of_val(val))
#define Val_GtkLinkButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkLinkButton */


CAMLexport CAMLprim value ml_gtk_link_button_new(value arg1)
{
CAMLparam1(arg1);
GtkLinkButton *obj = gtk_link_button_new(String_val(arg1));
CAMLreturn(Val_GtkLinkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_link_button_new_with_label(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkLinkButton *obj = gtk_link_button_new_with_label(String_val(arg1), String_option_val(arg2));
CAMLreturn(Val_GtkLinkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "uri");
if (pspec == NULL) caml_failwith("ml_gtk_link_button_get_uri: property 'uri' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "uri", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_uri(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "uri");
if (pspec == NULL) caml_failwith("ml_gtk_link_button_set_uri: property 'uri' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "uri", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visited");
if (pspec == NULL) caml_failwith("ml_gtk_link_button_get_visited: property 'visited' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "visited", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_visited(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visited");
if (pspec == NULL) caml_failwith("ml_gtk_link_button_set_visited: property 'visited' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "visited", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
