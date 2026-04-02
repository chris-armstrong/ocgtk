/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutController */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"


CAMLexport CAMLprim value ml_gtk_shortcut_controller_new(value unit)
{
CAMLparam1(unit);

GtkShortcutController *obj = gtk_shortcut_controller_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkShortcutController(obj));
}
CAMLexport CAMLprim value ml_gtk_shortcut_controller_new_for_model(value arg1)
{
CAMLparam1(arg1);

GtkShortcutController *obj = gtk_shortcut_controller_new_for_model(GListModel_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkShortcutController(obj));
}
CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_scope(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_set_scope(GtkShortcutController_val(self), GtkShortcutScope_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_mnemonics_modifiers(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_set_mnemonics_modifiers(GtkShortcutController_val(self), GdkModifierType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_remove_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_remove_shortcut(GtkShortcutController_val(self), GtkShortcut_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_scope(value self)
{
CAMLparam1(self);

GtkShortcutScope result = gtk_shortcut_controller_get_scope(GtkShortcutController_val(self));
CAMLreturn(Val_GtkShortcutScope(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_mnemonics_modifiers(value self)
{
CAMLparam1(self);

GdkModifierType result = gtk_shortcut_controller_get_mnemonics_modifiers(GtkShortcutController_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_shortcut_controller_add_shortcut(GtkShortcutController_val(self), GtkShortcut_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_mnemonic_modifiers(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkShortcutController *obj = (GtkShortcutController *)GtkShortcutController_val(self);
    GdkModifierType prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "mnemonic-modifiers");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_controller_get_mnemonic_modifiers: property 'mnemonic-modifiers' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "mnemonic-modifiers", &prop_gvalue);
          prop_value = (GdkModifierType)g_value_get_flags(&prop_gvalue);

      result = Val_GdkModifierType(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_set_mnemonic_modifiers(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkShortcutController *obj = (GtkShortcutController *)GtkShortcutController_val(self);
    GdkModifierType c_value = GdkModifierType_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "mnemonic-modifiers");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_controller_set_mnemonic_modifiers: property 'mnemonic-modifiers' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_flags(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "mnemonic-modifiers", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_model(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkShortcutController *obj = (GtkShortcutController *)GtkShortcutController_val(self);
    GListModel *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "model");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_controller_get_model: property 'model' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "model", &prop_gvalue);
          caml_failwith("unsupported property type");

      result = Val_GListModel(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

#if GTK_CHECK_VERSION(4,8,0)

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_n_items(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkShortcutController *obj = (GtkShortcutController *)GtkShortcutController_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_controller_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
          prop_value = g_value_get_uint(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

#else

CAMLexport CAMLprim value ml_gtk_shortcut_controller_get_n_items(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("ShortcutController requires GTK >= 4.8");
return Val_unit;
}
#endif
