/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileFilter */

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


CAMLexport CAMLprim value ml_gtk_file_filter_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_file_filter_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_file_filter_new_from_gvariant(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_file_filter_new_from_gvariant(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_attributes(value self)
{
CAMLparam1(self);


    gtk_file_filter_get_attributes(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_suffix(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_filter_add_suffix(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pixbuf_formats(value self)
{
CAMLparam1(self);


    gtk_file_filter_add_pixbuf_formats(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pattern(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_filter_add_pattern(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_filter_add_mime_type(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_filter_set_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "name", c_value, NULL);
CAMLreturn(Val_unit);
}
