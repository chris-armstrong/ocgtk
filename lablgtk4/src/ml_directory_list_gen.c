/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DirectoryList */

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

/* Type-specific conversion macros for GtkDirectoryList */
#define GtkDirectoryList_val(val) ((GtkDirectoryList*)ext_of_val(val))
#define Val_GtkDirectoryList(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_directory_list_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDirectoryList *obj = gtk_directory_list_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkDirectoryList(obj));
}

CAMLexport CAMLprim value ml_gtk_directory_list_is_loading(value self)
{
CAMLparam1(self);

gboolean result = gtk_directory_list_is_loading(GtkDirectoryList_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_attributes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "attributes", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_attributes(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "attributes", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_io_priority(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "io-priority", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_io_priority(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "io-priority", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_loading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "loading", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_monitored(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "monitored", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_monitored(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "monitored", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDirectoryList *obj = (GtkDirectoryList *)GtkDirectoryList_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
