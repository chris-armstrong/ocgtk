/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Builder */

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


CAMLexport CAMLprim value ml_gtk_builder_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_builder_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_file(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_builder_new_from_file(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_resource(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_builder_new_from_resource(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_string(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_builder_new_from_string(String_val(arg1), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_builder_value_from_string_type(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;


    gboolean result = gtk_builder_value_from_string_type(GtkWidget_val(self), arg1, String_val(arg2), arg3, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_value_from_string(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;


    gboolean result = gtk_builder_value_from_string(GtkWidget_val(self), arg1, String_val(arg2), arg3, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_set_scope(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_builder_set_scope(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_builder_set_current_object(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_builder_set_current_object(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_builder_get_scope(value self)
{
CAMLparam1(self);


    GtkBuilderScope* result = gtk_builder_get_scope(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_builder_extend_with_template(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;


    gboolean result = gtk_builder_extend_with_template(GtkWidget_val(self), arg1, arg2, String_val(arg3), arg4, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_expose_object(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_builder_expose_object(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_builder_add_objects_from_string(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;


    gboolean result = gtk_builder_add_objects_from_string(GtkWidget_val(self), String_val(arg1), arg2, arg3, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_objects_from_resource(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_builder_add_objects_from_resource(GtkWidget_val(self), String_val(arg1), arg2, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_objects_from_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_builder_add_objects_from_file(GtkWidget_val(self), String_val(arg1), arg2, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_from_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_builder_add_from_string(GtkWidget_val(self), String_val(arg1), arg2, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_builder_add_from_resource(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_builder_add_from_file(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_get_translation_domain(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "translation-domain", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_builder_set_translation_domain(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "translation-domain", c_value, NULL);
CAMLreturn(Val_unit);
}
