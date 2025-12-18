/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BookmarkList */

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

/* Type-specific conversion macros for GtkBookmarkList */
#ifndef Val_GtkBookmarkList
#define GtkBookmarkList_val(val) ((GtkBookmarkList*)ext_of_val(val))
#define Val_GtkBookmarkList(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBookmarkList */


CAMLexport CAMLprim value ml_gtk_bookmark_list_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBookmarkList *obj = gtk_bookmark_list_new(String_option_val(arg1), String_option_val(arg2));
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
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "attributes");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_get_attributes: property 'attributes' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "attributes", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_attributes(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "attributes");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_set_attributes: property 'attributes' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "attributes", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "filename");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_get_filename: property 'filename' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "filename", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_io_priority(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "io-priority");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_get_io_priority: property 'io-priority' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "io-priority", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_set_io_priority(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "io-priority");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_set_io_priority: property 'io-priority' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "io-priority", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_loading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "loading");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_get_loading: property 'loading' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "loading", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bookmark_list_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBookmarkList *obj = (GtkBookmarkList *)GtkBookmarkList_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_bookmark_list_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
