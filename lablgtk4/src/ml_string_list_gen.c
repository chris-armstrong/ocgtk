/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringList */

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


CAMLexport CAMLprim value ml_gtk_string_list_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_string_list_new(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_string_list_take(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_list_take(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_splice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_string_list_splice(GtkWidget_val(self), Int_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_list_remove(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_string(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_string_list_get_string(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_string_list_append(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_list_append(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
