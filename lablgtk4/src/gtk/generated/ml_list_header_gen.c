/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListHeader */

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

/* Type-specific conversion macros for GtkListHeader */
#ifndef Val_GtkListHeader
#define GtkListHeader_val(val) ((GtkListHeader*)ext_of_val(val))
#define Val_GtkListHeader(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListHeader */


CAMLexport CAMLprim value ml_gtk_list_header_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_header_set_child(GtkListHeader_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_header_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_header_get_child(GtkListHeader_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_list_header_get_end(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListHeader *obj = (GtkListHeader *)GtkListHeader_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "end");
if (pspec == NULL) caml_failwith("ml_gtk_list_header_get_end: property 'end' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "end", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_header_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListHeader *obj = (GtkListHeader *)GtkListHeader_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_list_header_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_header_get_start(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListHeader *obj = (GtkListHeader *)GtkListHeader_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "start");
if (pspec == NULL) caml_failwith("ml_gtk_list_header_get_start: property 'start' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "start", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
