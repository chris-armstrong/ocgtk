/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextTagTable */

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


CAMLexport CAMLprim value ml_gtk_text_tag_table_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_tag_table_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_tag_table_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextTag* result = gtk_text_tag_table_lookup(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_get_size(value self)
{
CAMLparam1(self);


    int result = gtk_text_tag_table_get_size(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_tag_table_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_add(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_tag_table_add(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}
