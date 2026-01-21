/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringList */

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


CAMLexport CAMLprim value ml_gtk_string_list_new(value arg1)
{
CAMLparam1(arg1);
    int arg1_length = Wosize_val(arg1);
    char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = String_val(Field(arg1, i));
    }
    c_arg1[arg1_length] = NULL;

GtkStringList *obj = gtk_string_list_new(c_arg1);
if (obj) g_object_ref_sink(obj);

    g_free(c_arg1);
CAMLreturn(Val_GtkStringList(obj));
}
CAMLexport CAMLprim value ml_gtk_string_list_take(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_list_take(GtkStringList_val(self), String_copy(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_splice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
    int arg3_length = Wosize_val(arg3);
    char** c_arg3 = (char**)g_malloc(sizeof(char*) * (arg3_length + 1));
    for (int i = 0; i < arg3_length; i++) {
      c_arg3[i] = String_val(Field(arg3, i));
    }
    c_arg3[arg3_length] = NULL;

gtk_string_list_splice(GtkStringList_val(self), Int_val(arg1), Int_val(arg2), c_arg3);
    g_free(c_arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_list_remove(GtkStringList_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_string(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gtk_string_list_get_string(GtkStringList_val(self), Int_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_string_list_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_list_append(GtkStringList_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_n_items(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkStringList *obj = (GtkStringList *)GtkStringList_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-items");
if (pspec == NULL) caml_failwith("ml_gtk_string_list_get_n_items: property 'n-items' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "n-items", &prop_gvalue);
          prop_value = g_value_get_uint(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_string_list_get_strings(value self)
{
GtkStringList *obj = (GtkStringList *)GtkStringList_val(self);
CAMLparam1(self);
GValue prop_gvalue = G_VALUE_INIT;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "strings");
if (pspec == NULL) caml_failwith("ml_gtk_string_list_get_strings: property 'strings' not found");
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "strings", &prop_gvalue);
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