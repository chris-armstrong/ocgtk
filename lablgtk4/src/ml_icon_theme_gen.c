/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconTheme */

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


CAMLexport CAMLprim value ml_gtk_icon_theme_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_icon_theme_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_search_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_theme_set_search_path(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_theme_set_resource_path(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_icon_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    GtkIconPaintable* result = gtk_icon_theme_lookup_icon(GtkWidget_val(self), String_val(arg1), arg2, Int_val(arg3), Int_val(arg4), GtkTextDirection_val(arg5), GtkIconLookupFlags_val(arg6));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_icon_bytecode(value * argv, int argn)
{
return ml_gtk_icon_theme_lookup_icon_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_by_gicon_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    GtkIconPaintable* result = gtk_icon_theme_lookup_by_gicon(GtkWidget_val(self), arg1, Int_val(arg2), Int_val(arg3), GtkTextDirection_val(arg4), GtkIconLookupFlags_val(arg5));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_lookup_by_gicon_bytecode(value * argv, int argn)
{
return ml_gtk_icon_theme_lookup_by_gicon_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_has_icon(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_icon_theme_has_icon(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_has_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_icon_theme_has_gicon(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_search_path(value self)
{
CAMLparam1(self);


    gtk_icon_theme_get_search_path(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_resource_path(value self)
{
CAMLparam1(self);


    gtk_icon_theme_get_resource_path(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_sizes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_theme_get_icon_sizes(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_names(value self)
{
CAMLparam1(self);


    gtk_icon_theme_get_icon_names(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_search_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_theme_add_search_path(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_icon_theme_add_resource_path(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "theme-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_theme_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "theme-name", c_value, NULL);
CAMLreturn(Val_unit);
}
