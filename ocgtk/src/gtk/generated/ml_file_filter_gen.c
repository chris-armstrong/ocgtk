/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileFilter */

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

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_file_filter_new(value unit)
{
CAMLparam1(unit);

GtkFileFilter *obj = gtk_file_filter_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkFileFilter(obj));
}
CAMLexport CAMLprim value ml_gtk_file_filter_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_set_name(GtkFileFilter_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_name(value self)
{
CAMLparam1(self);

const char* result = gtk_file_filter_get_name(GtkFileFilter_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_attributes(value self)
{
CAMLparam1(self);

const char** result = gtk_file_filter_get_attributes(GtkFileFilter_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_suffix(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_suffix(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pixbuf_formats(value self)
{
CAMLparam1(self);

gtk_file_filter_add_pixbuf_formats(GtkFileFilter_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pattern(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_pattern(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_mime_type(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_mime_types(value self)
{
GtkFileFilter *obj = (GtkFileFilter *)GtkFileFilter_val(self);
CAMLparam1(self);
GValue prop_gvalue = G_VALUE_INIT;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "mime-types");
if (pspec == NULL) caml_failwith("ml_gtk_file_filter_get_mime_types: property 'mime-types' not found");
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "mime-types", &prop_gvalue);
utf8* c_result = (utf8*)g_value_get_boxed(&prop_gvalue);
int c_result_length = 0;
    while (c_result[c_result_length] != NULL) c_result_length++;
    CAMLlocal1(ml_c_result);
    ml_c_result = caml_alloc(c_result_length, 0);
    for (int i = 0; i < c_result_length; i++) {
      Store_field(ml_c_result, i, caml_copy_string(c_result[i]));
    }
g_value_unset(&prop_gvalue);
CAMLreturn(ml_c_result);
}
CAMLexport CAMLprim value ml_gtk_file_filter_get_patterns(value self)
{
GtkFileFilter *obj = (GtkFileFilter *)GtkFileFilter_val(self);
CAMLparam1(self);
GValue prop_gvalue = G_VALUE_INIT;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "patterns");
if (pspec == NULL) caml_failwith("ml_gtk_file_filter_get_patterns: property 'patterns' not found");
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "patterns", &prop_gvalue);
utf8* c_result = (utf8*)g_value_get_boxed(&prop_gvalue);
int c_result_length = 0;
    while (c_result[c_result_length] != NULL) c_result_length++;
    CAMLlocal1(ml_c_result);
    ml_c_result = caml_alloc(c_result_length, 0);
    for (int i = 0; i < c_result_length; i++) {
      Store_field(ml_c_result, i, caml_copy_string(c_result[i]));
    }
g_value_unset(&prop_gvalue);
CAMLreturn(ml_c_result);
}
CAMLexport CAMLprim value ml_gtk_file_filter_get_suffixes(value self)
{
GtkFileFilter *obj = (GtkFileFilter *)GtkFileFilter_val(self);
CAMLparam1(self);
GValue prop_gvalue = G_VALUE_INIT;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "suffixes");
if (pspec == NULL) caml_failwith("ml_gtk_file_filter_get_suffixes: property 'suffixes' not found");
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "suffixes", &prop_gvalue);
utf8* c_result = (utf8*)g_value_get_boxed(&prop_gvalue);
int c_result_length = 0;
    while (c_result[c_result_length] != NULL) c_result_length++;
    CAMLlocal1(ml_c_result);
    ml_c_result = caml_alloc(c_result_length, 0);
    for (int i = 0; i < c_result_length; i++) {
      Store_field(ml_c_result, i, caml_copy_string(c_result[i]));
    }
g_value_unset(&prop_gvalue);
CAMLreturn(ml_c_result);
}