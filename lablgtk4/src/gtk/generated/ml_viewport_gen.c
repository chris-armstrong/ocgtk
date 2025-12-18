/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Viewport */

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

/* Type-specific conversion macros for GtkViewport */
#ifndef Val_GtkViewport
#define GtkViewport_val(val) ((GtkViewport*)ext_of_val(val))
#define Val_GtkViewport(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkViewport */


CAMLexport CAMLprim value ml_gtk_viewport_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkViewport *obj = gtk_viewport_new(Option_val(arg1, GtkAdjustment_val, NULL), Option_val(arg2, GtkAdjustment_val, NULL));
CAMLreturn(Val_GtkViewport(obj));
}

CAMLexport CAMLprim value ml_gtk_viewport_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_viewport_set_child(GtkViewport_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_viewport_scroll_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_viewport_scroll_to(GtkViewport_val(self), GtkWidget_val(arg1), Option_val(arg2, GtkScrollInfo_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_viewport_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_viewport_get_child(GtkViewport_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_viewport_get_scroll_to_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkViewport *obj = (GtkViewport *)GtkViewport_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scroll-to-focus");
if (pspec == NULL) caml_failwith("ml_gtk_viewport_get_scroll_to_focus: property 'scroll-to-focus' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "scroll-to-focus", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_viewport_set_scroll_to_focus(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkViewport *obj = (GtkViewport *)GtkViewport_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scroll-to-focus");
if (pspec == NULL) caml_failwith("ml_gtk_viewport_set_scroll_to_focus: property 'scroll-to-focus' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "scroll-to-focus", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
