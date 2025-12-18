/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ApplicationWindow */

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

/* Type-specific conversion macros for GtkApplicationWindow */
#ifndef Val_GtkApplicationWindow
#define GtkApplicationWindow_val(val) ((GtkApplicationWindow*)ext_of_val(val))
#define Val_GtkApplicationWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkApplicationWindow */


CAMLexport CAMLprim value ml_gtk_application_window_new(value arg1)
{
CAMLparam1(arg1);
GtkApplicationWindow *obj = gtk_application_window_new(GtkApplication_val(arg1));
CAMLreturn(Val_GtkApplicationWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_application_window_set_help_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_window_set_help_overlay(GtkApplicationWindow_val(self), Option_val(arg1, GtkShortcutsWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_window_get_id(value self)
{
CAMLparam1(self);

guint result = gtk_application_window_get_id(GtkApplicationWindow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_application_window_get_help_overlay(value self)
{
CAMLparam1(self);

GtkShortcutsWindow* result = gtk_application_window_get_help_overlay(GtkApplicationWindow_val(self));
CAMLreturn(Val_option(result, Val_GtkShortcutsWindow));
}

CAMLexport CAMLprim value ml_gtk_application_window_get_show_menubar(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkApplicationWindow *obj = (GtkApplicationWindow *)GtkApplicationWindow_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-menubar");
if (pspec == NULL) caml_failwith("ml_gtk_application_window_get_show_menubar: property 'show-menubar' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-menubar", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_application_window_set_show_menubar(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkApplicationWindow *obj = (GtkApplicationWindow *)GtkApplicationWindow_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-menubar");
if (pspec == NULL) caml_failwith("ml_gtk_application_window_set_show_menubar: property 'show-menubar' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-menubar", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
