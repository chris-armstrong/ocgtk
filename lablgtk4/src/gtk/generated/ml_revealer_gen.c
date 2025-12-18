/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Revealer */

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

/* Type-specific conversion macros for GtkRevealer */
#ifndef Val_GtkRevealer
#define GtkRevealer_val(val) ((GtkRevealer*)ext_of_val(val))
#define Val_GtkRevealer(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkRevealer */


CAMLexport CAMLprim value ml_gtk_revealer_new(value unit)
{
CAMLparam1(unit);
GtkRevealer *obj = gtk_revealer_new();
CAMLreturn(Val_GtkRevealer(obj));
}

CAMLexport CAMLprim value ml_gtk_revealer_set_transition_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_revealer_set_transition_type(GtkRevealer_val(self), GtkRevealerTransitionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_revealer_set_child(GtkRevealer_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_transition_type(value self)
{
CAMLparam1(self);

GtkRevealerTransitionType result = gtk_revealer_get_transition_type(GtkRevealer_val(self));
CAMLreturn(Val_GtkRevealerTransitionType(result));
}

CAMLexport CAMLprim value ml_gtk_revealer_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_revealer_get_child(GtkRevealer_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_revealer_get_child_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "child-revealed");
if (pspec == NULL) caml_failwith("ml_gtk_revealer_get_child_revealed: property 'child-revealed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "child-revealed", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_reveal_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "reveal-child");
if (pspec == NULL) caml_failwith("ml_gtk_revealer_get_reveal_child: property 'reveal-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "reveal-child", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_reveal_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "reveal-child");
if (pspec == NULL) caml_failwith("ml_gtk_revealer_set_reveal_child: property 'reveal-child' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "reveal-child", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_transition_duration(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "transition-duration");
if (pspec == NULL) caml_failwith("ml_gtk_revealer_get_transition_duration: property 'transition-duration' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "transition-duration", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_transition_duration(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "transition-duration");
if (pspec == NULL) caml_failwith("ml_gtk_revealer_set_transition_duration: property 'transition-duration' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "transition-duration", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
