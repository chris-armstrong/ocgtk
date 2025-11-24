/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooserDialog */

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


CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_app_chooser_dialog_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkDialogFlags_val(arg2), arg3);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_new_for_content_type(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_app_chooser_dialog_new_for_content_type((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkDialogFlags_val(arg2), String_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_app_chooser_dialog_get_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_get_heading(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "heading", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_dialog_set_heading(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "heading", c_value, NULL);
CAMLreturn(Val_unit);
}
