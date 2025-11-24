/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BookmarkList */

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

/* Type-specific conversion macros for GtkBookmarkList */
#define GtkBookmarkList_val(val) ((GtkBookmarkList*)ext_of_val(val))
#define Val_GtkBookmarkList(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_bookmark_list_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBookmarkList *obj = gtk_bookmark_list_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkBookmarkList(obj));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_is_loading(value self)
{
CAMLparam1(self);


    gboolean result = gtk_bookmark_list_is_loading(GtkBookmarkList_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_attributes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "attributes", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_attributes(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "attributes", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "filename", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_io_priority(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "io-priority", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_io_priority(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "io-priority", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_loading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "loading", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
