/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RecentManager */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_recent_manager_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_recent_manager_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_remove_item(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_recent_manager_remove_item(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_purge_items(value self)
{
CAMLparam1(self);
GError *error = NULL;


    int result = gtk_recent_manager_purge_items(GtkWidget_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_move_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_recent_manager_move_item(GtkWidget_val(self), String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_lookup_item(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    GtkRecentInfo* result = gtk_recent_manager_lookup_item(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GtkWidget(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_has_item(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_recent_manager_has_item(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_add_item(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_recent_manager_add_item(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_add_full(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_recent_manager_add_full(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_recent_manager_get_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "filename", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_recent_manager_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
