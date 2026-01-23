/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconTheme */

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


CAMLexport CAMLprim value ml_gtk_icon_theme_new(value unit)
{
CAMLparam1(unit);

GtkIconTheme *obj = gtk_icon_theme_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkIconTheme(obj));
}
CAMLexport CAMLprim value ml_gtk_icon_theme_set_theme_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_set_theme_name(GtkIconTheme_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);
    char** c_arg1 = NULL;
    
    if (Is_some(arg1)) {
        value array = Some_val(arg1);
        int arg1_length = Wosize_val(array);
        c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
        for (int i = 0; i < arg1_length; i++) {
          c_arg1[i] = String_val(Field(array, i));
        }
        c_arg1[arg1_length] = NULL;
    }

gtk_icon_theme_set_resource_path(GtkIconTheme_val(self), c_arg1);
    if (c_arg1) g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_icon_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);
    char** c_arg2 = NULL;
    
    if (Is_some(arg2)) {
        value array = Some_val(arg2);
        int arg2_length = Wosize_val(array);
        c_arg2 = (char**)g_malloc(sizeof(char*) * (arg2_length + 1));
        for (int i = 0; i < arg2_length; i++) {
          c_arg2[i] = String_val(Field(array, i));
        }
        c_arg2[arg2_length] = NULL;
    }

GtkIconPaintable* result = gtk_icon_theme_lookup_icon(GtkIconTheme_val(self), String_val(arg1), c_arg2, Int_val(arg3), Int_val(arg4), GtkTextDirection_val(arg5), GtkIconLookupFlags_val(arg6));
    if (c_arg2) g_free(c_arg2);
CAMLreturn(Val_GtkIconPaintable(result));}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_icon_bytecode(value * argv, int argn)
{
return ml_gtk_icon_theme_lookup_icon_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_has_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_icon_theme_has_icon(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_theme_name(value self)
{
CAMLparam1(self);

char* result = gtk_icon_theme_get_theme_name(GtkIconTheme_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_resource_path(value self)
{
CAMLparam1(self);

char** result = gtk_icon_theme_get_resource_path(GtkIconTheme_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_sizes(value self, value arg1)
{
CAMLparam2(self, arg1);

int* result = gtk_icon_theme_get_icon_sizes(GtkIconTheme_val(self), String_val(arg1));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, Val_int(result[i]));
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_names(value self)
{
CAMLparam1(self);

char** result = gtk_icon_theme_get_icon_names(GtkIconTheme_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_search_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_search_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_resource_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
