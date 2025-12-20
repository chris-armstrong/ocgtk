/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RecentManager */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkRecentManager */
#ifndef Val_GtkRecentManager
#define GtkRecentManager_val(val) ((GtkRecentManager*)ext_of_val(val))
#define Val_GtkRecentManager(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkRecentManager */


CAMLexport CAMLprim value ml_gtk_recent_manager_new(value unit)
{
CAMLparam1(unit);
GtkRecentManager *obj = gtk_recent_manager_new();
CAMLreturn(Val_GtkRecentManager(obj));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_remove_item(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_recent_manager_remove_item(GtkRecentManager_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_purge_items(value self)
{
CAMLparam1(self);
GError *error = NULL;

int result = gtk_recent_manager_purge_items(GtkRecentManager_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_move_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = gtk_recent_manager_move_item(GtkRecentManager_val(self), String_val(arg1), String_option_val(arg2), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_lookup_item(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GtkRecentInfo* result = gtk_recent_manager_lookup_item(GtkRecentManager_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_option(result, Val_GtkRecentInfo))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_has_item(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_recent_manager_has_item(GtkRecentManager_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_add_item(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_recent_manager_add_item(GtkRecentManager_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_get_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRecentManager *obj = (GtkRecentManager *)GtkRecentManager_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "filename");
if (pspec == NULL) caml_failwith("ml_gtk_recent_manager_get_filename: property 'filename' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "filename", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_recent_manager_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRecentManager *obj = (GtkRecentManager *)GtkRecentManager_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size");
if (pspec == NULL) caml_failwith("ml_gtk_recent_manager_get_size: property 'size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "size", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
