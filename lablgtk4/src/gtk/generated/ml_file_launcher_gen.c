/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileLauncher */

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

/* Type-specific conversion macros for GtkFileLauncher */
#ifndef Val_GtkFileLauncher
#define GtkFileLauncher_val(val) ((GtkFileLauncher*)ext_of_val(val))
#define Val_GtkFileLauncher(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileLauncher */


CAMLexport CAMLprim value ml_gtk_file_launcher_new(value arg1)
{
CAMLparam1(arg1);
GtkFileLauncher *obj = gtk_file_launcher_new(arg1);
CAMLreturn(Val_GtkFileLauncher(obj));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_always_ask(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "always-ask");
if (pspec == NULL) caml_failwith("ml_gtk_file_launcher_get_always_ask: property 'always-ask' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "always-ask", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_always_ask(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "always-ask");
if (pspec == NULL) caml_failwith("ml_gtk_file_launcher_set_always_ask: property 'always-ask' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "always-ask", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_writable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "writable");
if (pspec == NULL) caml_failwith("ml_gtk_file_launcher_get_writable: property 'writable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "writable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_writable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "writable");
if (pspec == NULL) caml_failwith("ml_gtk_file_launcher_set_writable: property 'writable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "writable", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
