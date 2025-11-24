/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Dialog */

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

/* Type-specific conversion macros for GtkDialog */
#define GtkDialog_val(val) ((GtkDialog*)ext_of_val(val))
#define Val_GtkDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_dialog_new(value unit)
{
CAMLparam1(unit);
GtkDialog *obj = gtk_dialog_new();
CAMLreturn(Val_GtkDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_dialog_new_with_buttons(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GtkDialog *obj = gtk_dialog_new_with_buttons((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), GtkDialogFlags_val(arg3), (Is_some(arg4) ? String_val(Some_val(arg4)) : NULL), arg5);
CAMLreturn(Val_GtkDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_dialog_set_response_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_dialog_set_response_sensitive(GtkDialog_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_dialog_set_default_response(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_dialog_set_default_response(GtkDialog_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_dialog_response(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_dialog_response(GtkDialog_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_dialog_get_widget_for_response(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkWidget* result = gtk_dialog_get_widget_for_response(GtkDialog_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_dialog_get_response_for_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_dialog_get_response_for_widget(GtkDialog_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_dialog_get_header_bar(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_dialog_get_header_bar(GtkDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_dialog_get_content_area(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_dialog_get_content_area(GtkDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_dialog_add_button(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkWidget* result = gtk_dialog_add_button(GtkDialog_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_dialog_add_action_widget(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_dialog_add_action_widget(GtkDialog_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_dialog_get_use_header_bar(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDialog *obj = (GtkDialog *)GtkDialog_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "use-header-bar", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
