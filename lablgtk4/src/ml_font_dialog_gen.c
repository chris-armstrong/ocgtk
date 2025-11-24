/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialog */

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


CAMLexport CAMLprim value ml_gtk_font_dialog_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_font_dialog_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_language(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_dialog_set_language(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_font_map(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_dialog_set_font_map(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_dialog_set_filter(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_filter(value self)
{
CAMLparam1(self);


    GtkFilter* result = gtk_font_dialog_get_filter(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_font_and_features_finish(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;


    gboolean result = gtk_font_dialog_choose_font_and_features_finish(GtkWidget_val(self), arg1, arg2, arg3, arg4, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_font_and_features_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_font_dialog_choose_font_and_features(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_font_and_features_bytecode(value * argv, int argn)
{
return ml_gtk_font_dialog_choose_font_and_features_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_font_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_font_dialog_choose_font(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_font_bytecode(value * argv, int argn)
{
return ml_gtk_font_dialog_choose_font_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_family_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_font_dialog_choose_family(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_family_bytecode(value * argv, int argn)
{
return ml_gtk_font_dialog_choose_family_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_face_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_font_dialog_choose_face(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_choose_face_bytecode(value * argv, int argn)
{
return ml_gtk_font_dialog_choose_face_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}
