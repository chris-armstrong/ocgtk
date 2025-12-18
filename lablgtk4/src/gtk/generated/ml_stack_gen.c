/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Stack */

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

/* Type-specific conversion macros for GtkStack */
#ifndef Val_GtkStack
#define GtkStack_val(val) ((GtkStack*)ext_of_val(val))
#define Val_GtkStack(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStack */


CAMLexport CAMLprim value ml_gtk_stack_new(value unit)
{
CAMLparam1(unit);
GtkStack *obj = gtk_stack_new();
CAMLreturn(Val_GtkStack(obj));
}

CAMLexport CAMLprim value ml_gtk_stack_set_visible_child_full(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_stack_set_visible_child_full(GtkStack_val(self), String_val(arg1), GtkStackTransitionType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_set_visible_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_stack_set_visible_child(GtkStack_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_set_transition_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_stack_set_transition_type(GtkStack_val(self), GtkStackTransitionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_stack_remove(GtkStack_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_get_visible_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_stack_get_visible_child(GtkStack_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_stack_get_transition_type(value self)
{
CAMLparam1(self);

GtkStackTransitionType result = gtk_stack_get_transition_type(GtkStack_val(self));
CAMLreturn(Val_GtkStackTransitionType(result));
}

CAMLexport CAMLprim value ml_gtk_stack_get_pages(value self)
{
CAMLparam1(self);

GtkSelectionModel* result = gtk_stack_get_pages(GtkStack_val(self));
CAMLreturn(Val_GtkSelectionModel(result));
}

CAMLexport CAMLprim value ml_gtk_stack_get_page(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkStackPage* result = gtk_stack_get_page(GtkStack_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkStackPage(result));
}

CAMLexport CAMLprim value ml_gtk_stack_get_child_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkWidget* result = gtk_stack_get_child_by_name(GtkStack_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_stack_add_titled(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

GtkStackPage* result = gtk_stack_add_titled(GtkStack_val(self), GtkWidget_val(arg1), String_option_val(arg2), String_val(arg3));
CAMLreturn(Val_GtkStackPage(result));
}

CAMLexport CAMLprim value ml_gtk_stack_add_named(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkStackPage* result = gtk_stack_add_named(GtkStack_val(self), GtkWidget_val(arg1), String_option_val(arg2));
CAMLreturn(Val_GtkStackPage(result));
}

CAMLexport CAMLprim value ml_gtk_stack_add_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkStackPage* result = gtk_stack_add_child(GtkStack_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkStackPage(result));
}

CAMLexport CAMLprim value ml_gtk_stack_get_hhomogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hhomogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_hhomogeneous: property 'hhomogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "hhomogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_set_hhomogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hhomogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_stack_set_hhomogeneous: property 'hhomogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "hhomogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_get_interpolate_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "interpolate-size");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_interpolate_size: property 'interpolate-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "interpolate-size", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_set_interpolate_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "interpolate-size");
if (pspec == NULL) caml_failwith("ml_gtk_stack_set_interpolate_size: property 'interpolate-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "interpolate-size", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_get_transition_duration(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "transition-duration");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_transition_duration: property 'transition-duration' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "transition-duration", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_set_transition_duration(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "transition-duration");
if (pspec == NULL) caml_failwith("ml_gtk_stack_set_transition_duration: property 'transition-duration' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "transition-duration", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_get_transition_running(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "transition-running");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_transition_running: property 'transition-running' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "transition-running", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_get_vhomogeneous(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "vhomogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_vhomogeneous: property 'vhomogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "vhomogeneous", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_set_vhomogeneous(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "vhomogeneous");
if (pspec == NULL) caml_failwith("ml_gtk_stack_set_vhomogeneous: property 'vhomogeneous' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "vhomogeneous", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_get_visible_child_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible-child-name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_get_visible_child_name: property 'visible-child-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "visible-child-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_set_visible_child_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStack *obj = (GtkStack *)GtkStack_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "visible-child-name");
if (pspec == NULL) caml_failwith("ml_gtk_stack_set_visible_child_name: property 'visible-child-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "visible-child-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
