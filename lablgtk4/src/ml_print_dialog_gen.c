/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintDialog */

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

/* Type-specific conversion macros for GtkPrintDialog */
#define GtkPrintDialog_val(val) ((GtkPrintDialog*)ext_of_val(val))
#define Val_GtkPrintDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_print_dialog_new(value unit)
{
CAMLparam1(unit);
GtkPrintDialog *obj = gtk_print_dialog_new();
CAMLreturn(Val_GtkPrintDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_print_settings(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_dialog_set_print_settings(GtkPrintDialog_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_page_setup(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_dialog_set_page_setup(GtkPrintDialog_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_print_settings(value self)
{
CAMLparam1(self);

GtkPrintSettings* result = gtk_print_dialog_get_print_settings(GtkPrintDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_page_setup(value self)
{
CAMLparam1(self);

GtkPageSetup* result = gtk_print_dialog_get_page_setup(GtkPrintDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_accept_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "accept-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_accept_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "accept-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_dialog_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintDialog *obj = (GtkPrintDialog *)GtkPrintDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}
