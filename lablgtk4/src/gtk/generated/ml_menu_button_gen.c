/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MenuButton */

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

/* Type-specific conversion macros for GtkMenuButton */
#ifndef Val_GtkMenuButton
#define GtkMenuButton_val(val) ((GtkMenuButton*)ext_of_val(val))
#define Val_GtkMenuButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMenuButton */


CAMLexport CAMLprim value ml_gtk_menu_button_new(value unit)
{
CAMLparam1(unit);
GtkMenuButton *obj = gtk_menu_button_new();
CAMLreturn(Val_GtkMenuButton(obj));
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_popover(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_menu_button_set_popover(GtkMenuButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_direction(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_menu_button_set_direction(GtkMenuButton_val(self), GtkArrowType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_menu_button_set_child(GtkMenuButton_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_popup(value self)
{
CAMLparam1(self);

gtk_menu_button_popup(GtkMenuButton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_popdown(value self)
{
CAMLparam1(self);

gtk_menu_button_popdown(GtkMenuButton_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_popover(value self)
{
CAMLparam1(self);

GtkPopover* result = gtk_menu_button_get_popover(GtkMenuButton_val(self));
CAMLreturn(Val_option(result, Val_GtkPopover));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_direction(value self)
{
CAMLparam1(self);

GtkArrowType result = gtk_menu_button_get_direction(GtkMenuButton_val(self));
CAMLreturn(Val_GtkArrowType(result));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_menu_button_get_child(GtkMenuButton_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_always_show_arrow(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "always-show-arrow");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_always_show_arrow: property 'always-show-arrow' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "always-show-arrow", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_always_show_arrow(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "always-show-arrow");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_always_show_arrow: property 'always-show-arrow' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "always-show-arrow", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_can_shrink(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-frame");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_has_frame: property 'has-frame' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-frame", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "label");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_label: property 'label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_primary(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "primary");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_primary: property 'primary' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "primary", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_primary(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "primary");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_primary: property 'primary' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "primary", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_get_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMenuButton *obj = (GtkMenuButton *)GtkMenuButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-underline");
if (pspec == NULL) caml_failwith("ml_gtk_menu_button_set_use_underline: property 'use-underline' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-underline", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
