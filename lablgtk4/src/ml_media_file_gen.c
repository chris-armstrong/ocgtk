/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaFile */

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


CAMLexport CAMLprim value ml_gtk_media_file_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_media_file_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_file(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_media_file_new_for_file(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_filename(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_media_file_new_for_filename(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_input_stream(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_media_file_new_for_input_stream(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_media_file_new_for_resource(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_file_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_file_set_resource(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_set_input_stream(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_file_set_input_stream(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_set_filename(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_file_set_filename(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_set_file(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_file_set_file(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_clear(value self)
{
CAMLparam1(self);


    gtk_media_file_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}
