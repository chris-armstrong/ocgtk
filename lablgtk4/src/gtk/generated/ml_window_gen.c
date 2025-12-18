/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Window */

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

/* Type-specific conversion macros for GtkWindow */
#ifndef Val_GtkWindow
#define GtkWindow_val(val) ((GtkWindow*)ext_of_val(val))
#define Val_GtkWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWindow */


CAMLexport CAMLprim value ml_gtk_window_new(value unit)
{
CAMLparam1(unit);
GtkWindow *obj = gtk_window_new();
CAMLreturn(Val_GtkWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_window_unminimize(value self)
{
CAMLparam1(self);

gtk_window_unminimize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_unmaximize(value self)
{
CAMLparam1(self);

gtk_window_unmaximize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_unfullscreen(value self)
{
CAMLparam1(self);

gtk_window_unfullscreen(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_transient_for(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_transient_for(GtkWindow_val(self), Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_titlebar(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_titlebar(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_focus(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_focus(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_default_widget(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_window_set_default_size(GtkWindow_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_child(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_application(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_application(GtkWindow_val(self), Option_val(arg1, GtkApplication_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_present(value self)
{
CAMLparam1(self);

gtk_window_present(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_minimize(value self)
{
CAMLparam1(self);

gtk_window_minimize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_maximize(value self)
{
CAMLparam1(self);

gtk_window_maximize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_is_suspended(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_suspended(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_is_maximized(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_maximized(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_is_fullscreen(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_fullscreen(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_has_group(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_has_group(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_transient_for(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_window_get_transient_for(GtkWindow_val(self));
CAMLreturn(Val_option(result, Val_GtkWindow));
}

CAMLexport CAMLprim value ml_gtk_window_get_titlebar(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_titlebar(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_group(value self)
{
CAMLparam1(self);

GtkWindowGroup* result = gtk_window_get_group(GtkWindow_val(self));
CAMLreturn(Val_GtkWindowGroup(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_focus(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_focus(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_default_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_default_widget(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_child(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_application(value self)
{
CAMLparam1(self);

GtkApplication* result = gtk_window_get_application(GtkWindow_val(self));
CAMLreturn(Val_option(result, Val_GtkApplication));
}

CAMLexport CAMLprim value ml_gtk_window_fullscreen(value self)
{
CAMLparam1(self);

gtk_window_fullscreen(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_destroy(value self)
{
CAMLparam1(self);

gtk_window_destroy(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_close(value self)
{
CAMLparam1(self);

gtk_window_close(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_decorated(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "decorated");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_decorated: property 'decorated' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "decorated", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_decorated(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "decorated");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_decorated: property 'decorated' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "decorated", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_default_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-height");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_default_height: property 'default-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "default-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-height");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_default_height: property 'default-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "default-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_default_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-width");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_default_width: property 'default-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "default-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "default-width");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_default_width: property 'default-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "default-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_deletable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "deletable");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_deletable: property 'deletable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "deletable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_deletable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "deletable");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_deletable: property 'deletable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "deletable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_destroy_with_parent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "destroy-with-parent");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_destroy_with_parent: property 'destroy-with-parent' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "destroy-with-parent", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_destroy_with_parent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "destroy-with-parent");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_destroy_with_parent: property 'destroy-with-parent' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "destroy-with-parent", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_focus_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focus-visible");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_focus_visible: property 'focus-visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "focus-visible", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_focus_visible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "focus-visible");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_focus_visible: property 'focus-visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "focus-visible", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_fullscreened(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fullscreened");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_fullscreened: property 'fullscreened' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "fullscreened", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_fullscreened(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "fullscreened");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_fullscreened: property 'fullscreened' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "fullscreened", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_handle_menubar_accel(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "handle-menubar-accel");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_handle_menubar_accel: property 'handle-menubar-accel' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "handle-menubar-accel", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_handle_menubar_accel(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "handle-menubar-accel");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_handle_menubar_accel: property 'handle-menubar-accel' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "handle-menubar-accel", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_hide_on_close(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hide-on-close");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_hide_on_close: property 'hide-on-close' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "hide-on-close", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_hide_on_close(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "hide-on-close");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_hide_on_close: property 'hide-on-close' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "hide-on-close", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_is_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "is-active");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_is_active: property 'is-active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "is-active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_get_maximized(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "maximized");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_maximized: property 'maximized' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "maximized", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_maximized(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "maximized");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_maximized: property 'maximized' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "maximized", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_mnemonics_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "mnemonics-visible");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_mnemonics_visible: property 'mnemonics-visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "mnemonics-visible", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_mnemonics_visible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "mnemonics-visible");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_mnemonics_visible: property 'mnemonics-visible' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "mnemonics-visible", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "modal", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_modal(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "modal", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_resizable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resizable");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_resizable: property 'resizable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "resizable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_resizable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "resizable");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_resizable: property 'resizable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "resizable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_startup_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "startup-id");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_startup_id: property 'startup-id' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "startup-id", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_startup_id(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "startup-id");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_startup_id: property 'startup-id' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "startup-id", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_get_suspended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "suspended");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_suspended: property 'suspended' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "suspended", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_window_get_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "title", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_set_title(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWindow *obj = (GtkWindow *)GtkWindow_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_window_set_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "title", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
