/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionBar */

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

/* Type-specific conversion macros for GtkActionBar */
#ifndef Val_GtkActionBar
#define GtkActionBar_val(val) ((GtkActionBar*)ext_of_val(val))
#define Val_GtkActionBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkActionBar */


CAMLexport CAMLprim value ml_gtk_action_bar_new(value unit)
{
CAMLparam1(unit);
GtkActionBar *obj = gtk_action_bar_new();
CAMLreturn(Val_GtkActionBar(obj));
}

CAMLexport CAMLprim value ml_gtk_action_bar_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_action_bar_set_center_widget(GtkActionBar_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_action_bar_remove(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_pack_start(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_action_bar_pack_start(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_pack_end(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_action_bar_pack_end(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_get_center_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_action_bar_get_center_widget(GtkActionBar_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_action_bar_get_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkActionBar *obj = (GtkActionBar *)GtkActionBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "revealed");
if (pspec == NULL) caml_failwith("ml_gtk_action_bar_get_revealed: property 'revealed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "revealed", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_action_bar_set_revealed(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkActionBar *obj = (GtkActionBar *)GtkActionBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "revealed");
if (pspec == NULL) caml_failwith("ml_gtk_action_bar_set_revealed: property 'revealed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "revealed", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
